import 'package:driver_suvidha_user/import.dart';

class AuthRepository {
  final BaseApiServices _baseApiServices = NetworkApiServices();
  Future<dynamic> mobileVerificationRepo(dynamic data, context) async {
    var baseUrl = Provider.of<BaseUrlViewModel>(context, listen: false);
    var endpoint = baseUrl.barFee?.response?.dth9p ?? "";
    try {
      dynamic response = await _baseApiServices.getPostApiResponse(
          "${baseUrl.getUrl(endpoint).toString()}", data);
      final msg = response["response"]['msg'];
      final otp = response["response"]['otp_code'];
      ApiStatus.otp = otp;
      // Utils.toastMessage(msg);
      // Utils.toastMessage(otp);
      if (ApiStatus.status == true) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => OtpScreen(
                      userId: response["response"]['id'],
                      full_name: response["response"]['full_name'],
                      msg :msg
                    )));
      }
      return response;
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<dynamic> userRegistrationRepo(
      dynamic data, String mobileNumber, context) async {
    var baseUrl = Provider.of<BaseUrlViewModel>(context, listen: false);
    var verification = baseUrl.barFee?.response?.tan4z ?? "";
    try {
      dynamic response = await _baseApiServices.getPostApiResponse(
          baseUrl.getUrl(verification), data);
      var setUserId = response["response"]["user_id"];
      await MySharedPreferences.setUserId(setUserId);
      if (ApiStatus.status == true) {}
      return response;
    } catch (e) {}
  }

  Future<dynamic> loginRepo(dynamic data, String mobileNumber, context) async {
    var baseUrl = Provider.of<BaseUrlViewModel>(context, listen: false);
    var loginUrl = baseUrl.barFee?.response?.tcv2x ?? "";
    try {
      dynamic response = await _baseApiServices.getPostApiResponse(
          baseUrl.getUrl(loginUrl), data);
      var userId = response["response"]["user_id"];
      await MySharedPreferences.setUserId(userId);

      if (ApiStatus.status == true) {
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  LoginScreen(mobileNumber: mobileNumber,)));
      }
      return response;
    } catch (e) {}
  }
}
