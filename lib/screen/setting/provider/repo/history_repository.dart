import 'package:driver_suvidha_user/provider/data/network/baseapi_services.dart';
import 'package:driver_suvidha_user/provider/data/network/networkApiServices.dart';
import 'package:driver_suvidha_user/provider/set_baseurl_model.dart';
import 'package:driver_suvidha_user/screen/map_screen/provider/model/get_order_detail_model.dart';
import 'package:driver_suvidha_user/screen/setting/provider/model/get_order_history_model.dart';
import 'package:provider/provider.dart';
class HistoryRepository{
  final BaseApiServices  _baseApiServices = NetworkApiServices();
  Future<dynamic> getOrderHistoryRepo(dynamic data, context) async {
    var baseUrl =   Provider.of<BaseUrlViewModel>(context, listen: false);
    var endpoint = baseUrl.barFee?.response?.bci4k??"";
    try {
      dynamic response = await _baseApiServices.getPostApiResponse(
          "${baseUrl.getUrl(endpoint).toString()}", data);
      return GetOrderHistoryModel.fromJson(response);
    } catch (e) {
      print("Error: $e");
    }
  }


  Future<dynamic> getBookingHistoryDetailRepo(dynamic data, context) async {
    var baseUrl =   Provider.of<BaseUrlViewModel>(context, listen: false);
    var endpoint = baseUrl.barFee?.response?.tv9bp??"";
    try {
      dynamic response = await _baseApiServices.getPostApiResponse(
          "${baseUrl.getUrl(endpoint).toString()}", data);
      return GetOrderDetailModel.fromJson(response);
    } catch (e) {
      print("Error: $e");
    }
  }

}