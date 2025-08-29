class GetFevAddressListModel {
  GetFevAddressListModel({
      Response? response,}){
    _response = response;
}

  GetFevAddressListModel.fromJson(dynamic json) {
    _response = json['response'] != null ? Response.fromJson(json['response']) : null;
  }
  Response? _response;
GetFevAddressListModel copyWith({  Response? response,
}) => GetFevAddressListModel(  response: response ?? _response,
);
  Response? get response => _response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_response != null) {
      map['response'] = _response?.toJson();
    }
    return map;
  }

}

class Response {
  Response({
      List<FavouriteLocationList>? favouriteLocationList, 
      String? msg, 
      bool? status,}){
    _favouriteLocationList = favouriteLocationList;
    _msg = msg;
    _status = status;
}

  Response.fromJson(dynamic json) {
    if (json['favourite_location_list'] != null) {
      _favouriteLocationList = [];
      json['favourite_location_list'].forEach((v) {
        _favouriteLocationList?.add(FavouriteLocationList.fromJson(v));
      });
    }
    _msg = json['msg'];
    _status = json['status'];
  }
  List<FavouriteLocationList>? _favouriteLocationList;
  String? _msg;
  bool? _status;
Response copyWith({  List<FavouriteLocationList>? favouriteLocationList,
  String? msg,
  bool? status,
}) => Response(  favouriteLocationList: favouriteLocationList ?? _favouriteLocationList,
  msg: msg ?? _msg,
  status: status ?? _status,
);
  List<FavouriteLocationList>? get favouriteLocationList => _favouriteLocationList;
  String? get msg => _msg;
  bool? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_favouriteLocationList != null) {
      map['favourite_location_list'] = _favouriteLocationList?.map((v) => v.toJson()).toList();
    }
    map['msg'] = _msg;
    map['status'] = _status;
    return map;
  }

}

class FavouriteLocationList {
  FavouriteLocationList({
      String? id, 
      String? gpsAddress, 
      String? gpsLat, 
      String? gpsLong, 
      String? addressTypeName,}){
    _id = id;
    _gpsAddress = gpsAddress;
    _gpsLat = gpsLat;
    _gpsLong = gpsLong;
    _addressTypeName = addressTypeName;
}

  FavouriteLocationList.fromJson(dynamic json) {
    _id = json['id'];
    _gpsAddress = json['gps_address'];
    _gpsLat = json['gps_lat'];
    _gpsLong = json['gps_long'];
    _addressTypeName = json['address_type_name'];
  }
  String? _id;
  String? _gpsAddress;
  String? _gpsLat;
  String? _gpsLong;
  String? _addressTypeName;
FavouriteLocationList copyWith({  String? id,
  String? gpsAddress,
  String? gpsLat,
  String? gpsLong,
  String? addressTypeName,
}) => FavouriteLocationList(  id: id ?? _id,
  gpsAddress: gpsAddress ?? _gpsAddress,
  gpsLat: gpsLat ?? _gpsLat,
  gpsLong: gpsLong ?? _gpsLong,
  addressTypeName: addressTypeName ?? _addressTypeName,
);
  String? get id => _id;
  String? get gpsAddress => _gpsAddress;
  String? get gpsLat => _gpsLat;
  String? get gpsLong => _gpsLong;
  String? get addressTypeName => _addressTypeName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['gps_address'] = _gpsAddress;
    map['gps_lat'] = _gpsLat;
    map['gps_long'] = _gpsLong;
    map['address_type_name'] = _addressTypeName;
    return map;
  }

}