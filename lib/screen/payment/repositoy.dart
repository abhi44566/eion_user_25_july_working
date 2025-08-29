import  'package:driver_suvidha_user/import.dart';
class PaymentRepository{
  final BaseApiServices  _baseApiServices = NetworkApiServices();
  Future<dynamic> getPaymentRepo(dynamic data, context) async {
    var baseUrl =   Provider.of<BaseUrlViewModel>(context, listen: false);
    var endpoint = baseUrl.barFee?.response?.y2x5f3??"";
    try {
      dynamic response = await _baseApiServices.getPostApiResponse(
          "${baseUrl.getUrl(endpoint).toString()}", data);
      return GetPaymentModel.fromJson(response);
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<dynamic>   sendBookingPaymentSuccessRepo(dynamic data, context) async {
    var baseUrl =   Provider.of<BaseUrlViewModel>(context, listen: false);
    var endpoint = baseUrl.barFee?.response?.fg45u??"";
    try {
      dynamic response = await _baseApiServices.getPostApiResponse(
          "${baseUrl.getUrl(endpoint).toString()}", data);
      Utils.toastMessage(response["response"]['msg']);
      return response;
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<dynamic> postWalletRechargeRepo(dynamic data, context) async {
    var baseUrl =   Provider.of<BaseUrlViewModel>(context, listen: false);
    var endpoint = baseUrl.barFee?.response?.t5f1t4??"";
    try {
      dynamic response = await _baseApiServices.getPostApiResponse(
          "${baseUrl.getUrl(endpoint).toString()}", data);
       Utils.toastMessage(response['response']['msg']);
      return response;
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<dynamic> sendFeedBackRepo(dynamic data, context) async {
    var baseUrl =   Provider.of<BaseUrlViewModel>(context, listen: false);
    var endpoint = baseUrl.barFee?.response?.av15m??"";
    try {
      dynamic response = await _baseApiServices.getPostApiResponse( "${baseUrl.getUrl(endpoint).toString()}", data);
      Utils.toastMessage(response['response']['msg']);
      return response;
    } catch (e) {
      print("Error: $e");
    }
  }


}