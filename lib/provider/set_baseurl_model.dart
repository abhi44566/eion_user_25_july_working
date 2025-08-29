import 'dart:convert';
import 'package:driver_suvidha_user/provider/base_url_model.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
class BaseUrlViewModel with ChangeNotifier {
  BaseUrlModel? _barFee;
  bool _isLoading = false;
  BaseUrlModel? get barFee => _barFee;
  bool get isLoading => _isLoading;
  String getUrl(String tag)  {
    var url ='http://${_barFee?.response?.abcd}${_barFee?.response?.dcba}$tag';
    return url;
  }
  Future<void> fetchBarFee() async {
    _isLoading = true;
    notifyListeners();
   // final url = Uri.parse("https://eionrides.com/eion_app/api_config/barfi.php");
    final url = Uri.parse("https://eionrides.com/eion_app_new/api_config/barfi.php");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      // print(responseData);
      _barFee = BaseUrlModel.fromJson(responseData);
      notifyListeners();
    } else {
    }
    _isLoading = false;
    notifyListeners();
  }

}