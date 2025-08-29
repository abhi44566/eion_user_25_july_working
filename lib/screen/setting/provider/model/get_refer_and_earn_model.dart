class GetReferAndEarnModel {
  GetReferAndEarnModel({
      Response? response,}){
    _response = response;
}

  GetReferAndEarnModel.fromJson(dynamic json) {
    _response = json['response'] != null ? Response.fromJson(json['response']) : null;
  }
  Response? _response;
GetReferAndEarnModel copyWith({  Response? response,
}) => GetReferAndEarnModel(  response: response ?? _response,
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
      String? referralCode, 
      String? referImage, 
      String? referPageMsg, 
      String? shareMessage, 
      String? msg, 
      bool? status,}){
    _referralCode = referralCode;
    _referImage = referImage;
    _referPageMsg = referPageMsg;
    _shareMessage = shareMessage;
    _msg = msg;
    _status = status;
}

  Response.fromJson(dynamic json) {
    _referralCode = json['referral_code'];
    _referImage = json['refer_image'];
    _referPageMsg = json['refer_page_msg'];
    _shareMessage = json['share_message'];
    _msg = json['msg'];
    _status = json['status'];
  }
  String? _referralCode;
  String? _referImage;
  String? _referPageMsg;
  String? _shareMessage;
  String? _msg;
  bool? _status;
Response copyWith({  String? referralCode,
  String? referImage,
  String? referPageMsg,
  String? shareMessage,
  String? msg,
  bool? status,
}) => Response(  referralCode: referralCode ?? _referralCode,
  referImage: referImage ?? _referImage,
  referPageMsg: referPageMsg ?? _referPageMsg,
  shareMessage: shareMessage ?? _shareMessage,
  msg: msg ?? _msg,
  status: status ?? _status,
);
  String? get referralCode => _referralCode;
  String? get referImage => _referImage;
  String? get referPageMsg => _referPageMsg;
  String? get shareMessage => _shareMessage;
  String? get msg => _msg;
  bool? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['referral_code'] = _referralCode;
    map['refer_image'] = _referImage;
    map['refer_page_msg'] = _referPageMsg;
    map['share_message'] = _shareMessage;
    map['msg'] = _msg;
    map['status'] = _status;
    return map;
  }

}