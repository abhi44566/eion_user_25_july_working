import 'dart:io';

import 'package:driver_suvidha_user/provider/data/checkStatus.dart';
import 'package:driver_suvidha_user/provider/data/network/baseapi_services.dart';
import 'package:driver_suvidha_user/provider/data/network/networkApiServices.dart';
import 'package:driver_suvidha_user/provider/set_baseurl_model.dart';
import 'package:driver_suvidha_user/provider/utils/utils.dart';
import 'package:driver_suvidha_user/screen/setting/provider/model/get_city_state_model.dart';
import 'package:driver_suvidha_user/screen/setting/provider/model/get_profile_model.dart';
import 'package:driver_suvidha_user/screen/setting/provider/model/get_refer_and_earn_model.dart';
import 'package:provider/provider.dart';

import '../../../../utils/session.dart';
import '../model/deleteAccountReponse.dart';
import '../model/get_transaction_model.dart';

class ProfileRepository{
  final BaseApiServices  _baseApiServices = NetworkApiServices();

  Future<dynamic> getProfileRepo(dynamic data, context) async {
    var baseUrl =   Provider.of<BaseUrlViewModel>(context, listen: false);
    var endpoint = baseUrl.barFee?.response?.t6rpg??"";
    try {
      dynamic response = await _baseApiServices.getPostApiResponse(
          "${baseUrl.getUrl(endpoint).toString()}", data);
 if(ApiStatus.status==true){
   await   MySharedPreferences.setFullName(response['response']['full_name']);
 }


      return GetProfileModel.fromJson(response);
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<dynamic> updateProfileRepo(dynamic data, Map<String, File>? files, context) async {
    var baseUrl =   Provider.of<BaseUrlViewModel>(context, listen: false);
    var endpoint = baseUrl.barFee?.response?.xx9820??"";
    try {
      dynamic response = await _baseApiServices.getPostApiResponse(
          "${baseUrl.getUrl(endpoint).toString()}", data,files:files );
      return GetProfileModel.fromJson(response);
    } catch (e) {
      print("Error: $e");
    }
  }


  Future<dynamic> getWalletTransactionRepo(dynamic data, context) async {
    var baseUrl =   Provider.of<BaseUrlViewModel>(context, listen: false);
    var endpoint = baseUrl.barFee?.response?.g7140??"";
    try {
      dynamic response = await _baseApiServices.getPostApiResponse(
          "${baseUrl.getUrl(endpoint).toString()}", data);
      return GetTransactionModel.fromJson(response);
    } catch (e) {
      print("Error: $e");
    }
  }


  Future<dynamic> getCityStateListRepo(dynamic data, context) async {
    var baseUrl =   Provider.of<BaseUrlViewModel>(context, listen: false);
    var endpoint = baseUrl.barFee?.response?.mu2taj??"";
    try {
      dynamic response = await _baseApiServices.getPostApiResponse(
          "${baseUrl.getUrl(endpoint).toString()}", data);
      return GetCityStateModel.fromJson(response);
    } catch (e) {
      print("Error: $e");
    }
  }




  Future<dynamic> getReferAndEarnRepo(dynamic data, context) async {
    var baseUrl =   Provider.of<BaseUrlViewModel>(context, listen: false);
    var endpoint = baseUrl.barFee?.response?.xxhpdl8768??"";
    try {
      dynamic response = await _baseApiServices.getPostApiResponse( "${baseUrl.getUrl(endpoint).toString()}", data);
      return  GetReferAndEarnModel.fromJson(response);
    } catch (e) {
      print("Error: $e");
    }
  }


  Future<dynamic> sendHelpRepo(dynamic data, context) async {
    var baseUrl =   Provider.of<BaseUrlViewModel>(context, listen: false);
    var endpoint = baseUrl.barFee?.response?.mqc9p??"";
    try {
      dynamic response = await _baseApiServices.getPostApiResponse( "${baseUrl.getUrl(endpoint).toString()}", data);
      Utils.toastMessage(response['response']['msg']);
      return  response;
    } catch (e) {
      print("Error: $e");
    }
  }

//N7Q4Z
  Future<dynamic> getDeleteAccountRepo(dynamic data, context) async {
    var baseUrl =   Provider.of<BaseUrlViewModel>(context, listen: false);
    var endpoint = baseUrl.barFee?.response?.n7q4z??"";
    try {
      dynamic response = await _baseApiServices.getPostApiResponse( "${baseUrl.getUrl(endpoint).toString()}", data);
      Utils.toastMessage(response['response']['msg']);
      return  deleteAccountEionResponse.fromJson(response);
    } catch (e) {
      print("Error: $e");
    }
  }
}