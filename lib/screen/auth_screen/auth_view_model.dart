import 'package:driver_suvidha_user/import.dart';
import 'package:driver_suvidha_user/provider/utils/utils.dart';
import 'package:driver_suvidha_user/screen/auth_screen/repo.dart';
import 'package:driver_suvidha_user/screen/map_screen/map.dart';
import 'package:driver_suvidha_user/utils/session.dart';
class AuthViewModel extends ChangeNotifier {
  final _myRepo = AuthRepository();
  bool isLoading = false;
TextEditingController mobileNum = TextEditingController();

  Future<dynamic> mobileVerificationApi(BuildContext context) async {
    if(mobileNum.text.isEmpty){
      return Utils.toastMessage('Please enter mobile number');
    }else if(mobileNum.text.length!=10){
      return Utils.toastMessage('Please enter valid mobile number');
    }
    isLoading=true;
    notifyListeners();
    try {
      await _myRepo.mobileVerificationRepo({
        "mobile_number":mobileNum.text.toString(),
        "device_token":'',
        "device_type":''
      } , context);

    } finally {
      isLoading = false;
      notifyListeners();
    }
  }


// Future<void> logout(BuildContext context) async {
//   final SharedPreferences prefs = await _prefs;
//   await prefs.remove('userId');
//
// }

Future<void> checkLoginStatus(BuildContext context) async {
    final userId = await MySharedPreferences.getUserId();
  if (userId != "") {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MapScreen()));
  } else {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OnboardingScreen()));
  }
}
}





