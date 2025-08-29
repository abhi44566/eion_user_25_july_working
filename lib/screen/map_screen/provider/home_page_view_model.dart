import 'dart:async';
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:driver_suvidha_user/component/confimation_box.dart';
import 'package:driver_suvidha_user/import.dart';
import 'package:driver_suvidha_user/provider/data/response/api_params_model.dart';
import 'package:driver_suvidha_user/screen/map_screen/navigate_map_screen.dart';
import 'package:driver_suvidha_user/screen/map_screen/provider/map_view_model.dart';
import 'package:driver_suvidha_user/screen/map_screen/provider/model/create_booking_model.dart';
import 'package:driver_suvidha_user/screen/map_screen/provider/model/get_fev_address_list_model.dart';
import 'package:driver_suvidha_user/screen/map_screen/provider/model/get_order_detail_model.dart';
import 'package:driver_suvidha_user/screen/map_screen/provider/model/get_rental_model.dart';
import 'package:driver_suvidha_user/screen/map_screen/provider/model/home_page_model.dart';
import 'package:driver_suvidha_user/screen/map_screen/provider/model/outstation_model.dart';
import 'package:driver_suvidha_user/screen/map_screen/provider/model/proceed_cab_flexy_model.dart';
import 'package:driver_suvidha_user/screen/map_screen/provider/reposotory.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:intl/intl.dart';
import 'package:app_settings/app_settings.dart';
import '../../setting/my_account/update_my_account.dart';

class HomePageViewModel extends ChangeNotifier {
  final _myRepo = HomeRepository();
  GetFevAddressListModel getFevAddressRes = GetFevAddressListModel();
  bool isLoading = false;
  bool isOrderLoading = false;
  bool isMapLoading = false;
  HomePageModel? homePageRes;
  ProceedCabFlexyModel? FlexyRes;
  GetRentalModel? rentalRes;
  OutstationModel? OutstationRes;
  CreateBookingModel? createBookingRes;
  GetOrderDetailModel? getOrderDetailRes;
  TimeOfDay? selectedTime;
  TimeOfDay? returnTime;
  DateTime? pickUpDate;
  DateTime? returnDate;
  int selectedRoundTripIndex = 0;
  bool searchingForDriver = false;
  bool isHeader = true;
  bool isPickUpLocation = false;
  bool bookNowButton = true;
  bool isTrackStatus = false;
  int selectedOneWayIndex = 0;
  bool isProceed = true;
  bool isPickupDropDate = false;
  bool isOneWayRoundTrip = false;
  bool isSelectHrs = false;
  bool isFlexy = false;
  bool isRental = false;
  bool isOutstation = false;
  Position? _position;
  String? _address;
  String? selectedDropAddress;
  GoogleMapController? _mapController;
  GoogleMapController? get mapController => _mapController;

  Set<Marker> _markers = {};
  Set<Marker> get markers => _markers;

  Position? get position => _position;
  String? get address => _address;
  final AudioPlayer _audioPlayer = AudioPlayer();
  final StreamController<GetOrderDetailModel> _orderStreamController =
      StreamController.broadcast();
  Stream<GetOrderDetailModel> get orderStream => _orderStreamController.stream;

  TextEditingController couponCodeController = TextEditingController();
  void setMapController(GoogleMapController controller) {
    _mapController = controller;
  }

  void resetOrderDetails() {
    if (getOrderDetailRes?.response != null) {
      getOrderDetailRes?.response = null;
    }
  }

  void setIsRental(bool rental) {
    isRental = rental;
    notifyListeners();
  }

  List<String> tripTypeList = ['One Way', 'Round Trip'];
  void setTripType(int index) {
    selectedRoundTripIndex = index;
    notifyListeners();
  }

  String getFormattedDate(DateTime? date) {
    if (date != null) {
      return DateFormat('yyyy-MM-dd').format(date);
    }
    return "";
  }

  Future<void> pickTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );

    selectedTime =
        pickedTime ?? TimeOfDay.now(); // Use picked time or current time
    print("Selected Time: ${formatTimeOfDay(selectedTime)}"); // Debugging
    notifyListeners();
  }

  Future<void> selectReturnTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: returnTime ?? TimeOfDay.now(),
    );

    // returnTime = pickedTime ?? TimeOfDay.now();
    if (pickedTime != null) {
      returnTime = pickedTime;
    }
    notifyListeners();
  }

  void setSelectedTime(TimeOfDay time) {
    selectedTime = time;
    returnTime = time;
    print("Formatted Time: ${formatTimeOfDay(time)}"); // Debugging
    notifyListeners();
  }

  String formatTimeOfDay(TimeOfDay? time) {
    final now = DateTime.now();
    final selectedDateTime = DateTime(
      now.year,
      now.month,
      now.day,
      time?.hour ?? now.hour,
      time?.minute ?? now.minute,
    );
    return DateFormat('HH:mm:ss').format(selectedDateTime);
  }

  Future<void> selectDate(BuildContext context) async {
    DateTime now = DateTime.now();
    DateTime twoYearsLater = DateTime(now.year + 2, now.month, now.day);
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: pickUpDate ?? now,
      firstDate: DateTime(now.year, now.month, now.day), // Today
      lastDate: twoYearsLater, // Up to 2 years from today
    );

    if (pickedDate != null) {
      pickUpDate = DateTime(
          pickedDate.year, pickedDate.month, pickedDate.day); // Strip time
      notifyListeners();
    }
  }

  Future<void> selectReturnDate(BuildContext context) async {
    DateTime now = DateTime.now();
    DateTime twoMonthsLater = DateTime(now.year, now.month + 2, now.day);
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: returnDate ?? now,
      firstDate: DateTime(now.year, now.month, now.day), // Today
      lastDate: twoMonthsLater,
    );
    if (pickedDate != null) {
      returnDate = DateTime(
          pickedDate.year, pickedDate.month, pickedDate.day); // Strip time
      notifyListeners();
    }
  }

  Future<Position> getCurrentPosition(BuildContext context) async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        throw Exception('Location permission is required to continue.');
      }
    }

    // Step 2: Check if location services are enabled
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      bool retry = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: AppColor.appColor,
          title: Text(
            'Location Required',
            style: TextStyle(color: Colors.white),
          ),
          content: Text(
            'Please enable location services in settings to continue.',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            TextButton(
              onPressed: () async {
                await AppSettings.openAppSettings(
                    type: AppSettingsType.location);
                Navigator.pop(context);
              },
              child: Text('Go to Settings'),
            ),
          ],
        ),
      );

      if (retry == false) {
        throw Exception('Location service is required.');
      }
      // Step 3: Wait until location service is enabled after returning
      while (!await Geolocator.isLocationServiceEnabled()) {
        await Future.delayed(Duration(seconds: 1));
      }
    }

    // Step 4: Get current location
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  Future<String> getAddressFromLatLng(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks.first;
    return "${place.name}, ${place.locality}, ${place.administrativeArea}, ${place.country}";
  }


  Future<dynamic> getHomePageApi(BuildContext context) async {
    final userId = await MySharedPreferences.getUserId();
    String? token = '';
    String? fullName = await MySharedPreferences.getFullName();


    print('✅ APNs Token: $token');
    if (Platform.isIOS) {
      String? token = await FirebaseMessaging.instance.getAPNSToken();
      print('✅ APNs Token: $token');
    }else{
      String? token = await FirebaseMessaging.instance.getToken();
      print('✅ FCM Token: $token');

    }


    isLoading = true;
    isMapLoading = true;
    notifyListeners();
    _position = await getCurrentPosition(context);
    _address = await getAddressFromLatLng(_position!);
    notifyListeners();
    try {

      homePageRes = await _myRepo.getHomePageRepo(
          ApiParamsModels.homePageParam(userId, _position!.latitude.toString(),
              _position!.longitude.toString(), Platform.isAndroid?"android":'ios', token),
          context);

      if (ApiStatus.status == true) {
        isMapLoading = false;
        isLoading = false;
        if (fullName == '') {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => UpdateMyAccount()));
        }
      }
    } catch (e) {
      print('Error in getHomePageApi: $e');
    } finally {
      isMapLoading = false;
      isLoading = false;
      notifyListeners();
    }
  }

  Future<dynamic> proceedFlexyApi(data, BuildContext context) async {
    isLoading = true;
    notifyListeners();
    try {
      FlexyRes = await _myRepo.proceedFexyRepo(data, context);
      if (FlexyRes?.response?.status == false) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => Dialog(
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            child: ConfimationBox(
              msg: '${FlexyRes?.response?.msg}',
            ),
          ),
        );
      }
      notifyListeners();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<dynamic> proceedRentalApi(data, BuildContext context) async {
    isLoading = true;
    notifyListeners();
    try {
      rentalRes = await _myRepo.proceedRentalRepo(data, context);
      if (ApiStatus.status == true) {
        ApiStatus.setCouponCode = '';

        notifyListeners();
      } else {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => Dialog(
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            child: ConfimationBox(
              msg: '${rentalRes?.response?.msg}',
            ),
          ),
        );
      }
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<dynamic> proceedOutstationApi(data, BuildContext context) async {
    isLoading = true;
    notifyListeners();
    try {
      OutstationRes = await _myRepo.proceedOutstationRepo(data, context);
      if (ApiStatus.status == true) {
        ApiStatus.setCouponCode = '';
        notifyListeners();
      } else {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => Dialog(
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            child: ConfimationBox(
              msg: '${OutstationRes?.response?.msg}',
            ),
          ),
        );
      }
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  bool couponSuccess = false;
  Future<dynamic> couponCode(data, BuildContext context) async {
    couponSuccess = false;
    try {
      var res = await _myRepo.proceedCouponRepo(data, context);
      if (ApiStatus.status == true) {
        couponSuccess = true;
        ApiStatus.setCouponCode = '${res['response']['coupon_code']}';
        print('ApiStatus.setCouponCode----->${ApiStatus.setCouponCode}');
        notifyListeners();

        Utils.toastMessage("${res['response']['msg']}");
      } else {
        Utils.toastMessage("${res['response']['msg']}");
      }
    } catch (e) {}
  }

  Future<dynamic> createBookingApi(data, BuildContext context) async {
    final userName = await MySharedPreferences.getFullName();
    if (userName == '') {
      Utils.toastMessage("Please Update Your Profile First");
      return await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => UpdateMyAccount()),
      );
    }
    isLoading = true;
    notifyListeners();
    try {
      createBookingRes = await _myRepo.createBookingRepo(data, context);
      if (ApiStatus.status == true) {
        ApiStatus.CancelBookingId = createBookingRes?.response?.bookingId ?? '';
        await MySharedPreferences.setBookingId(
            createBookingRes?.response?.bookingId ?? '');
        searchingForDriver = true;
        bookNowButton = false;
        selectedTime = null;
        returnTime = null;
        selectedDropAddress = '';
        ApiStatus.bookingId = "";
        selectedOneWayIndex = 0;
        isProceed = false;
        isPickupDropDate = false;
        isOneWayRoundTrip = false;
        isSelectHrs = true;
        selectedRoundTripIndex = 0;
        isProceed = false;
        isFlexy = false;
        isRental = false;
        isOutstation = false;
        notifyListeners();
        Future.delayed(Duration(seconds: 5), () {
          if (searchingForDriver) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NavigateMapScreen(
                        bookingId:
                            createBookingRes?.response?.bookingId ?? '')));
          } else {
            print(
                "Skipped getOrderDetailApi call: searchingForDriver is false");
          }
        });
      }
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<dynamic> getOrderDetailApi(data, BuildContext context) async {
    isOrderLoading = true;
    notifyListeners();

    try {
      getOrderDetailRes = await _myRepo.getOrderDetailRepo(data, context);
      if (ApiStatus.status == true) {
        final bookingStatus =
            getOrderDetailRes?.response?.historyList?.first.bookingStatus;

        final mapVM = Provider.of<MapViewModel>(context, listen: false);
        print("---------------------BookingStatus:${bookingStatus}");
        if (bookingStatus == '1') {
          await _audioPlayer.play(AssetSource('ride_booking_confirm.mp3'));
          Future.delayed(Duration(seconds: 5), () {
            _audioPlayer.stop();
          });
        }
        if (["2", "3", "4"].contains(bookingStatus)) {
          _audioPlayer.stop();
          mapVM.fetchLocation(context);
        } else if (["5", "6"].contains(bookingStatus)) {
          _audioPlayer.stop();
          mapVM.polylines.clear();
          mapVM.markers.clear();
          final currentLoc = await mapVM.getCurrentLocation();
          mapVM.markers.add(Marker(
            markerId: const MarkerId("current_location"),
            position: currentLoc,
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
            infoWindow: const InfoWindow(title: "You are here"),
          ));
          mapVM.mapController
              .animateCamera(CameraUpdate.newLatLngZoom(currentLoc, 16));
          mapVM.notifyListeners();
        }

        searchingForDriver = false;
        isTrackStatus = true;
        notifyListeners();
      }
    } finally {
      isOrderLoading = false;
      notifyListeners();
    }
  }

  Future<dynamic> addFevAddressApi(data, BuildContext context) async {
    isLoading = true;
    notifyListeners();
    try {
      await _myRepo.addFevAddressRepo(data, context);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<dynamic> canceledBookingApi(context, {String? bookingId}) async {
    isLoading = true;
    notifyListeners();
    dynamic data = {
      'booking_id': bookingId.toString(),
      'booking_status': "6",
      'reason': "Testing Cancel",
    };
    try {
      await _myRepo.cancelledBookingRepo(data, context);
      if (ApiStatus.status == true) {
        ApiStatus.bookingId = "";
        ApiStatus.CancelBookingId = "";
        searchingForDriver = false;
        bookNowButton = false;
        selectedTime = null;
        returnTime = null;
        selectedDropAddress = '';
        selectedOneWayIndex = 0;
        isProceed = false;
        isSelectHrs = false;
        selectedRoundTripIndex = 0;
        isFlexy = false;
        isRental = false;
        isOutstation = false;
      }
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<dynamic> getFevAddressList(context) async {
    isLoading = true;
    notifyListeners();
    final userid = await MySharedPreferences.getUserId();
    dynamic data = {
      'user_id': userid.toString(),
    };
    try {
      getFevAddressRes = await _myRepo.getFevAddressListRepo(data, context);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<dynamic> removeCoupon(context) async {
    isLoading = true;
    notifyListeners();
    final userid = await MySharedPreferences.getUserId();
    dynamic data = {
      'user_id': userid.toString(),
    };
    try {
      await _myRepo.removePromoCode(data, context);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<dynamic> favAddressRemove(context,{String? fav_address_id}) async {
    isLoading = true;
    notifyListeners();
    dynamic data = {
      'fav_address_id': fav_address_id,
    };
    try {
      await _myRepo.faveAddressRemoveRepo(data, context);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

}
