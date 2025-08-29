import 'dart:io';
import 'package:driver_suvidha_user/import.dart';
import 'package:driver_suvidha_user/screen/setting/provider/model/get_city_state_model.dart';
import 'package:driver_suvidha_user/screen/setting/provider/model/get_profile_model.dart';
import 'package:driver_suvidha_user/screen/setting/provider/model/get_refer_and_earn_model.dart';
import 'package:driver_suvidha_user/screen/setting/provider/model/get_transaction_model.dart';
import 'package:driver_suvidha_user/screen/setting/provider/repo/repository.dart';
import 'package:image_picker/image_picker.dart';

import '../model/deleteAccountReponse.dart';
class ProfileViewModel extends ChangeNotifier {
  final _myRepo = ProfileRepository();
  bool isLoading = false;
  GetProfileModel? getProfileRes;
  GetTransactionModel? getTransctionRes;
  GetCityStateModel? _getCityStateRes;

  StateList? _selectedState;
  CityList? _selectedCity;
  GetCityStateModel? get getCityStateRes => _getCityStateRes;
  StateList? get selectedState => _selectedState;
  CityList? get selectedCity => _selectedCity;
  set selectedState(StateList? state) {
    _selectedState = state;
    print("state-------${_selectedState?.name}");
    notifyListeners();
  }
  set selectedCity(CityList? city) {
    _selectedCity = city;
    print(_selectedCity?.name);
    notifyListeners();
  }

  ///------> Delete Account

  deleteAccountEionResponse deleteAccount=deleteAccountEionResponse();

  GetReferAndEarnModel getReferAndEarnRes = GetReferAndEarnModel();
  TimeOfDay? selectedTime;
  int? selectedTimeIndex;
  int? selectedDateIndex;
  Map<int, DateTime> selectedDates = {};
  DateTime? selectedDate;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController  addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController zipController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  void setProfileValue (){
    nameController.text = getProfileRes?.response?.fullName??'';
    emailController.text = getProfileRes?.response?.emailId??'';
    phoneController.text = getProfileRes?.response?.mobileNumber??'';
    addressController.text = getProfileRes?.response?.address??'';
    cityController.text = getProfileRes?.response?.city??'';
    stateController.text = getProfileRes?.response?.state??'';
    zipController.text = getProfileRes?.response?.zipCode??'';
    countryController.text = getProfileRes?.response?.country??'';
  }
  File? selectedImage;
  final ImagePicker picker = ImagePicker();
  Future<void> pickImage(ImageSource source,BuildContext context) async {
    try {
      final pickedFile = await picker.pickImage(source: source);
      if (pickedFile != null) {
        selectedImage = File(pickedFile.path);
        notifyListeners();
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error picking image: \$e")),
      );
    }
  }


  Future<DateTime?> pickDate(BuildContext context) async {
    return await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
  }
  void setSelectedDate(DateTime date, int index) {
    selectedDateIndex = index;
    selectedDates[index] = date;
    notifyListeners();
  }
  Future<TimeOfDay?> pickTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );
    return pickedTime;
  }
  void setSelectedTime(TimeOfDay time, int index) {
    selectedTime = time;
    selectedTimeIndex = index;
    notifyListeners();
  }



  Future<dynamic> getProfileApi(BuildContext context) async {

    isLoading=true;
    notifyListeners();
    final userId = await MySharedPreferences.getUserId();
    try {
      getProfileRes = await _myRepo.getProfileRepo({
        'user_id':userId
      }, context);
      if(ApiStatus.status==true){
        setProfileValue ();
      }

    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<dynamic> updateProfileApi(BuildContext context) async {
    final userId = await MySharedPreferences.getUserId();
    if(nameController.text.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please enter name")));
      return;
    }else if(emailController.text.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please enter email")));
      return;
    }else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$')
        .hasMatch(emailController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a valid email")),
      );
      return;
    }
    else if( phoneController.text.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please enter phone number")));
      return;
    }else if(addressController.text.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please enter address")));
      return;
    }
    isLoading=true;
    notifyListeners();

    try {
      _myRepo.updateProfileRepo({
        'user_id':userId,
        'full_name':nameController.text.toString(),
        'email_id':emailController.text.trim().toString(),
        'address':addressController.text.toString(),
        'city':_selectedCity?.name??cityController.text,
        'state':_selectedState?.name??stateController.text,
        'zip_code':zipController.text.toString(),
        'country':"India",
        'mobile_number':phoneController.text.toString(),
      },{'profile_photo':selectedImage??File('')},
          context);
     if(ApiStatus.status==true){
      await getProfileApi(context);
       Navigator.pop(context,"refresh");
     }
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }



  Future<void> fetchCityStateList(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    final userId = await MySharedPreferences.getUserId();
    try {
      _getCityStateRes = await _myRepo.getCityStateListRepo({'user_id': userId}, context);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }



  Future<dynamic> getWalletTransactionApi(BuildContext context) async {
    isLoading=true;
    notifyListeners();
    final userId = await MySharedPreferences.getUserId();
    try {
      getTransctionRes =await   _myRepo.getWalletTransactionRepo({'user_id':userId}, context);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }



  Future<dynamic> getReferAndEarn(BuildContext context) async {
    final userId = await MySharedPreferences.getUserId();
    isLoading=true;
    notifyListeners();
    try {
      getReferAndEarnRes =  await  _myRepo.getReferAndEarnRepo({'user_id':userId}, context);

    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<dynamic> sendHelpAPi(BuildContext context,{
    String?userName,
    String? mobileNumber,
    String?remark
  }) async {
    final userId = await MySharedPreferences.getUserId();
    isLoading=true;
    notifyListeners();
    try {
       await  _myRepo.sendHelpRepo({
         'user_id':userId,
         'user_name':userName,
         'user_type':"User",
         'mobile_number':mobileNumber,
         'concern_message':remark
       }, context);
       if(ApiStatus.status==true){
         Navigator.pop(context);
       }
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  ///------> delete Account

  Future<dynamic> getDeleteAccountApi(BuildContext context) async {
    final userId = await MySharedPreferences.getUserId();
    isLoading=true;
    notifyListeners();
    try {
      deleteAccount =  await  _myRepo.getDeleteAccountRepo({'user_id':userId}, context);
      if(ApiStatus.status==true){
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => NumVerification()),
              (Route<dynamic> route) => false,
        );await MySharedPreferences.setUserId('');
      }

    } finally {
      isLoading = false;
      notifyListeners();
    }
  }


}





