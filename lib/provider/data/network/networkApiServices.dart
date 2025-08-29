import 'dart:convert';
import 'dart:io';
import 'package:driver_suvidha_user/provider/data/app_exception.dart';
import 'package:driver_suvidha_user/provider/data/checkStatus.dart';
import 'package:driver_suvidha_user/provider/data/network/baseapi_services.dart';
import 'package:driver_suvidha_user/provider/utils/utils.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(url),
          headers: {}).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        responseJson = jsonDecode(response.body);
      } else {
        responseJson = returnResponse(response);
      }
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    } catch (e) {
      throw e;
    }
    return responseJson;
  }
  // @override
  // Future<dynamic> getPostApiResponse(String url, dynamic data) async {
  //   dynamic responseJson;
  //   try {
  //     http.Response response = await http.post(Uri.parse(url), body: data, headers: {
  //       // 'Authorization': "Bearer $token"
  //     }).timeout(const Duration(seconds: 10));
  //     print(response.body);
  //     responseJson = returnResponse(response);
  //     if (responseJson is Map<String, dynamic>) {
  //       ApiStatus.status = responseJson['response']["status"] ??"";
  //     }
  //
  //     return responseJson;
  //   } on SocketException {
  //     Utils.toastMessage("No Internet Connection");
  //     throw FetchDataException("No Internet Connection");
  //   } catch (e) {
  //     Utils.toastMessage(e.toString());
  //     throw e;
  //   }
  // }

  Future<dynamic> getPostApiResponse(
    String url,
    dynamic data, {
    Map<String, File>? files,
  }) async {
    dynamic responseJson;
    try {
      print('🚀 Setting up Multipart Request...');
      var request = http.MultipartRequest("POST", Uri.parse(url));

      if (data is Map<String, dynamic>) {
        Map<String, String> convertedData =
            data.map((key, value) => MapEntry(key, value.toString()));
        request.fields.addAll(convertedData);
      } else {
        throw FormatException(
            "Invalid data format! Expected Map<String, String>.");
      }

      print('📨 Sending Request with Data: $data');

      if (files != null && files.isNotEmpty) {
        for (var entry in files.entries) {
          String fieldName = entry.key;
          File file = entry.value;
          if (file.existsSync()) {
            request.files.add(
              await http.MultipartFile.fromPath(
                fieldName,
                file.path,
                filename: file.path.split('/').last,
              ),
            );
            print('✅ Added file: $fieldName');
          } else {
            print('❌ ERROR: File does not exist: $fieldName');
          }
        }
      }

      var streamedResponse = await request.send();
      http.Response response = await http.Response.fromStream(streamedResponse);

      responseJson = returnResponse(response);
      ApiStatus.status = responseJson['response']['status'];
      if (responseJson == null) {
        print("❌ ERROR: Null Response Received!");
        return null;
      }

      return responseJson;
    } on SocketException {
      print('❌ No Internet Connection!');
      Utils.toastMessage("No Internet Connection");
      throw FetchDataException("No Internet Connection");
    } catch (e) {
      print('❌ Exception Occurred: $e');
      Utils.toastMessage(e.toString());
      throw e;
    }
  }

  @override
  Future<dynamic> getDeleteApiResponse(String url, dynamic body) async {
    dynamic responseJson;
    try {
      http.Response response = await http.delete(Uri.parse(url), body: body);
      responseJson = returnResponse(response);
      var message = responseJson["response"]['msg'];
      Utils.toastMessage(message);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
      case 500:
        throw UnauthorisedException(response.body.toString());
      default:
        throw FetchDataException(
            "Error occurred while communicating with server with status code ${response.statusCode}");
    }
  }
}
