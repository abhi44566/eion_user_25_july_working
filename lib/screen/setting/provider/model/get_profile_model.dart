class GetProfileModel {
  GetProfileModel({
      Response? response,}){
    _response = response;
}

  GetProfileModel.fromJson(dynamic json) {
    _response = json['response'] != null ? Response.fromJson(json['response']) : null;
  }
  Response? _response;
GetProfileModel copyWith({  Response? response,
}) => GetProfileModel(  response: response ?? _response,
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
      String? id, 
      String? fullName, 
      String? mobileNumber, 
      String? emailId, 
      String? profilePhoto, 
      String? address, 
      String? city, 
      String? state, 
      String? zipCode, 
      String? country, 
      String? walletAmt, 
      String? userStatus, 
      String? registerDateTime, 
      String? isDeleted, 
      String? msg, 
      bool? status,}){
    _id = id;
    _fullName = fullName;
    _mobileNumber = mobileNumber;
    _emailId = emailId;
    _profilePhoto = profilePhoto;
    _address = address;
    _city = city;
    _state = state;
    _zipCode = zipCode;
    _country = country;
    _walletAmt = walletAmt;
    _userStatus = userStatus;
    _registerDateTime = registerDateTime;
    _isDeleted = isDeleted;
    _msg = msg;
    _status = status;
}

  Response.fromJson(dynamic json) {
    _id = json['id'];
    _fullName = json['full_name'];
    _mobileNumber = json['mobile_number'];
    _emailId = json['email_id'];
    _profilePhoto = json['profile_photo'];
    _address = json['address'];
    _city = json['city'];
    _state = json['state'];
    _zipCode = json['zip_code'];
    _country = json['country'];
    _walletAmt = json['wallet_amt'];
    _userStatus = json['user_status'];
    _registerDateTime = json['register_date_time'];
    _isDeleted = json['is_deleted'];
    _msg = json['msg'];
    _status = json['status'];
  }
  String? _id;
  String? _fullName;
  String? _mobileNumber;
  String? _emailId;
  String? _profilePhoto;
  String? _address;
  String? _city;
  String? _state;
  String? _zipCode;
  String? _country;
  String? _walletAmt;
  String? _userStatus;
  String? _registerDateTime;
  String? _isDeleted;
  String? _msg;
  bool? _status;
Response copyWith({  String? id,
  String? fullName,
  String? mobileNumber,
  String? emailId,
  String? profilePhoto,
  String? address,
  String? city,
  String? state,
  String? zipCode,
  String? country,
  String? walletAmt,
  String? userStatus,
  String? registerDateTime,
  String? isDeleted,
  String? msg,
  bool? status,
}) => Response(  id: id ?? _id,
  fullName: fullName ?? _fullName,
  mobileNumber: mobileNumber ?? _mobileNumber,
  emailId: emailId ?? _emailId,
  profilePhoto: profilePhoto ?? _profilePhoto,
  address: address ?? _address,
  city: city ?? _city,
  state: state ?? _state,
  zipCode: zipCode ?? _zipCode,
  country: country ?? _country,
  walletAmt: walletAmt ?? _walletAmt,
  userStatus: userStatus ?? _userStatus,
  registerDateTime: registerDateTime ?? _registerDateTime,
  isDeleted: isDeleted ?? _isDeleted,
  msg: msg ?? _msg,
  status: status ?? _status,
);
  String? get id => _id;
  String? get fullName => _fullName;
  String? get mobileNumber => _mobileNumber;
  String? get emailId => _emailId;
  String? get profilePhoto => _profilePhoto;
  String? get address => _address;
  String? get city => _city;
  String? get state => _state;
  String? get zipCode => _zipCode;
  String? get country => _country;
  String? get walletAmt => _walletAmt;
  String? get userStatus => _userStatus;
  String? get registerDateTime => _registerDateTime;
  String? get isDeleted => _isDeleted;
  String? get msg => _msg;
  bool? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['full_name'] = _fullName;
    map['mobile_number'] = _mobileNumber;
    map['email_id'] = _emailId;
    map['profile_photo'] = _profilePhoto;
    map['address'] = _address;
    map['city'] = _city;
    map['state'] = _state;
    map['zip_code'] = _zipCode;
    map['country'] = _country;
    map['wallet_amt'] = _walletAmt;
    map['user_status'] = _userStatus;
    map['register_date_time'] = _registerDateTime;
    map['is_deleted'] = _isDeleted;
    map['msg'] = _msg;
    map['status'] = _status;
    return map;
  }

}