
import 'dart:io';

abstract class BaseApiServices
{
  Future<dynamic> getGetApiResponse(String url);
  Future<dynamic> getPostApiResponse(String url,dynamic data, {Map<String, File>? files});
  Future <dynamic> getDeleteApiResponse(String url,String data);
}