class GetCityStateModel {
  GetCityStateModel({
      Response? response,}){
    _response = response;
}

  GetCityStateModel.fromJson(dynamic json) {
    _response = json['response'] != null ? Response.fromJson(json['response']) : null;
  }
  Response? _response;
GetCityStateModel copyWith({  Response? response,
}) => GetCityStateModel(  response: response ?? _response,
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
      List<StateList>? stateList, 
      String? msg, 
      bool? status,}){
    _stateList = stateList;
    _msg = msg;
    _status = status;
}

  Response.fromJson(dynamic json) {
    if (json['state_list'] != null) {
      _stateList = [];
      json['state_list'].forEach((v) {
        _stateList?.add(StateList.fromJson(v));
      });
    }
    _msg = json['msg'];
    _status = json['status'];
  }
  List<StateList>? _stateList;
  String? _msg;
  bool? _status;
Response copyWith({  List<StateList>? stateList,
  String? msg,
  bool? status,
}) => Response(  stateList: stateList ?? _stateList,
  msg: msg ?? _msg,
  status: status ?? _status,
);
  List<StateList>? get stateList => _stateList;
  String? get msg => _msg;
  bool? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_stateList != null) {
      map['state_list'] = _stateList?.map((v) => v.toJson()).toList();
    }
    map['msg'] = _msg;
    map['status'] = _status;
    return map;
  }

}

class StateList {
  StateList({
      String? id, 
      String? name, 
      List<CityList>? cityList,}){
    _id = id;
    _name = name;
    _cityList = cityList;
}

  StateList.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    if (json['city_list'] != null) {
      _cityList = [];
      json['city_list'].forEach((v) {
        _cityList?.add(CityList.fromJson(v));
      });
    }
  }
  String? _id;
  String? _name;
  List<CityList>? _cityList;
StateList copyWith({  String? id,
  String? name,
  List<CityList>? cityList,
}) => StateList(  id: id ?? _id,
  name: name ?? _name,
  cityList: cityList ?? _cityList,
);
  String? get id => _id;
  String? get name => _name;
  List<CityList>? get cityList => _cityList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    if (_cityList != null) {
      map['city_list'] = _cityList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class CityList {
  CityList({
      String? id, 
      String? name,}){
    _id = id;
    _name = name;
}

  CityList.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  String? _id;
  String? _name;
CityList copyWith({  String? id,
  String? name,
}) => CityList(  id: id ?? _id,
  name: name ?? _name,
);
  String? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }

}