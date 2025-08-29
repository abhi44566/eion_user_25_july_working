import 'package:driver_suvidha_user/import.dart';
import 'package:driver_suvidha_user/screen/map_screen/provider/model/create_booking_model.dart';
import 'package:driver_suvidha_user/screen/map_screen/provider/model/get_fev_address_list_model.dart';
import 'package:driver_suvidha_user/screen/map_screen/provider/model/get_order_detail_model.dart';
import 'package:driver_suvidha_user/screen/map_screen/provider/model/get_rental_model.dart';
import 'package:driver_suvidha_user/screen/map_screen/provider/model/home_page_model.dart';
import 'package:driver_suvidha_user/screen/map_screen/provider/model/outstation_model.dart';
import 'package:driver_suvidha_user/screen/map_screen/provider/model/proceed_cab_flexy_model.dart';

class HomeRepository {
  final BaseApiServices _baseApiServices = NetworkApiServices();
  Future<dynamic> getHomePageRepo(dynamic data, context) async {
    var baseUrl = Provider.of<BaseUrlViewModel>(context, listen: false);
    var endpoint = baseUrl.barFee?.response?.gped9 ?? "";
    try {
      dynamic response = await _baseApiServices.getPostApiResponse(
          "${baseUrl.getUrl(endpoint).toString()}", data);
      final msg = response["response"]['msg'];
      Utils.toastMessage(msg);
      return HomePageModel.fromJson(response);
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<dynamic> proceedFexyRepo(dynamic data, context) async {
    var baseUrl = Provider.of<BaseUrlViewModel>(context, listen: false);
    var endpoint = baseUrl.barFee?.response?.hv9pd ?? "";
    try {
      dynamic response = await _baseApiServices.getPostApiResponse(
          "${baseUrl.getUrl(endpoint).toString()}", data);
      return ProceedCabFlexyModel.fromJson(response);
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<dynamic> proceedCouponRepo(dynamic data, context) async {
    var baseUrl = Provider.of<BaseUrlViewModel>(context, listen: false);
    var endpoint = baseUrl.barFee?.response?.xxfsoh8780 ?? "";
    try {
      return await _baseApiServices.getPostApiResponse(
          "${baseUrl.getUrl(endpoint).toString()}", data);
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<dynamic> proceedRentalRepo(dynamic data, context) async {
    var baseUrl = Provider.of<BaseUrlViewModel>(context, listen: false);
    var endpoint = baseUrl.barFee?.response?.npk39 ?? "";
    try {
      dynamic response = await _baseApiServices.getPostApiResponse(
          "${baseUrl.getUrl(endpoint).toString()}", data);
      return GetRentalModel.fromJson(response);
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<dynamic> proceedOutstationRepo(dynamic data, context) async {
    var baseUrl = Provider.of<BaseUrlViewModel>(context, listen: false);
    var endpoint = baseUrl.barFee?.response?.al45p ?? "";
    try {
      dynamic response = await _baseApiServices.getPostApiResponse(
          "${baseUrl.getUrl(endpoint).toString()}", data);
      return OutstationModel.fromJson(response);
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<dynamic> createBookingRepo(dynamic data, context) async {
    var baseUrl = Provider.of<BaseUrlViewModel>(context, listen: false);
    var endpoint = baseUrl.barFee?.response?.ytsxk ?? "";
    try {
      dynamic response = await _baseApiServices.getPostApiResponse(
          "${baseUrl.getUrl(endpoint).toString()}", data);
      final msg = response["response"]['msg'];
      ApiStatus.bookingId = response["response"]['booking_id'];
      Utils.toastMessage(msg);
      return CreateBookingModel.fromJson(response);
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<dynamic> getOrderDetailRepo(dynamic data, context) async {
    var baseUrl = Provider.of<BaseUrlViewModel>(context, listen: false);
    var endpoint = baseUrl.barFee?.response?.tv9bp ?? "";
    print(baseUrl.getUrl(endpoint).toString());
    try {
      dynamic response = await _baseApiServices.getPostApiResponse(
          "${baseUrl.getUrl(endpoint).toString()}", data);
      // final msg = response["response"]['msg'];
      //Utils.toastMessage(msg);
      return GetOrderDetailModel.fromJson(response);
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<dynamic> addFevAddressRepo(dynamic data, context) async {
    var baseUrl = Provider.of<BaseUrlViewModel>(context, listen: false);
    var endpoint = baseUrl.barFee?.response?.ke5a21 ?? "";
    try {
      dynamic response = await _baseApiServices.getPostApiResponse(
          "${baseUrl.getUrl(endpoint).toString()}", data);
      if (ApiStatus.status == true) {
        Navigator.pop(context);
      }
      Utils.toastMessage('${response["response"]['msg']}');

      return response;
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<dynamic> cancelledBookingRepo(dynamic data, context) async {
    var baseUrl = Provider.of<BaseUrlViewModel>(context, listen: false);
    var endpoint = baseUrl.barFee?.response?.bs62jp ?? "";
    try {
      dynamic response = await _baseApiServices.getPostApiResponse(
          "${baseUrl.getUrl(endpoint).toString()}", data);
      print(response["response"]['msg']);
      Utils.toastMessage('${response["response"]['msg']}');
      return response;
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<dynamic> getFevAddressListRepo(dynamic data, context) async {
    var baseUrl = Provider.of<BaseUrlViewModel>(context, listen: false);
    var endpoint = baseUrl.barFee?.response?.w9qbs6 ?? "";
    try {
      dynamic response = await _baseApiServices.getPostApiResponse(
          "${baseUrl.getUrl(endpoint).toString()}", data);
      return GetFevAddressListModel.fromJson(response);
    } catch (e) {
      print("Error: $e");
    }
  }


  Future<dynamic> removePromoCode(dynamic data, context) async {
    var baseUrl = Provider.of<BaseUrlViewModel>(context, listen: false);
    var endpoint = baseUrl.barFee?.response?.xxfsoh8781 ?? "";
    try {
      dynamic response = await _baseApiServices.getPostApiResponse( "${baseUrl.getUrl(endpoint).toString()}", data);
      Utils.toastMessage('${response["response"]['msg']}');
      return response;
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<dynamic> faveAddressRemoveRepo(dynamic data, context) async {
    var baseUrl = Provider.of<BaseUrlViewModel>(context, listen: false);
    var endpoint = baseUrl.barFee?.response?.xxfsoh8788 ?? "";
    try {
      dynamic response = await _baseApiServices.getPostApiResponse(
          "${baseUrl.getUrl(endpoint).toString()}", data);
      print('-------------${response['response']['msg']}');
      Utils.toastMessage('${response['response']['msg']}');
      return response;
    } catch (e) {
      print("Error: $e");
    }
  }


}
