import 'package:driver_suvidha_user/provider/data/response/api_params_model.dart';
import 'package:driver_suvidha_user/screen/map_screen/navigate_map_screen.dart';
import 'package:driver_suvidha_user/screen/map_screen/provider/home_page_view_model.dart';
import 'package:driver_suvidha_user/screen/map_screen/provider/map_view_model.dart';
import 'package:driver_suvidha_user/screen/map_screen/search_address.dart';
import 'package:driver_suvidha_user/screen/map_screen/select_payment.dart';
import 'package:driver_suvidha_user/utils/progress_bar.dart';
import 'package:driver_suvidha_user/import.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../gps_helper/gps_helper.dart';

class MapScreen extends StatefulWidget {
  final String? bookingId;
  MapScreen({super.key, this.bookingId});
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> with TickerProviderStateMixin {
  bool isConfirmLocation = false;
  int selectedHrsIndex = 0;
  int selectedVehicleType = 0;
  int selectedVehicleType1 = 0;
  String? selectedPickUpAddress;

  String? fromSelectedLatitude;
  String? toSelectedLatitude;
  String? fromSelectedLongitude;
  String? toSelectedLongitude;
  int selectedIconIndex = 0;
  int? selectedTimeIndex;

  String? selectedVehicleAmt;
  String? estDistance;
  String? estDuration;
  String? kmCharges;
  String? durationCharge;
  String? totalAmt;
  String? discount;
  String? gstAmt;
  String? netPay;
  String? surgeCharge;
  String? couponCode;
  String? vahicleName;
  String? vahicleImage;
  String? baseFare;
  String? extraPerKMCharge;
  String? extraPerMinCharge;
  String? planLabel;
  String? driverAllowance;
  String? nightCharge;
  String? perNightCharge;
  String? extraKmCharge;
  String? extraPerKm;
  String? extraHrsCharge;
  String? extraPerHrsCharge;
  String? durationLabel;
  String? vehicleTypeId;
  String? setBaseKm;
  String? setBaseHrs;

  ///for oneWay and roundTrip type
  String? tripTypeOutstation;
  bool isFirst = true;
  bool isRentalFirst = true;
  bool isOutstationFirst = true;
  late Future<LatLng> _initialPosition;
  @override
  void initState() {
    super.initState();
     _initialPosition = Provider.of<MapViewModel>(context, listen: false).getCurrentLocation();
    if(_initialPosition!=null ){
      print('_initialPosition----------------------------${_initialPosition}');
      fetchHomePage();
    }

  }


  void fetchHomePage() {
    Future.microtask(() async {
      bool gpsReady = await GPSHelper.checkLocationService(context);
      if (!gpsReady) return;
      await Provider.of<HomePageViewModel>(context, listen: false)
          .getHomePageApi(context)
          .then((value) async {
        final getHomePage = Provider.of<HomePageViewModel>(context, listen: false).homePageRes?.response;

        if (getHomePage?.ongoingBookingId != '' && getHomePage?.ongoingBookingId != '0')
        {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  NavigateMapScreen(bookingId: getHomePage?.ongoingBookingId),
            ),
          );
        }
        _initialPosition = Provider.of<MapViewModel>(context, listen: false).getCurrentLocation();
      });
    });
  }

  void flexySetInitialValue(HomePageViewModel value) {
    final getFlexy = value.FlexyRes?.response;
    selectedVehicleType1 = 0;
    estDistance = getFlexy?.categoryList?[selectedVehicleType1].distance ?? '';
    estDuration =
        getFlexy?.categoryList?[selectedVehicleType1].rideDuration ?? '';
    kmCharges = getFlexy?.categoryList?[selectedVehicleType1].kmCharges ?? '';
    durationCharge =
        getFlexy?.categoryList?[selectedVehicleType1].durationCharges ?? '';
    totalAmt = getFlexy?.categoryList?[selectedVehicleType1].totalAmt ?? '';
    discount =
        getFlexy?.categoryList?[selectedVehicleType1].roundDiscountAmt ?? '';
    gstAmt = getFlexy?.categoryList?[selectedVehicleType1].gstAmt ?? '';
    netPay = getFlexy?.categoryList?[selectedVehicleType1].netPayWithGst ?? '';
    surgeCharge =
        getFlexy?.categoryList?[selectedVehicleType1].surgeCharge ?? '';
    couponCode = getFlexy?.categoryList?[selectedVehicleType1].coupanCode ?? '';
    baseFare = getFlexy?.categoryList?[selectedHrsIndex].baseFare ?? '';
    vahicleName =
        getFlexy?.categoryList?[selectedVehicleType1].vehileTypeName ?? '';
    vahicleImage =
        getFlexy?.categoryList?[selectedVehicleType1].vehicleTypeImage ?? '';
    vehicleTypeId =
        getFlexy?.categoryList?[selectedVehicleType1].vehicleTypeId ?? '';
    setBaseKm = '';
    setBaseHrs = '';
  }

  void rentalSetInitialValue(HomePageViewModel value) {
    final getRental = value.rentalRes?.response;
    selectedVehicleType1 = 0;
    estDistance =
        getRental?.planList?[selectedHrsIndex].categoryList?.first.distance ??
            '';
    estDuration =
        getRental?.planList?[selectedHrsIndex].categoryList?.first.actualHour;
    kmCharges = getRental?.planList?[selectedHrsIndex].categoryList?.first
            .actualExtraKmCharge ??
        '';
    durationCharge = getRental?.planList?[selectedHrsIndex].categoryList?.first
            .actualExtraMinCharge ??
        '';
    totalAmt =
        getRental?.planList?[selectedHrsIndex].categoryList?.first.totalAmt ??
            '';
    discount = getRental?.planList?[selectedHrsIndex].categoryList?.first
            .roundDiscountAmt ??
        '';
    gstAmt =
        getRental?.planList?[selectedHrsIndex].categoryList?.first.gstAmt ?? '';
    netPay = getRental
            ?.planList?[selectedHrsIndex].categoryList?.first.netPayWithGst ??
        '';
    surgeCharge = getRental
            ?.planList?[selectedHrsIndex].categoryList?.first.surgeCharge ??
        '';

    couponCode =
        getRental?.planList?[selectedHrsIndex].categoryList?.first.coupanCode ??
            '';
    vahicleName = getRental
            ?.planList?[selectedHrsIndex].categoryList?.first.vehileTypeName ??
        '';
    vahicleImage = getRental?.planList?[selectedHrsIndex].categoryList?.first
            .vehicleTypeImage ??
        '';
    baseFare =
        getRental?.planList?[selectedHrsIndex].categoryList?.first.baseFare ??
            '';
    extraPerKMCharge = getRental?.planList?[selectedHrsIndex].categoryList
            ?.first.extraPerKmCharge ??
        '';
    extraPerMinCharge = getRental?.planList?[selectedHrsIndex].categoryList
            ?.first.extraPerMinCharge ??
        '';
    planLabel =
        getRental?.planList?[selectedHrsIndex].categoryList?.first.planLevel ??
            '';
    vehicleTypeId = getRental?.planList?[selectedHrsIndex]
            .categoryList?[selectedVehicleType1].vehicleTypeId ??
        '';
    setBaseKm = getRental?.planList?[selectedHrsIndex]
            .categoryList?[selectedVehicleType1].baseKm ??
        '';
    setBaseHrs = getRental?.planList?[selectedHrsIndex]
            .categoryList?[selectedVehicleType1].baseHour ??
        '';
  }

  void outStationSetInitialValue(HomePageViewModel value) {
    final getOutstation = value.OutstationRes?.response;
    selectedVehicleType1 = 0;
    estDistance = getOutstation?.categoryList?.first.distance ?? '';
    estDuration = getOutstation?.categoryList?.first.actualHour;
    kmCharges = getOutstation?.categoryList?.first.actualExtraKmCharge ?? '';
    durationCharge =
        getOutstation?.categoryList?.first.actualExtraHourCharge ?? '';
    totalAmt = getOutstation?.categoryList?.first.totalAmt ?? '';
    discount = getOutstation?.categoryList?.first.roundDiscountAmt ?? '';
    gstAmt = getOutstation?.categoryList?.first.gstAmt ?? '';
    netPay = getOutstation?.categoryList?.first.netPayWithGst ?? '';
    couponCode = getOutstation?.categoryList?.first.coupanCode ?? '';
    vahicleName = getOutstation?.categoryList?.first.vehileTypeName ?? '';
    vahicleImage = getOutstation?.categoryList?.first.vehicleTypeImage ?? '';
    baseFare = getOutstation?.categoryList?.first.baseFare ?? '';
    extraPerKMCharge =
        getOutstation?.categoryList?.first.extraPerKmCharge ?? '';
    planLabel = getOutstation?.categoryList?.first.planLevel ?? '';
    driverAllowance =
        getOutstation?.categoryList?.first.fixDriverAllowance ?? '';
    nightCharge = getOutstation?.categoryList?.first.nights;
    perNightCharge = getOutstation?.categoryList?.first.nightCharge;
    extraKmCharge = getOutstation?.categoryList?.first.extraKm;
    extraPerKm = getOutstation?.categoryList?.first.extraPerKmCharge;
    extraHrsCharge = getOutstation?.categoryList?.first.actualExtraHourCharge;
    extraPerHrsCharge = getOutstation?.categoryList?.first.extraPerHourCharge;
    durationLabel = getOutstation?.categoryList?.first.durationLevel;
    vehicleTypeId = getOutstation?.categoryList?.first.vehicleTypeId;
    setBaseKm = '';
    setBaseHrs = '';
  }

  DateTime? lastPressed;
  bool isOneTimeOpenBottom = true;
  @override
  Widget build(BuildContext context) {
    MyFontSize fontSize = MyFontSize(context);
    final getHomePage = Provider.of<HomePageViewModel>(context, listen: false);
    getHomePage.address == selectedPickUpAddress;
    return WillPopScope(
      onWillPop: () async {
        DateTime now = DateTime.now();
        if (lastPressed == null ||
            now.difference(lastPressed!) > Duration(seconds: 2)) {
          lastPressed = now;
          Utils.toastMessage("Press back again to exit ");
          return false;
        }
        return true;
      },

      child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: Consumer<HomePageViewModel>(
            builder: (context, value, child) {
              final getHomeDat = value.homePageRes?.response;
              final getFlexy = value.FlexyRes?.response;
              final getCreateBooking = value.createBookingRes?.response;
              final getOrderDetailRes = value.getOrderDetailRes?.response?.historyList?.first;
              final getRental = value.rentalRes?.response;
              final getOutstation = value.OutstationRes?.response;
              final setSFromLatitude = fromSelectedLatitude ?? value.position?.latitude.toString();
              final setFromLongitude = fromSelectedLongitude ?? value.position?.longitude.toString();
              final defaultPickupAddress = value.address;

              if (value.homePageRes?.response != null) {
                WidgetsBinding.instance.addPostFrameCallback(
                  (timeStamp) {
                    if (isOneTimeOpenBottom &&
                        getHomeDat!.pendingRatingId != '0' &&
                        getHomeDat.pendingRatingId != '') {
                      isOneTimeOpenBottom = false;
                      showRatingSheet(context,bookingId:
                      getHomeDat?.pendingRatingId??'',
                     driverMo: getOrderDetailRes?.driverMobileNumber??"",
                        driverName: getOrderDetailRes?.driverName??"",
                        driverPhoto: getOrderDetailRes?.driverPhoto??"",
                      );
                      // showDriverRatingSheet(context,
                      //     bookingId: getHomeDat.pendingRatingId,
                      //     isClose: false);
                    }
                  },
                );
              }

              return value.isMapLoading
                  ? const Center(child: CustomProgressBar())
                  : Stack(
                      children: [
                        FutureBuilder<LatLng>(
                          future: _initialPosition,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              return Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "${snapshot.error}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.refresh),
                                      onPressed: () {
                                        fetchHomePage();
                                      },
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              final currentPosition = snapshot.data!;
                              return Consumer<MapViewModel>(
                                builder: (context, mapViewModel, child) {
                                  return GoogleMap(
                                    initialCameraPosition: CameraPosition(
                                      target: currentPosition,
                                      zoom: 15,
                                    ),
                                    onMapCreated: (controller) async {
                                      mapViewModel.mapController = controller;
                                      mapViewModel.isMapReady = true;
                                      // mapViewModel.fitCameraToMarkers();
                                      final style = await rootBundle
                                          .loadString('assets/map_style.json');
                                      controller.setMapStyle(style);
                                    },
                                    // markers: mapViewModel.markers,
                                    // polylines: mapViewModel.polylines,
                                    myLocationEnabled: true,
                                    myLocationButtonEnabled: true,
                                  );
                                },
                              );
                            }
                          },
                        ),
                        if (value.isHeader == true)
                          Header(
                            isFev: false,
                            onTap: () async {
                              String? refresh = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SettingScreen()));
                              if (refresh == "refresh") {
                                setState(() {});
                              }
                            },
                            title: value.address != null
                                ? value.address
                                : "Fetching location...",
                          ),
                        if (value.isPickUpLocation == true)
                          PickUpLocationHeader(
                              title: value.address != null
                                  ? value.address
                                  : "Fetching location..."),

                        ///getHomeDat?.ongoingBookingId==''&&getHomeDat?.ongoingBookingId!='0'
                        if (ApiStatus.bookingId == null ||
                            ApiStatus.bookingId == '')
                          Positioned(
                            bottom: 0,
                            child: Container(
                                width: fontSize.w,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        selectLocationWidget(
                                            image: Images.greenDot,
                                            title: selectedPickUpAddress ??
                                                value.address ??
                                                '',
                                            onTap: () async {
                                              final result =
                                                  await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      GoogleSearchScreen(
                                                          title:
                                                              "Select PickUp Address",
                                                          type: 'pick'),
                                                ),
                                              );
                                              if (result != null) {
                                                setState(() {
                                                  selectedPickUpAddress =
                                                      result["address"]
                                                          .toString();
                                                  fromSelectedLatitude =
                                                      result["fromLatitude"]
                                                          .toString();
                                                  fromSelectedLongitude =
                                                      result["fromLongitude"]
                                                          .toString();
                                                });
                                              }
                                            }),
                                        Positioned(
                                            right: 4,
                                            top: 10,
                                            child: isFavoriteWidget(
                                                address:
                                                    selectedPickUpAddress ??
                                                        value.address ??
                                                        '',
                                                lat: setSFromLatitude ?? '',
                                                long: setFromLongitude ?? ''))
                                      ],
                                    ),
                                    SizedBox(height: fontSize.h * 0.01),
                                    Stack(
                                      children: [
                                        selectLocationWidget(
                                            image: Images.redDot,
                                            title: value.selectedDropAddress ??
                                                "Select drop Address",
                                            onTap: () async {
                                              final result =
                                                  await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      GoogleSearchScreen(
                                                    title:
                                                        "Select Drop Address",
                                                    type: "drop",
                                                  ),
                                                ),
                                              );
                                              if (result != null) {
                                                setState(() {
                                                  value.selectedDropAddress =
                                                      result["address"]
                                                          .toString();
                                                  toSelectedLatitude =
                                                      result["latitude"]
                                                          .toString();
                                                  toSelectedLongitude =
                                                      result["longitude"]
                                                          .toString();
                                                });
                                              }
                                            }),
                                        Positioned(
                                            right: 4,
                                            top: 10,
                                            child: isFavoriteWidget(
                                                address:
                                                    value.selectedDropAddress ??
                                                        '',
                                                lat: toSelectedLatitude ?? '',
                                                long:
                                                    toSelectedLongitude ?? ''))
                                      ],
                                    ),
                                    SizedBox(height: fontSize.h * 0.01),

                                    /// select vehicle type (flexi , rental , outstation)
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: List.generate(
                                              getHomeDat
                                                      ?.pickupDefaultDateTimeList
                                                      ?.length ??
                                                  0, (index) {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 5),
                                              child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    selectedIconIndex = index;
                                                    if (index == 1) {
                                                      setState(() {
                                                        value.selectedOneWayIndex =
                                                            0;
                                                        value.isProceed = false;
                                                        value.isPickupDropDate =
                                                            false;
                                                        value.isOneWayRoundTrip =
                                                            false;
                                                        value.isSelectHrs =
                                                            true;
                                                        value.selectedRoundTripIndex =
                                                            0;
                                                        value.isProceed = false;
                                                        value.isFlexy = false;
                                                        value.isRental = false;
                                                        value.isOutstation =
                                                            false;
                                                      });
                                                    } else if (index == 2) {
                                                      setState(() {
                                                        value.selectedOneWayIndex = 0;
                                                           
                                                        value.selectedRoundTripIndex = 0;
                                                        value.isPickupDropDate = true;
                                                           
                                                        value.isSelectHrs =
                                                            false;
                                                        value.isOneWayRoundTrip =
                                                            true;
                                                        value.isProceed = false;
                                                        value.isFlexy = false;
                                                        value.isRental = false;
                                                        value.isOutstation =false;
                                                            
                                                      });
                                                    } else {
                                                      setState(() {
                                                        value.selectedOneWayIndex =0;

                                                        isFirst = false;
                                                        value.isProceed = false;
                                                        value.isPickupDropDate =
                                                            false;

                                                        value.isSelectHrs =
                                                            false;
                                                        value.isOneWayRoundTrip =
                                                            false;
                                                        value.isFlexy = false;
                                                        value.isRental = false;
                                                        value.isOutstation =
                                                            false;
                                                        value.selectedRoundTripIndex =
                                                            0;
                                                      });
                                                    }
                                                  });
                                                },
                                                child: Container(
                                                  height: fontSize.h * 0.06,
                                                  width: fontSize.w / 3.5,
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 10,
                                                      vertical: 5),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: selectedIconIndex ==
                                                            index
                                                        ? AppColor.appColor
                                                        : AppColor
                                                            .lightGreyColor,
                                                    border: Border.all(
                                                        color: selectedIconIndex ==
                                                                index
                                                            ? AppColor.appColor
                                                            : AppColor
                                                                .lightGreyColor,
                                                        width: 1.5),
                                                  ),
                                                  child: Center(
                                                      child: Text(
                                                    getHomeDat
                                                            ?.pickupDefaultDateTimeList?[
                                                                index]
                                                            .dataType ??
                                                        '',
                                                    style: GoogleFonts.nunito(
                                                      textStyle: TextStyle(
                                                        color:
                                                            selectedIconIndex ==
                                                                    index
                                                                ? AppColor
                                                                    .whiteColor
                                                                : AppColor
                                                                    .blackColor,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                  )),
                                                ),
                                              ),
                                            );
                                          }),
                                        ),

                                        value.isOneWayRoundTrip
                                            ? SizedBox(
                                                height: fontSize.h * 0.02)
                                            : const SizedBox(),

                                        /// One way - Round Trip Tab
                                        value.isOneWayRoundTrip
                                            ? Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: List.generate(
                                                  value.tripTypeList.length,
                                                  (index) {
                                                    return InkWell(
                                                      onTap: () {
                                                        value
                                                            .setTripType(index);
                                                      },
                                                      child: Container(
                                                        width: fontSize.w / 2.2,
                                                        height:
                                                            fontSize.h * 0.06,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            color: value.selectedRoundTripIndex ==
                                                                    index
                                                                ? AppColor
                                                                    .appColor
                                                                : AppColor
                                                                    .whiteColor,
                                                            border: Border.all(
                                                                color: AppColor
                                                                    .lightGreyColor)),
                                                        child: Center(
                                                            child: Text(value
                                                                    .tripTypeList[
                                                                index])),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              )
                                            : SizedBox(),
                                        SizedBox(height: fontSize.h * 0.01),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Column(
                                              children: [
                                                Headings.txt13black(
                                                    "PICKUP TIME", context),
                                                InkWell(
                                                  onTap: () async {
                                                    await value
                                                        .pickTime(context);
                                                    if (!mounted) return;
                                                    value.isOutstation = false;
                                                    value.isRental = false;
                                                    value.isFlexy = false;
                                                  },
                                                  child: Stack(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(5),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors
                                                                .grey[300],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                          child: Row(
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        left:
                                                                            10),
                                                                child: Headings
                                                                    .txt13black(
                                                                  value.selectedTime !=
                                                                          null
                                                                      ? value.formatTimeOfDay(
                                                                          value
                                                                              .selectedTime)
                                                                      : getHomeDat
                                                                              ?.pickupDefaultDateTimeList?[selectedIconIndex]
                                                                              .defaultPickupTime ??
                                                                          '',
                                                                  context,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  width: 5),
                                                              Container(
                                                                  color: AppColor
                                                                      .appColor,
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              5),
                                                                  child: Icon(
                                                                      Icons
                                                                          .timer_outlined,
                                                                      color: AppColor
                                                                          .whiteColor))
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Headings.txt13black(
                                                    'PICKUP DATE', context),
                                                InkWell(
                                                  onTap: () async {
                                                    await value
                                                        .selectDate(context);
                                                    if (!mounted) return;
                                                    value.isOutstation = false;
                                                    value.isRental = false;
                                                    value.isFlexy = false;
                                                  },
                                                  child: Stack(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(5),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors
                                                                .grey[300],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                          child: Row(
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        left:
                                                                            10),
                                                                child: Headings
                                                                    .txt13black(
                                                                  "${value.pickUpDate != null ? value.getFormattedDate(value.pickUpDate) : getHomeDat?.pickupDefaultDateTimeList?[selectedIconIndex].defaultPickupDate ?? ""}",
                                                                  context,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  width: 5),
                                                              Container(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              5),
                                                                  color: AppColor
                                                                      .appColor,
                                                                  child: Icon(
                                                                      Icons
                                                                          .date_range,
                                                                      color: AppColor
                                                                          .whiteColor)),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: fontSize.h * 0.01),
                                        value.selectedRoundTripIndex == 1
                                            ? Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Column(
                                                    children: [
                                                      Headings.txt13black(
                                                          "RETURN TIME",
                                                          context),
                                                      InkWell(
                                                        onTap: () async {
                                                          value
                                                              .selectReturnTime(
                                                                  context);
                                                          if (!mounted) return;
                                                          value.isOutstation =
                                                              false;
                                                          value.isRental =
                                                              false;
                                                          value.isFlexy = false;
                                                        },
                                                        child: Stack(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(5),
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                          .grey[
                                                                      300],
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                ),
                                                                child: Row(
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                          .only(
                                                                          left:
                                                                              10),
                                                                      child: Headings
                                                                          .txt13black(
                                                                        value.returnTime !=
                                                                                null
                                                                            ? value.formatTimeOfDay(value.returnTime)
                                                                            : '',
                                                                        context,
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                        width:
                                                                            5),
                                                                    Container(
                                                                        color: AppColor
                                                                            .appColor,
                                                                        padding:
                                                                            EdgeInsets.all(
                                                                                5),
                                                                        child: Icon(
                                                                            Icons
                                                                                .timer_outlined,
                                                                            color:
                                                                                AppColor.whiteColor))
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    children: [
                                                      Headings.txt13black(
                                                          'RETURN DATE',
                                                          context),
                                                      InkWell(
                                                        onTap: () async {
                                                          value
                                                              .selectReturnDate(
                                                                  context);
                                                          if (!mounted) return;
                                                          value.isOutstation =
                                                              false;
                                                          value.isRental =
                                                              false;
                                                          value.isFlexy = false;
                                                        },
                                                        child: Stack(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(5),
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                          .grey[
                                                                      300],
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                ),
                                                                child: Row(
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsets.only(
                                                                          left:
                                                                              10),
                                                                      child: Headings
                                                                          .txt13black(
                                                                        value.getFormattedDate(
                                                                            value.returnDate),
                                                                        context,
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                        width:
                                                                            5),
                                                                    Container(
                                                                        padding:
                                                                            EdgeInsets.all(
                                                                                5),
                                                                        color: AppColor
                                                                            .appColor,
                                                                        child: Icon(
                                                                            Icons
                                                                                .date_range,
                                                                            color:
                                                                                AppColor.whiteColor)),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )
                                            : SizedBox(),
                                        proceedButton(context, () async {
                                          final userid =
                                              await MySharedPreferences .getUserId();
                                          String selectedDate = value
                                                      .pickUpDate !=
                                                  null
                                              ? value.getFormattedDate(
                                                  value.pickUpDate)
                                              : getHomeDat
                                                      ?.pickupDefaultDateTimeList?[
                                                          selectedIconIndex]
                                                      .defaultPickupDate ??
                                                  "";
                                          if (toSelectedLongitude == null) {
                                            return Utils.toastMessage(
                                                "Please select Drop Address");
                                          }
                                          if (value.selectedRoundTripIndex ==
                                              1) {
                                            if (value.returnDate == null) {
                                              return Utils.toastMessage(
                                                  "Please select Return Date");
                                            }
                                          }

                                          if (selectedIconIndex == 0) {
                                            if (toSelectedLongitude == null) {
                                              return Utils.toastMessage(
                                                  "Please select Drop Address");
                                            } else {
                                              selectedVehicleType1 = 0;
                                              await value
                                                  .proceedFlexyApi(
                                                ApiParamsModels.flexyParam(
                                                    userid,
                                                    setSFromLatitude,
                                                    setFromLongitude,
                                                    toSelectedLatitude
                                                        .toString(),
                                                    toSelectedLongitude
                                                        .toString(),
                                                    selectedDate.toString(),
                                                    '${value.selectedTime != null ? value.formatTimeOfDay(value.selectedTime) : getHomeDat?.pickupDefaultDateTimeList?[selectedIconIndex].defaultPickupTime ?? ''}',
                                                    ''),
                                                context,
                                              )
                                                  .then(
                                                (NewValue) {
                                                  value.isFlexy = true;
                                                },
                                              );

                                              flexySetInitialValue(value);
                                            }
                                          } else if (selectedIconIndex == 1) {
                                            selectedVehicleType1 = 0;
                                            selectedHrsIndex = 0;
                                            rentalSetInitialValue(value);
                                            value
                                                .proceedRentalApi(
                                                    ApiParamsModels.rentalParam(
                                                        userid,
                                                        setSFromLatitude,
                                                        setFromLongitude,
                                                        toSelectedLatitude
                                                            .toString(),
                                                        toSelectedLongitude
                                                            .toString(),
                                                        selectedDate.toString(),
                                                        '${value.selectedTime != null ? value.formatTimeOfDay(value.selectedTime) : getHomeDat?.pickupDefaultDateTimeList?[selectedIconIndex].defaultPickupTime ?? ''}',
                                                        ApiStatus
                                                                .setCouponCode ??
                                                            ''),
                                                    context)
                                                .then(
                                              (NewValue) {
                                                value.isRental = true;
                                              },
                                            );
                                          } else {
                                            value
                                                .proceedOutstationApi(
                                                    ApiParamsModels
                                                        .outstationParam(
                                                            userid,
                                                            setSFromLatitude,
                                                            setFromLongitude,
                                                            toSelectedLatitude
                                                                .toString(),
                                                            toSelectedLongitude
                                                                .toString(),
                                                            selectedDate
                                                                .toString(),
                                                            '${value.selectedTime != null ? value.formatTimeOfDay(value.selectedTime) : getHomeDat?.pickupDefaultDateTimeList?[selectedIconIndex].defaultPickupTime ?? ''}', // value.formatTimeOfDay(value.selectedTime) .toString(),
                                                            value.selectedRoundTripIndex ==
                                                                    0
                                                                ? "Oneway"
                                                                : "Round",
                                                            value
                                                                .getFormattedDate(
                                                                    value
                                                                        .returnDate)
                                                                .toString(),
                                                            value
                                                                .formatTimeOfDay(
                                                                    value
                                                                        .returnTime)
                                                                .toString(),
                                                            ''),
                                                    context)
                                                .then((_) {
                                              value.isOutstation = true;
                                              outStationSetInitialValue(value);
                                              // ignore: invalid_use_of_protected_member
                                              value.notifyListeners();
                                              Future.delayed(
                                                  Duration(milliseconds: 200),
                                                  () {
                                                selectedVehicleType1 = 0;
                                              });
                                            }).catchError((error) {
                                              print(
                                                  "Error in API call: $error");
                                            });
                                            // selectedVehicleType1=0;
                                            // value.proceedOutstationApi(ApiParamsModels.outstationParam(
                                            //     userid,
                                            //     setSFromLatitude,
                                            //     setFromLongitude,
                                            //     toSelectedLatitude.toString(),
                                            //     toSelectedLongitude.toString(),
                                            //     selectedDate.toString(),
                                            //     value.formatTimeOfDay(value.selectedTime).toString(),
                                            //    value.selectedRoundTripIndex==0?"Oneway":"Round",
                                            //     value.getFormattedDate(value.returnDate).toString(),
                                            //     value.formatTimeOfDay(value.returnTime).toString()), context).then((value) {
                                            //   isOutstation=true;
                                            // },);
                                            // outStationSetInitialValue(value);
                                          }
                                        })
                                      ],
                                    ),
                                    SizedBox(height: fontSize.h * 0.01),
                                    if ((getFlexy?.categoryList?.isNotEmpty ??
                                        false))
                                      if (value.isFlexy == true)

                                        ///for flexy case show this
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Align(
                                                alignment: Alignment.centerLeft,
                                                child: Headings.txt13black(
                                                    "VEHICLE TYPE", context)),
                                            SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: List.generate(
                                                    getFlexy?.categoryList
                                                            ?.length ??
                                                        0,
                                                    (index) {
                                                      if (isFirst) {
                                                        flexySetInitialValue(
                                                            value);
                                                        isFirst = false;
                                                      }
                                                      return vehicleTypeWidget(
                                                        () {
                                                          setState(() {
                                                            selectedVehicleType1 =
                                                                index;
                                                            baseFare = getFlexy
                                                                    ?.categoryList?[
                                                                        selectedVehicleType1]
                                                                    .baseFare ??
                                                                '';
                                                            selectedVehicleType1 =
                                                                index;
                                                            estDistance = getFlexy
                                                                    ?.categoryList?[
                                                                        selectedVehicleType1]
                                                                    .distance ??
                                                                '';
                                                            estDuration = getFlexy
                                                                    ?.categoryList?[
                                                                        selectedVehicleType1]
                                                                    .rideDuration ??
                                                                '';
                                                            kmCharges = getFlexy
                                                                    ?.categoryList?[
                                                                        selectedVehicleType1]
                                                                    .kmCharges ??
                                                                '';
                                                            durationCharge = getFlexy
                                                                    ?.categoryList?[
                                                                        selectedVehicleType1]
                                                                    .durationCharges ??
                                                                '';
                                                            totalAmt = getFlexy
                                                                    ?.categoryList?[
                                                                        selectedVehicleType1]
                                                                    .totalAmt ??
                                                                '';
                                                            discount = getFlexy
                                                                    ?.categoryList?[
                                                                        selectedVehicleType1]
                                                                    .roundDiscountAmt ??
                                                                '';
                                                            gstAmt = getFlexy
                                                                    ?.categoryList?[
                                                                        selectedVehicleType1]
                                                                    .gstAmt ??
                                                                '';
                                                            netPay = getFlexy
                                                                    ?.categoryList?[
                                                                        selectedVehicleType1]
                                                                    .netPayWithGst ??
                                                                '';
                                                            surgeCharge = getFlexy
                                                                    ?.categoryList?[
                                                                        selectedVehicleType1]
                                                                    .surgeCharge ??
                                                                '';
                                                            couponCode = getFlexy
                                                                    ?.categoryList?[
                                                                        selectedVehicleType1]
                                                                    .coupanCode ??
                                                                '';
                                                            vahicleName = getFlexy
                                                                    ?.categoryList?[
                                                                        selectedVehicleType1]
                                                                    .vehileTypeName ??
                                                                '';
                                                            vahicleImage = getFlexy
                                                                    ?.categoryList?[
                                                                        selectedVehicleType1]
                                                                    .vehicleTypeImage ??
                                                                '';
                                                            vehicleTypeId = getFlexy
                                                                    ?.categoryList?[
                                                                        selectedVehicleType1]
                                                                    .vehicleTypeId ??
                                                                '';
                                                            print(netPay);
                                                          });
                                                        },
                                                        getFlexy
                                                                ?.categoryList?[
                                                                    index]
                                                                .vehicleTypeImage ??
                                                            '',
                                                        getFlexy
                                                                ?.categoryList?[
                                                                    index]
                                                                .vehileTypeName ??
                                                            '',
                                                        selectedVehicleType1 ==
                                                                index
                                                            ? AppColor.appColor
                                                            : AppColor
                                                                .lightGreyColor,
                                                        getFlexy
                                                                ?.categoryList?[
                                                                    index]
                                                                .netPayWithGst ??
                                                            '',
                                                        selectedVehicleType1 ==
                                                                index
                                                            ? AppColor
                                                                .whiteColor
                                                            : AppColor
                                                                .blackColor,
                                                      );
                                                    },
                                                  )),
                                            ),
                                            SizedBox(height: fontSize.h * 0.01),
                                            Align(
                                                alignment: Alignment.centerLeft,
                                                child: Headings.txt13blackBold(
                                                    "FARE", context)),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                    color:
                                                        AppColor.lightGreyColor,
                                                  )),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Headings.txt13grey( "Estimated Amount",

                                                      context),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Headings.txt17BlackBold(
                                                          "₹$netPay", context),
                                                      InkWell(
                                                          onTap: () {
                                                            showFlexyDialog(
                                                                context,
                                                                vahicalName:
                                                                    vahicleName ??
                                                                        '',
                                                                estDis:
                                                                    estDistance ??
                                                                        '',
                                                                estDuration:
                                                                    estDuration,
                                                                baseFare:
                                                                    '${baseFare}',
                                                                kmCharge:
                                                                    '${kmCharges}',
                                                                totalAmt:
                                                                    totalAmt,
                                                                durationCrg:
                                                                    durationCharge,
                                                                discount:
                                                                    discount,
                                                                gstAmt: gstAmt,
                                                                netPay: netPay,
                                                                surgeCharge:
                                                                    surgeCharge ??
                                                                        '0',
                                                                vahicleImge:
                                                                    vahicleImage);
                                                          },
                                                          child: Icon(
                                                              Icons
                                                                  .info_outline,
                                                              color: AppColor
                                                                  .greyColor))
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: fontSize.h * 0.01),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        _openPaymentDialog(
                                                            context);
                                                      },
                                                      child: Row(
                                                        children: [
                                                          Image.asset(
                                                              Images.payment,
                                                              height:
                                                                  fontSize.h *
                                                                      0.03,
                                                              color: AppColor
                                                                  .blueColor),
                                                          const SizedBox(
                                                              width: 8),
                                                          Column(
                                                            children: [
                                                              Headings
                                                                  .txt13grey(
                                                                      "Payment",
                                                                      context),
                                                              Headings.txt13grey(
                                                                  ApiStatus
                                                                      .setPaymentMode
                                                                      .toString(),
                                                                  context),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    //SizedBox(width: fontSize.w*0.02),
                                                    EnterCoupon(
                                                      removeCouponTap: () {
                                                        value
                                                            .removeCoupon(
                                                                context)
                                                            .then(
                                                          (removeValue) async {
                                                            final userid =
                                                                await MySharedPreferences
                                                                    .getUserId();
                                                            String selectedDate = value
                                                                        .pickUpDate !=
                                                                    null
                                                                ? value.getFormattedDate(
                                                                    value
                                                                        .pickUpDate)
                                                                : getHomeDat
                                                                        ?.pickupDefaultDateTimeList?[
                                                                            selectedIconIndex]
                                                                        .defaultPickupDate ??
                                                                    "";
                                                            if (ApiStatus
                                                                    .status ==
                                                                true) {
                                                              await value
                                                                  .proceedFlexyApi(
                                                                ApiParamsModels.flexyParam(
                                                                    userid,
                                                                    setSFromLatitude,
                                                                    setFromLongitude,
                                                                    toSelectedLatitude
                                                                        .toString(),
                                                                    toSelectedLongitude
                                                                        .toString(),
                                                                    selectedDate
                                                                        .toString(),
                                                                    '${value.selectedTime != null ? value.formatTimeOfDay(value.selectedTime) : getHomeDat?.pickupDefaultDateTimeList?[selectedIconIndex].defaultPickupTime ?? ''}',
                                                                    ''),
                                                                context,
                                                              );
                                                              flexySetInitialValue(
                                                                  value);
                                                              Navigator.pop(
                                                                  context);
                                                            }
                                                          },
                                                        );
                                                      },
                                                      couponValue: couponCode,
                                                      onTap: () async {
                                                        final userid =
                                                            await MySharedPreferences
                                                                .getUserId();
                                                        String selectedDate = value
                                                                    .pickUpDate !=
                                                                null
                                                            ? value.getFormattedDate(
                                                                value
                                                                    .pickUpDate)
                                                            : getHomeDat
                                                                    ?.pickupDefaultDateTimeList?[
                                                                        selectedIconIndex]
                                                                    .defaultPickupDate ??
                                                                "";
                                                        await value.couponCode({
                                                          'user_id': userid,
                                                          'promo_code': value
                                                              .couponCodeController
                                                              .text,
                                                          'vehicle_type_id': getFlexy
                                                                  ?.categoryList?[
                                                                      selectedVehicleType1]
                                                                  .vehicleTypeId ??
                                                              ''
                                                        }, context).then(
                                                          (couponValue) async {
                                                            if (value
                                                                .couponSuccess) {
                                                              await value
                                                                  .proceedFlexyApi(
                                                                ApiParamsModels.flexyParam(
                                                                    userid,
                                                                    setSFromLatitude,
                                                                    setFromLongitude,
                                                                    toSelectedLatitude
                                                                        .toString(),
                                                                    toSelectedLongitude
                                                                        .toString(),
                                                                    selectedDate
                                                                        .toString(),
                                                                    '${value.selectedTime != null ? value.formatTimeOfDay(value.selectedTime) : getHomeDat?.pickupDefaultDateTimeList?[selectedIconIndex].defaultPickupTime ?? ''}',
                                                                    ''),
                                                                context,
                                                              );
                                                              Navigator.pop(
                                                                  context);
                                                            }
                                                          },
                                                        );
                                                        // await value
                                                        //     .proceedFlexyApi(
                                                        //   ApiParamsModels.flexyParam(
                                                        //       userid,
                                                        //       setSFromLatitude,
                                                        //       setFromLongitude,
                                                        //       toSelectedLatitude
                                                        //           .toString(),
                                                        //       toSelectedLongitude
                                                        //           .toString(),
                                                        //       selectedDate
                                                        //           .toString(),
                                                        //       value
                                                        //           .formatTimeOfDay(
                                                        //               value
                                                        //                   .selectedTime)
                                                        //           .toString(),
                                                        //   ApiStatus
                                                        //           .setCouponCode ??
                                                        //           ''),
                                                        //   context,
                                                        // )
                                                        //     .then(
                                                        //   (newValue) {
                                                        //     ApiStatus
                                                        //             .setCouponCode =
                                                        //         value
                                                        //             .couponCodeController
                                                        //             .text;
                                                        //     value.isFlexy =
                                                        //         true;
                                                        //     Navigator.pop(
                                                        //         context);
                                                        //   },
                                                        // );
                                                        flexySetInitialValue(
                                                            value);
                                                      },
                                                    ),
                                                    PersonalOrOther(),
                                                  ]),
                                            ),
                                            SizedBox(height: fontSize.h * 0.02),
                                            CustomButton(
                                                onTap: () async {
                                                  String selectedDate = value
                                                              .pickUpDate !=
                                                          null
                                                      ? value.getFormattedDate(
                                                          value.pickUpDate)
                                                      : getHomeDat
                                                              ?.pickupDefaultDateTimeList?[
                                                                  selectedIconIndex]
                                                              .defaultPickupDate ??
                                                          "";
                                                  String selectedTime = value
                                                              .selectedTime !=
                                                          null
                                                      ? value.formatTimeOfDay(
                                                          value.selectedTime)
                                                      : getHomeDat
                                                              ?.pickupDefaultDateTimeList?[
                                                                  selectedIconIndex]
                                                              .defaultPickupTime ??
                                                          '';
                                                  final userId =
                                                      await MySharedPreferences
                                                          .getUserId();

                                                  value.createBookingApi(
                                                      ApiParamsModels
                                                          .createBookingParam(
                                                        userId: userId,
                                                        fromGpsLocation:
                                                            selectedPickUpAddress ??
                                                                defaultPickupAddress,
                                                        toGpsLocation: value
                                                            .selectedDropAddress,
                                                        fromLat:
                                                            setSFromLatitude
                                                                .toString(),
                                                        fromLong:
                                                            setFromLongitude
                                                                .toString(),
                                                        toLat:
                                                            toSelectedLatitude
                                                                .toString(),
                                                        toLong:
                                                            toSelectedLongitude
                                                                .toString(),
                                                        pickUpdate: selectedDate
                                                            .toString(),
                                                        pickupTime: selectedTime
                                                            .toString(),
                                                        type: "Flexy",
                                                        vehicleTypeId:
                                                            vehicleTypeId
                                                                .toString(),
                                                        bookedForMobNumber:
                                                            ApiStatus
                                                                .setOtherMobileNumber,
                                                        bookedForName: ApiStatus
                                                            .setOtherName,
                                                        bookedFor: ApiStatus
                                                            .setBookType,
                                                        paymentMode: ApiStatus
                                                            .setPaymentMode,
                                                        couponCode: ApiStatus
                                                                .setCouponCode ??
                                                            '',
                                                      ),
                                                      context);
                                                  value.resetOrderDetails();
                                                },
                                                child: Headings.txt17WhiteBold(
                                                    "Book Now", context))
                                          ],
                                        ),

                                    ///for rental case show this
                                    if ((getRental?.planList?.first.categoryList
                                            ?.isNotEmpty ??
                                        false))
                                      if (value.isRental == true)
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            value.isSelectHrs
                                                ? Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 5),
                                                      child: Headings
                                                          .txt13blackBold(
                                                              "RENTAL PLAN",
                                                              context),
                                                    ))
                                                : const SizedBox(),
                                            value.isSelectHrs
                                                ? SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: List.generate(
                                                        getRental?.planList
                                                                ?.length ??
                                                            0,
                                                        (index) {
                                                          return Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    right: 8,
                                                                    top: 1),
                                                            child: InkWell(
                                                              onTap: () {
                                                                setState(() {
                                                                  selectedVehicleType1 =
                                                                      0;
                                                                  selectedHrsIndex =
                                                                      index;
                                                                  extraPerKMCharge = getRental
                                                                          ?.planList?[
                                                                              selectedHrsIndex]
                                                                          .categoryList?[
                                                                              0]
                                                                          .extraPerKmCharge ??
                                                                      '';
                                                                  planLabel = getRental
                                                                          ?.planList?[
                                                                              selectedHrsIndex]
                                                                          .categoryList?[
                                                                              0]
                                                                          .planLevel ??
                                                                      '';
                                                                  estDistance = getRental
                                                                          ?.planList?[
                                                                              selectedHrsIndex]
                                                                          .categoryList?[
                                                                              0]
                                                                          .distance ??
                                                                      '';
                                                                  estDuration = getRental
                                                                      ?.planList?[
                                                                          selectedHrsIndex]
                                                                      .categoryList?[
                                                                          0]
                                                                      .actualHour;
                                                                  kmCharges = getRental
                                                                          ?.planList?[
                                                                              selectedHrsIndex]
                                                                          .categoryList?[
                                                                              0]
                                                                          .actualExtraKmCharge ??
                                                                      '';
                                                                  durationCharge = getRental
                                                                          ?.planList?[
                                                                              selectedHrsIndex]
                                                                          .categoryList?[
                                                                              0]
                                                                          .actualExtraMinCharge ??
                                                                      '';
                                                                  totalAmt = getRental
                                                                          ?.planList?[
                                                                              selectedHrsIndex]
                                                                          .categoryList?[
                                                                              0]
                                                                          .totalAmt ??
                                                                      '';
                                                                  discount = getRental
                                                                          ?.planList?[
                                                                              selectedHrsIndex]
                                                                          .categoryList?[
                                                                              0]
                                                                          .roundDiscountAmt ??
                                                                      '';
                                                                  gstAmt = getRental
                                                                          ?.planList?[
                                                                              selectedHrsIndex]
                                                                          .categoryList?[
                                                                              0]
                                                                          .gstAmt ??
                                                                      '';
                                                                  netPay = getRental
                                                                          ?.planList?[
                                                                              selectedHrsIndex]
                                                                          .categoryList?[
                                                                              0]
                                                                          .netPayWithGst ??
                                                                      '';
                                                                  surgeCharge = getRental
                                                                          ?.planList?[
                                                                              selectedHrsIndex]
                                                                          .categoryList?[
                                                                              0]
                                                                          .surgeCharge ??
                                                                      '';
                                                                  couponCode = getRental
                                                                          ?.planList?[
                                                                              selectedHrsIndex]
                                                                          .categoryList?[
                                                                              0]
                                                                          .coupanCode ??
                                                                      '';
                                                                  vahicleName = getRental
                                                                          ?.planList?[
                                                                              selectedHrsIndex]
                                                                          .categoryList?[
                                                                              0]
                                                                          .vehileTypeName ??
                                                                      '';
                                                                  vahicleImage = getRental
                                                                          ?.planList?[
                                                                              selectedHrsIndex]
                                                                          .categoryList?[
                                                                              0]
                                                                          .vehicleTypeImage ??
                                                                      '';
                                                                  baseFare = getRental
                                                                          ?.planList?[
                                                                              selectedHrsIndex]
                                                                          .categoryList?[
                                                                              0]
                                                                          .baseFare ??
                                                                      '';
                                                                  setBaseKm = getRental
                                                                          ?.planList?[
                                                                              selectedHrsIndex]
                                                                          .categoryList?[
                                                                              selectedVehicleType1]
                                                                          .baseKm ??
                                                                      '';
                                                                  setBaseHrs = getRental
                                                                          ?.planList?[
                                                                              selectedHrsIndex]
                                                                          .categoryList?[
                                                                              selectedVehicleType1]
                                                                          .baseHour ??
                                                                      '';
                                                                  getRental
                                                                          ?.planList?[
                                                                              selectedHrsIndex]
                                                                          .categoryList?[
                                                                              0]
                                                                          .vehicleTypeImage ??
                                                                      '';
                                                                  getRental
                                                                          ?.planList?[
                                                                              selectedHrsIndex]
                                                                          .categoryList?[
                                                                              0]
                                                                          .vehileTypeName ??
                                                                      '';
                                                                  selectedVehicleType1 ==
                                                                          0
                                                                      ? AppColor
                                                                          .appColor
                                                                      : AppColor
                                                                          .lightGreyColor;
                                                                  getRental
                                                                          ?.planList?[
                                                                              selectedHrsIndex]
                                                                          .categoryList?[
                                                                              0]
                                                                          .netPayWithGst ??
                                                                      '';
                                                                });
                                                              },
                                                              child: Container(
                                                                  padding: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          10,
                                                                      vertical:
                                                                          5),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                    color: selectedHrsIndex ==
                                                                            index
                                                                        ? AppColor
                                                                            .appColor
                                                                        : AppColor
                                                                            .lightGreyColor,
                                                                  ),
                                                                  child: Text(
                                                                    getRental
                                                                            ?.planList?[index]
                                                                            .displayLevel ??
                                                                        '',
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        fontSize:
                                                                            11,
                                                                        color: selectedHrsIndex ==
                                                                                index
                                                                            ? AppColor.whiteColor
                                                                            : AppColor.blackColor),
                                                                  )),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  )
                                                : const SizedBox(),
                                            SizedBox(height: fontSize.h * 0.01),
                                            Align(
                                                alignment: Alignment.centerLeft,
                                                child: Headings.txt13black(
                                                    "VEHICLE TYPE", context)),
                                            SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: List.generate(
                                                    getRental
                                                            ?.planList?[
                                                                selectedHrsIndex]
                                                            .categoryList
                                                            ?.length ??
                                                        0,
                                                    (index) {
                                                      if (isRentalFirst) {
                                                        rentalSetInitialValue(
                                                            value);
                                                        isRentalFirst = false;
                                                      }
                                                      return vehicleTypeWidget(
                                                        () {
                                                          setState(() {
                                                            selectedVehicleType1 =
                                                                index;

                                                            vehicleTypeId = getRental
                                                                    ?.planList?[
                                                                        selectedHrsIndex]
                                                                    .categoryList?[
                                                                        selectedVehicleType1]
                                                                    .vehicleTypeId ??
                                                                '';

                                                            planLabel = getRental
                                                                    ?.planList?[
                                                                        selectedHrsIndex]
                                                                    .categoryList?[
                                                                        selectedVehicleType1]
                                                                    .planLevel ??
                                                                '';
                                                            baseFare = getRental
                                                                    ?.planList?[
                                                                        selectedHrsIndex]
                                                                    .categoryList?[
                                                                        selectedVehicleType1]
                                                                    .baseFare ??
                                                                '';
                                                            selectedVehicleType1 =
                                                                index;
                                                            estDistance = getRental
                                                                    ?.planList?[
                                                                        selectedHrsIndex]
                                                                    .categoryList?[
                                                                        selectedVehicleType1]
                                                                    .distance ??
                                                                '';
                                                            estDuration = getRental
                                                                ?.planList?[
                                                                    selectedHrsIndex]
                                                                .categoryList?[
                                                                    selectedVehicleType1]
                                                                .actualHour;
                                                            kmCharges = getRental
                                                                    ?.planList?[
                                                                        selectedHrsIndex]
                                                                    .categoryList?[
                                                                        selectedVehicleType1]
                                                                    .actualExtraKmCharge ??
                                                                '';
                                                            durationCharge = getRental
                                                                    ?.planList?[
                                                                        selectedHrsIndex]
                                                                    .categoryList?[
                                                                        selectedVehicleType1]
                                                                    .actualExtraMinCharge ??
                                                                '';
                                                            totalAmt = getRental
                                                                    ?.planList?[
                                                                        selectedHrsIndex]
                                                                    .categoryList?[
                                                                        selectedVehicleType1]
                                                                    .totalAmt ??
                                                                '';
                                                            discount = getRental
                                                                    ?.planList?[
                                                                        selectedHrsIndex]
                                                                    .categoryList?[
                                                                        selectedVehicleType1]
                                                                    .roundDiscountAmt ??
                                                                '';
                                                            gstAmt = getRental
                                                                    ?.planList?[
                                                                        selectedHrsIndex]
                                                                    .categoryList?[
                                                                        selectedVehicleType1]
                                                                    .gstAmt ??
                                                                '';
                                                            netPay = getRental
                                                                    ?.planList?[
                                                                        selectedHrsIndex]
                                                                    .categoryList?[
                                                                        selectedVehicleType1]
                                                                    .netPayWithGst ??
                                                                '';
                                                            surgeCharge = getRental
                                                                    ?.planList?[
                                                                        selectedHrsIndex]
                                                                    .categoryList?[
                                                                        selectedVehicleType1]
                                                                    .surgeCharge ??
                                                                '';
                                                            couponCode = getRental
                                                                    ?.planList?[
                                                                        selectedHrsIndex]
                                                                    .categoryList?[
                                                                        selectedVehicleType1]
                                                                    .coupanCode ??
                                                                '';
                                                            vahicleName = getRental
                                                                    ?.planList?[
                                                                        selectedHrsIndex]
                                                                    .categoryList?[
                                                                        selectedVehicleType1]
                                                                    .vehileTypeName ??
                                                                '';
                                                            vahicleImage = getRental
                                                                    ?.planList?[
                                                                        selectedHrsIndex]
                                                                    .categoryList?[
                                                                        selectedVehicleType1]
                                                                    .vehicleTypeImage ??
                                                                '';
                                                            extraPerKMCharge = getRental
                                                                    ?.planList?[
                                                                        selectedHrsIndex]
                                                                    .categoryList?[
                                                                        selectedVehicleType1]
                                                                    .extraPerKmCharge ??
                                                                '';
                                                          });
                                                        },
                                                        getRental
                                                                ?.planList?[
                                                                    selectedHrsIndex]
                                                                .categoryList?[
                                                                    index]
                                                                .vehicleTypeImage ??
                                                            '',
                                                        getRental
                                                                ?.planList?[
                                                                    selectedHrsIndex]
                                                                .categoryList?[
                                                                    index]
                                                                .vehileTypeName ??
                                                            '',
                                                        selectedVehicleType1 ==
                                                                index
                                                            ? AppColor.appColor
                                                            : AppColor
                                                                .lightGreyColor,
                                                        getRental
                                                                ?.planList?[
                                                                    selectedHrsIndex]
                                                                .categoryList?[
                                                                    index]
                                                                .netPayWithGst ??
                                                            '',
                                                        selectedVehicleType1 ==
                                                                index
                                                            ? AppColor
                                                                .whiteColor
                                                            : AppColor
                                                                .blackColor,
                                                      );
                                                    },
                                                  )),
                                            ),
                                            SizedBox(height: fontSize.h * 0.01),
                                            Align(
                                                alignment: Alignment.centerLeft,
                                                child: Headings.txt13blackBold(
                                                    "FARE", context)),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: AppColor.whiteColor,
                                                  border: Border.all(
                                                    color:
                                                        AppColor.lightGreyColor,
                                                  )),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Headings.txt13grey(
                                                      "Estimated Amount",
                                                      context),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Headings.txt17BlackBold(
                                                          "₹$netPay", context),
                                                      InkWell(
                                                          onTap: () {
                                                            print(
                                                                'PLAN LABELS:$planLabel');
                                                            print(
                                                                'PLAN LABELS:$baseFare');
                                                            print(
                                                                'extraPerKMCharge:$extraPerKMCharge');
                                                            showRentalDialog(
                                                                context,
                                                                baseFare:
                                                                    baseFare ??
                                                                        '',
                                                                vahicalName:
                                                                    vahicleName ??
                                                                        '',
                                                                estDis: estDistance ??
                                                                    '',
                                                                estDuration:
                                                                    estDuration,
                                                                kmCharge:
                                                                    kmCharges,
                                                                totalAmt:
                                                                    totalAmt,
                                                                discount:
                                                                    discount,
                                                                gstAmt: gstAmt,
                                                                netPay: netPay,
                                                                surgeCharge:
                                                                    surgeCharge ??
                                                                        '0',
                                                                vahicleImge:
                                                                    vahicleImage,
                                                                extraPerKMCharge:
                                                                    extraPerKMCharge,
                                                                extraPerMinCharge:
                                                                    extraPerMinCharge,
                                                                planLabel:
                                                                    planLabel);
                                                          },
                                                          child: Icon(
                                                              Icons
                                                                  .info_outline,
                                                              color: AppColor
                                                                  .greyColor))
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: fontSize.h * 0.01),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        _openPaymentDialog(
                                                            context);
                                                      },
                                                      child: Row(
                                                        children: [
                                                          Image.asset(
                                                              Images.payment,
                                                              height:
                                                                  fontSize.h *
                                                                      0.03,
                                                              color: AppColor
                                                                  .blueColor),
                                                          const SizedBox(
                                                              width: 8),
                                                          Column(
                                                            children: [
                                                              Headings
                                                                  .txt13grey(
                                                                      "Payment",
                                                                      context),
                                                              Headings.txt13grey(
                                                                  ApiStatus
                                                                      .setPaymentMode
                                                                      .toString(),
                                                                  context),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    // SizedBox(
                                                    //     width:
                                                    //         fontSize.w * 0.02),
                                                    EnterCoupon(
                                                      removeCouponTap: () {
                                                        value
                                                            .removeCoupon(
                                                                context)
                                                            .then(
                                                          (couponValue) async {
                                                            String selectedDate = value
                                                                        .pickUpDate !=
                                                                    null
                                                                ? value.getFormattedDate(
                                                                    value
                                                                        .pickUpDate)
                                                                : getHomeDat
                                                                        ?.pickupDefaultDateTimeList?[
                                                                            selectedIconIndex]
                                                                        .defaultPickupDate ??
                                                                    "";
                                                            final userid =
                                                                await MySharedPreferences
                                                                    .getUserId();
                                                            await value
                                                                .proceedRentalApi(
                                                              ApiParamsModels.rentalParam(
                                                                  userid,
                                                                  setSFromLatitude,
                                                                  setFromLongitude,
                                                                  toSelectedLatitude
                                                                      .toString(),
                                                                  toSelectedLongitude
                                                                      .toString(),
                                                                  selectedDate
                                                                      .toString(),
                                                                  '${value.selectedTime != null ? value.formatTimeOfDay(value.selectedTime) : getHomeDat?.pickupDefaultDateTimeList?[selectedIconIndex].defaultPickupTime ?? ''}',
                                                                  ''),
                                                              context,
                                                            );
                                                            rentalSetInitialValue(
                                                                value);
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                        );
                                                      },
                                                      couponValue: couponCode,
                                                      onTap: () async {
                                                        String selectedDate = value
                                                                    .pickUpDate !=
                                                                null
                                                            ? value.getFormattedDate(
                                                                value
                                                                    .pickUpDate)
                                                            : getHomeDat
                                                                    ?.pickupDefaultDateTimeList?[
                                                                        selectedIconIndex]
                                                                    .defaultPickupDate ??
                                                                "";
                                                        final userid =
                                                            await MySharedPreferences
                                                                .getUserId();
                                                        await value.couponCode({
                                                          'user_id': userid,
                                                          'promo_code': value
                                                              .couponCodeController
                                                              .text,
                                                          'vehicle_type_id': getFlexy
                                                                  ?.categoryList?[
                                                                      selectedVehicleType1]
                                                                  .vehicleTypeId ??
                                                              ''
                                                        }, context).then(
                                                          (coupanValue) async {
                                                            if (value
                                                                .couponSuccess) {
                                                              await value
                                                                  .proceedRentalApi(
                                                                ApiParamsModels.rentalParam(
                                                                    userid,
                                                                    setSFromLatitude,
                                                                    setFromLongitude,
                                                                    toSelectedLatitude
                                                                        .toString(),
                                                                    toSelectedLongitude
                                                                        .toString(),
                                                                    selectedDate
                                                                        .toString(),
                                                                    '${value.selectedTime != null ? value.formatTimeOfDay(value.selectedTime) : getHomeDat?.pickupDefaultDateTimeList?[selectedIconIndex].defaultPickupTime ?? ''}',
                                                                    ''),
                                                                context,
                                                              );
                                                              rentalSetInitialValue(
                                                                  value);
                                                              Navigator.pop(
                                                                  context);
                                                            }
                                                          },
                                                        );
                                                      },
                                                    ),
                                                    PersonalOrOther(),
                                                  ]),
                                            ),
                                            SizedBox(height: fontSize.h * 0.02),
                                            CustomButton(
                                                onTap: () async {
                                                  String selectedDate = value
                                                              .pickUpDate !=
                                                          null
                                                      ? value.getFormattedDate(
                                                          value.pickUpDate)
                                                      : getHomeDat
                                                              ?.pickupDefaultDateTimeList?[
                                                                  selectedIconIndex]
                                                              .defaultPickupDate ??
                                                          "";
                                                  String selectedTime = value
                                                              .selectedTime !=
                                                          null
                                                      ? value.formatTimeOfDay(
                                                          value.selectedTime)
                                                      : getHomeDat
                                                              ?.pickupDefaultDateTimeList?[
                                                                  selectedIconIndex]
                                                              .defaultPickupTime ??
                                                          '';
                                                  final userId =
                                                      await MySharedPreferences
                                                          .getUserId();
                                                  value.createBookingApi(
                                                      ApiParamsModels
                                                          .createBookingParam(
                                                              userId: userId,
                                                              fromGpsLocation:
                                                                  selectedPickUpAddress ??
                                                                      defaultPickupAddress,
                                                              toGpsLocation: value
                                                                  .selectedDropAddress,
                                                              fromLat: setSFromLatitude
                                                                  .toString(),
                                                              fromLong:
                                                                  setFromLongitude
                                                                      .toString(),
                                                              toLat: toSelectedLatitude
                                                                  .toString(),
                                                              toLong: toSelectedLongitude
                                                                  .toString(),
                                                              pickUpdate:
                                                                  selectedDate
                                                                      .toString(),
                                                              pickupTime: selectedTime
                                                                  .toString(), //value .formatTimeOfDay(value.selectedTime).toString(),
                                                              type: "Rental",
                                                              tripType: '',
                                                              vehicleTypeId:
                                                                  vehicleTypeId
                                                                      .toString(),
                                                              baseKm: setBaseKm,
                                                              baseHrs:
                                                                  setBaseHrs,
                                                              bookedForMobNumber:
                                                                  ApiStatus
                                                                      .setOtherMobileNumber,
                                                              bookedForName: ApiStatus
                                                                  .setOtherName,
                                                              bookedFor: ApiStatus
                                                                  .setBookType,
                                                              paymentMode: ApiStatus
                                                                  .setPaymentMode,
                                                              couponCode: ApiStatus
                                                                      .setCouponCode ??
                                                                  ''),
                                                      context);
                                                  value.resetOrderDetails();
                                                },
                                                child: Headings.txt17WhiteBold(
                                                    "Book Now", context))
                                          ],
                                        ),

                                    ///for outStation case show this
                                    if ((getOutstation
                                            ?.categoryList?.isNotEmpty ??
                                        false))
                                      if (value.isOutstation == true)
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Align(
                                                alignment: Alignment.centerLeft,
                                                child: Headings.txt13black(
                                                    "VEHICLE TYPE", context)),
                                            SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: List.generate(
                                                    getOutstation?.categoryList
                                                            ?.length ??
                                                        0,
                                                    (index) {
                                                      if (isOutstationFirst) {
                                                        outStationSetInitialValue(
                                                            value);
                                                        isOutstationFirst =
                                                            false;
                                                      }
                                                      return vehicleTypeWidget(
                                                        () {
                                                          setState(() {
                                                            selectedVehicleType1 =
                                                                index;
                                                            estDistance = getOutstation
                                                                    ?.categoryList?[
                                                                        selectedVehicleType1]
                                                                    .distance ??
                                                                '';
                                                            estDuration = getOutstation
                                                                ?.categoryList?[
                                                                    selectedVehicleType1]
                                                                .actualHour;
                                                            kmCharges = getOutstation
                                                                    ?.categoryList?[
                                                                        selectedVehicleType1]
                                                                    .actualExtraKmCharge ??
                                                                '';
                                                            totalAmt = getOutstation
                                                                    ?.categoryList?[
                                                                        selectedVehicleType1]
                                                                    .totalAmt ??
                                                                '';
                                                            discount = getOutstation
                                                                    ?.categoryList?[
                                                                        selectedVehicleType1]
                                                                    .roundDiscountAmt ??
                                                                '';
                                                            gstAmt = getOutstation
                                                                    ?.categoryList?[
                                                                        selectedVehicleType1]
                                                                    .gstAmt ??
                                                                '';
                                                            netPay = getOutstation
                                                                    ?.categoryList?[
                                                                        selectedVehicleType1]
                                                                    .netPayWithGst ??
                                                                '';
                                                            couponCode = getOutstation
                                                                    ?.categoryList?[
                                                                        selectedVehicleType1]
                                                                    .coupanCode ??
                                                                '';
                                                            vahicleName = getOutstation
                                                                    ?.categoryList?[
                                                                        selectedVehicleType1]
                                                                    .vehileTypeName ??
                                                                '';
                                                            vahicleImage = getOutstation
                                                                    ?.categoryList?[
                                                                        selectedVehicleType1]
                                                                    .vehicleTypeImage ??
                                                                '';
                                                            baseFare = getOutstation
                                                                    ?.categoryList?[
                                                                        selectedVehicleType1]
                                                                    .baseFare ??
                                                                '';
                                                            driverAllowance = getOutstation
                                                                    ?.categoryList?[
                                                                        selectedVehicleType1]
                                                                    .fixDriverAllowance ??
                                                                '';
                                                            nightCharge = getOutstation
                                                                ?.categoryList?[
                                                                    selectedVehicleType1]
                                                                .nights;
                                                            perNightCharge =
                                                                getOutstation
                                                                    ?.categoryList?[
                                                                        selectedVehicleType1]
                                                                    .nightCharge;
                                                            extraKmCharge =
                                                                getOutstation
                                                                    ?.categoryList?[
                                                                        selectedVehicleType1]
                                                                    .extraKm;
                                                            extraPerKm = getOutstation?.categoryList?[selectedVehicleType1].extraPerKmCharge;
                                                            print('extraPerKm-------------------------$extraPerKm');
                                                            extraHrsCharge = getOutstation?.categoryList?[selectedVehicleType1].actualExtraHourCharge;
                                                            extraPerHrsCharge =
                                                                getOutstation
                                                                    ?.categoryList?[
                                                                        selectedVehicleType1]
                                                                    .extraPerHourCharge;
                                                            durationLabel = getOutstation
                                                                ?.categoryList?[
                                                                    selectedVehicleType1]
                                                                .durationLevel;
                                                            vehicleTypeId = getOutstation
                                                                ?.categoryList?[
                                                                    selectedVehicleType1]
                                                                .vehicleTypeId;
                                                          });
                                                        },
                                                        getOutstation
                                                                ?.categoryList?[
                                                                    index]
                                                                .vehicleTypeImage ??
                                                            '',
                                                        getOutstation
                                                                ?.categoryList?[
                                                                    index]
                                                                .vehileTypeName ??
                                                            '',
                                                        selectedVehicleType1 ==
                                                                index
                                                            ? AppColor.appColor
                                                            : AppColor
                                                                .lightGreyColor,
                                                        getOutstation
                                                                ?.categoryList?[
                                                                    index]
                                                                .netPayWithGst ??
                                                            '',
                                                        selectedVehicleType1 ==
                                                                index
                                                            ? AppColor
                                                                .whiteColor
                                                            : AppColor
                                                                .blackColor,
                                                      );
                                                    },
                                                  )),
                                            ),
                                            SizedBox(height: fontSize.h * 0.01),
                                            Align(
                                                alignment: Alignment.centerLeft,
                                                child: Headings.txt13blackBold(
                                                    "FARE", context)),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                    color:
                                                        AppColor.lightGreyColor,
                                                  )),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Headings.txt13grey(
                                                      "Estimated Amount",
                                                      context),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Headings.txt17BlackBold(
                                                          "₹$netPay", context),
                                                      InkWell(
                                                          onTap: () {
                                                            print(
                                                                "extraHrsCharge:$extraHrsCharge");
                                                            showOutstationDialog(
                                                                context,
                                                                baseFare: baseFare ??
                                                                    '',
                                                                discount:
                                                                    discount,
                                                                durationCrg:
                                                                    durationCharge,
                                                                driverAllowance:
                                                                    driverAllowance,
                                                                estDis:
                                                                    estDistance,
                                                                estDuration:
                                                                    estDuration,
                                                                extraHrsCharge:
                                                                    extraHrsCharge,
                                                                extraKmCharge:
                                                                    extraKmCharge,
                                                                extraPerHrsCharge:
                                                                    extraPerHrsCharge,
                                                                extraPerKm: extraPerKm,
                                                                extraPerKMCharge:extraPerKm,

                                                                gstAmt: gstAmt,
                                                                kmCharge:
                                                                    kmCharges,
                                                                netPay: netPay,
                                                                nightCharge:
                                                                    nightCharge,
                                                                perNightCharge:
                                                                    perNightCharge,
                                                                planLabel:
                                                                    planLabel,
                                                                vahicalName:
                                                                    vahicleName,
                                                                totalAmt:
                                                                    totalAmt,
                                                                vahicleImge:
                                                                    vahicleImage,
                                                                tripType: value
                                                                            .selectedOneWayIndex ==
                                                                        0
                                                                    ? "Round Trip"
                                                                    : "One way",
                                                                durationLabel:
                                                                    durationLabel);
                                                          },
                                                          child: Icon(
                                                              Icons
                                                                  .info_outline,
                                                              color: AppColor
                                                                  .greyColor))
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: fontSize.h * 0.01),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        _openPaymentDialog(
                                                            context);
                                                      },
                                                      child: Row(
                                                        children: [
                                                          Image.asset(
                                                              Images.payment,
                                                              height:
                                                                  fontSize.h *
                                                                      0.03,
                                                              color: AppColor
                                                                  .blueColor),
                                                          const SizedBox(
                                                              width: 8),
                                                          Column(
                                                            children: [
                                                              Headings
                                                                  .txt13grey(
                                                                      "Payment",
                                                                      context),
                                                              if (ApiStatus
                                                                      .setPaymentMode !=
                                                                  null)
                                                                Headings.txt13grey(
                                                                    ApiStatus
                                                                            .setPaymentMode ??
                                                                        '',
                                                                    context),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    // SizedBox(
                                                    //     width:
                                                    //         fontSize.w * 0.02),
                                                    EnterCoupon(
                                                      removeCouponTap: () {
                                                        value
                                                            .removeCoupon(
                                                                context)
                                                            .then(
                                                          (couponValue) async {
                                                            final userid =
                                                                await MySharedPreferences
                                                                    .getUserId();
                                                            String selectedDate = value
                                                                        .pickUpDate !=
                                                                    null
                                                                ? value.getFormattedDate(
                                                                    value
                                                                        .pickUpDate)
                                                                : getHomeDat
                                                                        ?.pickupDefaultDateTimeList?[
                                                                            selectedIconIndex]
                                                                        .defaultPickupDate ??
                                                                    "";
                                                            await value
                                                                .proceedOutstationApi(
                                                              ApiParamsModels
                                                                  .outstationParam(
                                                                userid,
                                                                setSFromLatitude,
                                                                setFromLongitude,
                                                                toSelectedLatitude
                                                                    .toString(),
                                                                toSelectedLongitude
                                                                    .toString(),
                                                                selectedDate
                                                                    .toString(),
                                                                '${value.selectedTime != null ? value.formatTimeOfDay(value.selectedTime) : getHomeDat?.pickupDefaultDateTimeList?[selectedIconIndex].defaultPickupTime ?? ''}',
                                                                value.selectedRoundTripIndex ==
                                                                        0
                                                                    ? "Oneway"
                                                                    : "Round",
                                                                value
                                                                    .getFormattedDate(
                                                                        value
                                                                            .returnDate)
                                                                    .toString(),
                                                                value
                                                                    .formatTimeOfDay(
                                                                        value
                                                                            .returnTime)
                                                                    .toString(),
                                                                '',
                                                              ),
                                                              context,
                                                            );
                                                            outStationSetInitialValue(
                                                                value);
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                        );
                                                      },
                                                      couponValue: couponCode,
                                                      onTap: () async {
                                                        final userid =
                                                            await MySharedPreferences
                                                                .getUserId();
                                                        String selectedDate = value
                                                                    .pickUpDate !=
                                                                null
                                                            ? value.getFormattedDate(
                                                                value
                                                                    .pickUpDate)
                                                            : getHomeDat
                                                                    ?.pickupDefaultDateTimeList?[
                                                                        selectedIconIndex]
                                                                    .defaultPickupDate ??
                                                                "";
                                                        await value.couponCode({
                                                          'user_id': userid,
                                                          'promo_code': value
                                                              .couponCodeController
                                                              .text,
                                                          'vehicle_type_id': getFlexy
                                                                  ?.categoryList?[
                                                                      selectedVehicleType1]
                                                                  .vehicleTypeId ??
                                                              ''
                                                        }, context).then(
                                                          (coupanValue) async {
                                                            if (value
                                                                .couponSuccess) {
                                                              await value
                                                                  .proceedOutstationApi(
                                                                ApiParamsModels
                                                                    .outstationParam(
                                                                  userid,
                                                                  setSFromLatitude,
                                                                  setFromLongitude,
                                                                  toSelectedLatitude
                                                                      .toString(),
                                                                  toSelectedLongitude
                                                                      .toString(),
                                                                  selectedDate
                                                                      .toString(),
                                                                  '${value.selectedTime != null ? value.formatTimeOfDay(value.selectedTime) : getHomeDat?.pickupDefaultDateTimeList?[selectedIconIndex].defaultPickupTime ?? ''}',
                                                                  value.selectedRoundTripIndex ==
                                                                          0
                                                                      ? "Oneway"
                                                                      : "Round",
                                                                  value
                                                                      .getFormattedDate(
                                                                          value
                                                                              .returnDate)
                                                                      .toString(),
                                                                  value
                                                                      .formatTimeOfDay(
                                                                          value
                                                                              .returnTime)
                                                                      .toString(),
                                                                  '',
                                                                ),
                                                                context,
                                                              );
                                                              outStationSetInitialValue(
                                                                  value);
                                                              Navigator.pop(
                                                                  context);
                                                            }
                                                          },
                                                        );
                                                        // value
                                                        //     .proceedOutstationApi(
                                                        //         ApiParamsModels
                                                        //             .outstationParam(
                                                        //   userId,
                                                        //   setSFromLatitude,
                                                        //   setFromLongitude,
                                                        //   toSelectedLatitude
                                                        //       .toString(),
                                                        //   toSelectedLongitude
                                                        //       .toString(),
                                                        //   selectedDate
                                                        //       .toString(),
                                                        //   value
                                                        //       .formatTimeOfDay(
                                                        //           value
                                                        //               .selectedTime)
                                                        //       .toString(),
                                                        //   value.selectedRoundTripIndex ==
                                                        //           0
                                                        //       ? "Oneway"
                                                        //       : "Round",
                                                        //   value
                                                        //       .getFormattedDate(
                                                        //           value
                                                        //               .returnDate)
                                                        //       .toString(),
                                                        //   value
                                                        //       .formatTimeOfDay(
                                                        //           value
                                                        //               .returnTime)
                                                        //       .toString(),
                                                        //   '',
                                                        //         ),
                                                        //         context)
                                                        //     .then((_) {
                                                        //   ApiStatus
                                                        //           .setCouponCode =
                                                        //       value
                                                        //           .couponCodeController
                                                        //           .text;
                                                        //   value.isOutstation =
                                                        //       true;
                                                        //   value
                                                        //       .notifyListeners();
                                                        //   Future.delayed(
                                                        //       Duration(
                                                        //           milliseconds:
                                                        //               200), () {
                                                        //     selectedVehicleType1 =
                                                        // //         0;
                                                        //     outStationSetInitialValue(
                                                        //         value);
                                                        //   });
                                                        // }).catchError((error) {
                                                        //   print(
                                                        //       "Error in API call: $error");
                                                        // });
                                                      },
                                                    ),
                                                    PersonalOrOther(),
                                                  ]),
                                            ),
                                            SizedBox(height: fontSize.h * 0.02),
                                            CustomButton(
                                                onTap: () async {
                                                  String selectedTime = value
                                                              .selectedTime !=
                                                          null
                                                      ? value.formatTimeOfDay(
                                                          value.selectedTime)
                                                      : getHomeDat
                                                              ?.pickupDefaultDateTimeList?[
                                                                  selectedIconIndex]
                                                              .defaultPickupTime ??
                                                          '';
                                                  String selectedPickupDate = value
                                                              .pickUpDate !=
                                                          null
                                                      ? value.getFormattedDate(
                                                          value.pickUpDate)
                                                      : getHomeDat
                                                              ?.pickupDefaultDateTimeList?[
                                                                  selectedIconIndex]
                                                              .defaultPickupDate ??
                                                          '';
                                                  final userId =
                                                      await MySharedPreferences
                                                          .getUserId();
                                                  value.createBookingApi(
                                                      ApiParamsModels
                                                          .createBookingParam(
                                                              userId: userId,
                                                              fromGpsLocation:
                                                                  selectedPickUpAddress ??
                                                                      defaultPickupAddress,
                                                              toGpsLocation: value
                                                                  .selectedDropAddress,
                                                              fromLat: setSFromLatitude
                                                                  .toString(),
                                                              fromLong: setFromLongitude
                                                                  .toString(),
                                                              toLat: toSelectedLatitude
                                                                  .toString(),
                                                              toLong: toSelectedLongitude
                                                                  .toString(),
                                                              pickUpdate: selectedPickupDate
                                                                  .toString(), //value .getFormattedDate(value.pickUpDate) .toString(),
                                                              pickupTime: selectedTime
                                                                  .toString(), //value .formatTimeOfDay(value .selectedTime).toString(),
                                                              returnDate: value.selectedOneWayIndex == 1
                                                                  ? value.getFormattedDate(value
                                                                      .returnDate)
                                                                  : '',
                                                              returnTime: value.selectedOneWayIndex == 1
                                                                  ? value.formatTimeOfDay(value
                                                                      .returnTime)
                                                                  : '',
                                                              type:
                                                                  "Outstation",
                                                              tripType:
                                                                  value.selectedRoundTripIndex == 0
                                                                      ? "One way"
                                                                      : 'Round',
                                                              vehicleTypeId:
                                                                  vehicleTypeId
                                                                      .toString(),
                                                              baseKm: setBaseKm,
                                                              baseHrs:
                                                                  setBaseHrs,
                                                              bookedForMobNumber:
                                                                  ApiStatus
                                                                      .setOtherMobileNumber,
                                                              bookedForName: ApiStatus
                                                                  .setOtherName,
                                                              bookedFor: ApiStatus.setBookType,
                                                              paymentMode: ApiStatus.setPaymentMode,
                                                              couponCode: ApiStatus.setCouponCode ?? ''),
                                                      context);
                                                  value.resetOrderDetails();
                                                },
                                                child: Headings.txt17WhiteBold(
                                                    "Book Now", context))
                                          ],
                                        ),
                                  ],
                                )),
                          ),
                        //Text('',style: TextStyle(color: Color(0xff52b1bf)),)
                        if (ApiStatus.bookingId != null &&
                            ApiStatus.bookingId!.isNotEmpty)
                          Positioned(
                              bottom: 0,
                              child: trackStatus(
                                tripTypeImage: getOrderDetailRes?.icon ?? '',
                                bookingLavel:
                                    getOrderDetailRes?.bookingLevel ?? '',
                                tripType: getOrderDetailRes?.tripType ?? '',
                                date: getOrderDetailRes?.timeDisplayLevel ?? '',
                                status: getOrderDetailRes?.bookingStatus ?? '',
                                OTP: getOrderDetailRes?.startOtp ?? '',
                                time: '',
                                TrackBOnTap: () {
                                  if (getOrderDetailRes?.bookingStatus == "0") {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MyRideScreen()));
                                  } else {}
                                },
                                tripHrs:
                                    getOrderDetailRes?.rideDurationDisplay ??
                                        '',
                                tripKm:
                                    getOrderDetailRes?.distanceDisplay ?? '',
                              )),

                        /// for searching a driver
                        if (value.searchingForDriver == true)
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: searchingForDriverWidget(
                                typeMsg: getCreateBooking?.msg ?? '',
                                msg2: getCreateBooking?.msg2 ?? '',
                                cancelButton: () {
                                  showCancelConfirmationDialog(
                                    context,
                                    () async {
                                      Navigator.pop(context);
                                      value
                                          .canceledBookingApi(context,
                                              bookingId:
                                                  ApiStatus.CancelBookingId ??
                                                      '')
                                          .then(
                                        (newValue) {
                                          if (ApiStatus.status == true) {
                                            setState(() {
                                              value.selectedDropAddress = '';
                                            });
                                          }
                                        },
                                      );
                                    },
                                  );
                                }),
                          ),

                        if (value.isPickUpLocation == true)
                          Positioned(
                              bottom: 10,
                              child: Container(
                                width: fontSize.w,
                                padding: const EdgeInsets.all(10),
                                child: CustomButton(
                                    onTap: () {
                                      needDriver(context, () {
                                        value.isHeader = true;
                                        value.isPickUpLocation = true;
                                        value.isTrackStatus = true;
                                        Navigator.pop(context);
                                      });
                                    },
                                    child: Headings.txt17WhiteBold(
                                        "Conform Location", context)),
                              )),
                        value.isLoading
                            ? Center(child: CustomProgressBar())
                            : SizedBox(),
                      ],
                    );
            },
          )),
    );
  }

  Future<void> _openPaymentDialog(BuildContext context) async {
    final selectedMode = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => PaymentAndCouponDialog(),
    );

    if (selectedMode != null) {
      if (selectedMode == "Cash") {
        setState(() {
          ApiStatus.setPaymentMode = "Cash";
        });
      } else {
        setState(() {
          ApiStatus.setPaymentMode = "Online";
        });
      }
    }
  }

  Widget isFavoriteWidget({String? address, String? lat, String? long}) {
    MyFontSize fontSize = MyFontSize(context);

    TextEditingController otherController = TextEditingController();
    bool isHome = false;
    bool isWork = false;
    bool isOther = false;
    void _updateCheckboxState(String selected) {
      setState(() {
        isHome = selected == "Home";
        isWork = selected == "Work";
        isOther = selected == "Other";
      });
    }

    return InkWell(
      onTap: () {
        print(address);
        if (address == '') {
          return Utils.toastMessage('Please select location');
        }
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          enableDrag: true,
          isDismissible: true,
          useRootNavigator: true,
          builder: (context) {
            return StatefulBuilder(
              builder: (context, modalSetState) {
                return DraggableScrollableSheet(
                  initialChildSize: isOther == true ? 0.7 : 0.4,
                  minChildSize: 0.2,
                  maxChildSize: 0.75,
                  builder: (context, scrollController) {
                    return Container(
                      padding: EdgeInsets.only(
                        left: 10,
                        right: 10,
                        bottom: MediaQuery.of(context).viewInsets.bottom +
                            20, // for keyboard
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: InkWell(
                                onTap: () => Navigator.pop(context),
                                child: Container(
                                  margin: EdgeInsets.only(top: 10),
                                  decoration: BoxDecoration(
                                    color: AppColor.blackColor,
                                    shape: BoxShape.circle,
                                  ),
                                  padding: const EdgeInsets.all(15),
                                  child: Image.asset(
                                    Images.cross,
                                    height: fontSize.h * 0.02,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            Headings.txt20BlackBold(
                                "Save as favorite", context),
                            SizedBox(height: 8),
                            Headings.txt15black400(address ?? '', context),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _checkbox("Home", isHome, (val) {
                                  modalSetState(() {
                                    _updateCheckboxState("Home");
                                  });
                                }),
                                _checkbox("Work", isWork, (val) {
                                  modalSetState(() {
                                    _updateCheckboxState("Work");
                                  });
                                }),
                                _checkbox("Other", isOther, (val) {
                                  modalSetState(() {
                                    _updateCheckboxState("Other");
                                  });
                                }),
                              ],
                            ),
                            if (isOther)
                              CustomTextForm(
                                controller: otherController,
                                prefixIcon: Icon(Icons.favorite,
                                    color: AppColor.appColor, size: 20),
                                hintText: "Name your favorite (Ex: Gym)",
                                labelText: "Other",
                              ),
                            SizedBox(height: 20),
                            CustomButton(
                              onTap: () async {
                                final userId =
                                    await MySharedPreferences.getUserId();
                                if (isOther == true) {
                                  if (otherController.text.isEmpty) {
                                    return Utils.toastMessage(
                                        "Please enter name");
                                  }
                                }
                                Provider.of<HomePageViewModel>(context,
                                        listen: false)
                                    .addFevAddressApi({
                                  'user_id': userId.toString(),
                                  'address_type_name': isHome
                                      ? "Home"
                                      : isWork
                                          ? "Work"
                                          : otherController.text,
                                  'gps_address': address.toString(),
                                  'gps_lat': lat.toString(),
                                  'gps_long': long.toString(),
                                }, context);
                              },
                              child: Headings.txt17WhiteBold(
                                Provider.of<HomePageViewModel>(context)
                                        .isLoading
                                    ? "Loading..."
                                    : "Save",
                                context,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            );
          },
        );
      },
      child: Icon(Icons.favorite_border, color: AppColor.blackColor, size: 20),
    );
  }

  Widget _checkbox(String label, bool value, Function(bool?) onChanged) {
    return Row(
      children: [
        Checkbox(
          shape: const CircleBorder(),
          value: value,
          onChanged: onChanged,
        ),
        Text(label),
      ],
    );
  }
}
