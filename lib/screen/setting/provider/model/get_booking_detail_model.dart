class GetBookingDetailModel {
  GetBookingDetailModel({
      Response? response,}){
    _response = response;
}

  GetBookingDetailModel.fromJson(dynamic json) {
    _response = json['response'] != null ? Response.fromJson(json['response']) : null;
  }
  Response? _response;
GetBookingDetailModel copyWith({  Response? response,
}) => GetBookingDetailModel(  response: response ?? _response,
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
      List<HistoryList>? historyList, 
      String? msg, 
      bool? status,}){
    _historyList = historyList;
    _msg = msg;
    _status = status;
}

  Response.fromJson(dynamic json) {
    if (json['history_list'] != null) {
      _historyList = [];
      json['history_list'].forEach((v) {
        _historyList?.add(HistoryList.fromJson(v));
      });
    }
    _msg = json['msg'];
    _status = json['status'];
  }
  List<HistoryList>? _historyList;
  String? _msg;
  bool? _status;
Response copyWith({  List<HistoryList>? historyList,
  String? msg,
  bool? status,
}) => Response(  historyList: historyList ?? _historyList,
  msg: msg ?? _msg,
  status: status ?? _status,
);
  List<HistoryList>? get historyList => _historyList;
  String? get msg => _msg;
  bool? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_historyList != null) {
      map['history_list'] = _historyList?.map((v) => v.toJson()).toList();
    }
    map['msg'] = _msg;
    map['status'] = _status;
    return map;
  }

}

class HistoryList {
  HistoryList({
      String? bookingId, 
      String? userId, 
      String? userName, 
      String? userMobileNumber, 
      String? userPhoto, 
      String? userWalletAmt, 
      String? userDeviceToken, 
      String? fromGpsLat, 
      String? fromGpsLong, 
      String? fromGpsLocation, 
      String? toGpsLat, 
      String? toGpsLong, 
      String? toGpsLocation, 
      String? distance, 
      String? distanceDisplay, 
      String? orgFromLat, 
      String? orgFromLong, 
      String? orgToLat, 
      String? orgToLong, 
      String? orgFromGpsLocation, 
      String? orgToGpsLocation, 
      String? startKmReading, 
      String? endKmReading, 
      String? startKmPhoto, 
      String? endKmPhoto, 
      String? orgDistance, 
      String? pickupDate, 
      String? pickupTime, 
      String? pickupDateTime, 
      String? returnDate, 
      String? returnTime, 
      String? returnDateTime, 
      String? orgPickupDate, 
      String? orgPickupTime, 
      String? orgPickupDateTime, 
      String? orgReturnDate, 
      String? orgReturnTime, 
      String? orgReturnDateTime, 
      String? bookingType, 
      String? tripType, 
      String? vehicleTypeId, 
      String? vehicleTypeName, 
      String? icon, 
      String? fareId, 
      String? rideDurationInMinute, 
      String? rideDurationInMinuteOrg, 
      String? baseFare, 
      String? baseFareHour, 
      String? baseFareKm, 
      String? extraPerKmCharge, 
      String? extraPerHourMinCharge, 
      String? fixDriverAllowance, 
      String? perNightCharge, 
      String? isTollChargeExcluded, 
      String? gstApplicable, 
      String? nightStartTime, 
      String? nightEndTime, 
      String? roundTripDiscountPercent, 
      String? isPartkingExtra, 
      String? planName, 
      String? actualNightCharges, 
      String? actualNights, 
      String? actualExtraKm, 
      String? actualExtraDurationInMinHour, 
      String? actualExtraKmCharges, 
      String? actualDurationCharge, 
      String? discountAmt, 
      String? gstAmt, 
      String? parkingAmount, 
      String? tollTaxAmt, 
      String? netPayment, 
      String? payByWallet, 
      String? payByOnline, 
      String? payByCash, 
      String? skipForPay, 
      String? acceptTime, 
      String? goToPickupTime, 
      String? startOtp, 
      String? placedTime, 
      String? bookingStatus, 
      String? bookingLevel, 
      String? timeDisplayLevel, 
      String? rideDurationDisplay, 
      String? cancelBy, 
      String? cancelReason, 
      String? driverId, 
      String? driverName, 
      String? driverPhoto, 
      String? driverMobileNumber, 
      String? driverGender, 
      String? vehiclePhoto, 
      String? vehicleName, 
      String? vehicleNumber, 
      String? vehicleModel, 
      String? vehicleTypeIdDriver, 
      String? driverIsAppOpen, 
      String? driverAllotTime,}){
    _bookingId = bookingId;
    _userId = userId;
    _userName = userName;
    _userMobileNumber = userMobileNumber;
    _userPhoto = userPhoto;
    _userWalletAmt = userWalletAmt;
    _userDeviceToken = userDeviceToken;
    _fromGpsLat = fromGpsLat;
    _fromGpsLong = fromGpsLong;
    _fromGpsLocation = fromGpsLocation;
    _toGpsLat = toGpsLat;
    _toGpsLong = toGpsLong;
    _toGpsLocation = toGpsLocation;
    _distance = distance;
    _distanceDisplay = distanceDisplay;
    _orgFromLat = orgFromLat;
    _orgFromLong = orgFromLong;
    _orgToLat = orgToLat;
    _orgToLong = orgToLong;
    _orgFromGpsLocation = orgFromGpsLocation;
    _orgToGpsLocation = orgToGpsLocation;
    _startKmReading = startKmReading;
    _endKmReading = endKmReading;
    _startKmPhoto = startKmPhoto;
    _endKmPhoto = endKmPhoto;
    _orgDistance = orgDistance;
    _pickupDate = pickupDate;
    _pickupTime = pickupTime;
    _pickupDateTime = pickupDateTime;
    _returnDate = returnDate;
    _returnTime = returnTime;
    _returnDateTime = returnDateTime;
    _orgPickupDate = orgPickupDate;
    _orgPickupTime = orgPickupTime;
    _orgPickupDateTime = orgPickupDateTime;
    _orgReturnDate = orgReturnDate;
    _orgReturnTime = orgReturnTime;
    _orgReturnDateTime = orgReturnDateTime;
    _bookingType = bookingType;
    _tripType = tripType;
    _vehicleTypeId = vehicleTypeId;
    _vehicleTypeName = vehicleTypeName;
    _icon = icon;
    _fareId = fareId;
    _rideDurationInMinute = rideDurationInMinute;
    _rideDurationInMinuteOrg = rideDurationInMinuteOrg;
    _baseFare = baseFare;
    _baseFareHour = baseFareHour;
    _baseFareKm = baseFareKm;
    _extraPerKmCharge = extraPerKmCharge;
    _extraPerHourMinCharge = extraPerHourMinCharge;
    _fixDriverAllowance = fixDriverAllowance;
    _perNightCharge = perNightCharge;
    _isTollChargeExcluded = isTollChargeExcluded;
    _gstApplicable = gstApplicable;
    _nightStartTime = nightStartTime;
    _nightEndTime = nightEndTime;
    _roundTripDiscountPercent = roundTripDiscountPercent;
    _isPartkingExtra = isPartkingExtra;
    _planName = planName;
    _actualNightCharges = actualNightCharges;
    _actualNights = actualNights;
    _actualExtraKm = actualExtraKm;
    _actualExtraDurationInMinHour = actualExtraDurationInMinHour;
    _actualExtraKmCharges = actualExtraKmCharges;
    _actualDurationCharge = actualDurationCharge;
    _discountAmt = discountAmt;
    _gstAmt = gstAmt;
    _parkingAmount = parkingAmount;
    _tollTaxAmt = tollTaxAmt;
    _netPayment = netPayment;
    _payByWallet = payByWallet;
    _payByOnline = payByOnline;
    _payByCash = payByCash;
    _skipForPay = skipForPay;
    _acceptTime = acceptTime;
    _goToPickupTime = goToPickupTime;
    _startOtp = startOtp;
    _placedTime = placedTime;
    _bookingStatus = bookingStatus;
    _bookingLevel = bookingLevel;
    _timeDisplayLevel = timeDisplayLevel;
    _rideDurationDisplay = rideDurationDisplay;
    _cancelBy = cancelBy;
    _cancelReason = cancelReason;
    _driverId = driverId;
    _driverName = driverName;
    _driverPhoto = driverPhoto;
    _driverMobileNumber = driverMobileNumber;
    _driverGender = driverGender;
    _vehiclePhoto = vehiclePhoto;
    _vehicleName = vehicleName;
    _vehicleNumber = vehicleNumber;
    _vehicleModel = vehicleModel;
    _vehicleTypeIdDriver = vehicleTypeIdDriver;
    _driverIsAppOpen = driverIsAppOpen;
    _driverAllotTime = driverAllotTime;
}

  HistoryList.fromJson(dynamic json) {
    _bookingId = json['booking_id'];
    _userId = json['user_id'];
    _userName = json['user_name'];
    _userMobileNumber = json['user_mobile_number'];
    _userPhoto = json['user_photo'];
    _userWalletAmt = json['user_wallet_amt'];
    _userDeviceToken = json['user_device_token'];
    _fromGpsLat = json['from_gps_lat'];
    _fromGpsLong = json['from_gps_long'];
    _fromGpsLocation = json['from_gps_location'];
    _toGpsLat = json['to_gps_lat'];
    _toGpsLong = json['to_gps_long'];
    _toGpsLocation = json['to_gps_location'];
    _distance = json['distance'];
    _distanceDisplay = json['distance_display'];
    _orgFromLat = json['org_from_lat'];
    _orgFromLong = json['org_from_long'];
    _orgToLat = json['org_to_lat'];
    _orgToLong = json['org_to_long'];
    _orgFromGpsLocation = json['org_from_gps_location'];
    _orgToGpsLocation = json['org_to_gps_location'];
    _startKmReading = json['start_km_reading'];
    _endKmReading = json['end_km_reading'];
    _startKmPhoto = json['start_km_photo'];
    _endKmPhoto = json['end_km_photo'];
    _orgDistance = json['org_distance'];
    _pickupDate = json['pickup_date'];
    _pickupTime = json['pickup_time'];
    _pickupDateTime = json['pickup_date_time'];
    _returnDate = json['return_date'];
    _returnTime = json['return_time'];
    _returnDateTime = json['return_date_time'];
    _orgPickupDate = json['org_pickup_date'];
    _orgPickupTime = json['org_pickup_time'];
    _orgPickupDateTime = json['org_pickup_date_time'];
    _orgReturnDate = json['org_return_date'];
    _orgReturnTime = json['org_return_time'];
    _orgReturnDateTime = json['org_return_date_time'];
    _bookingType = json['booking_type'];
    _tripType = json['trip_type'];
    _vehicleTypeId = json['vehicle_type_id'];
    _vehicleTypeName = json['vehicle_type_name'];
    _icon = json['icon'];
    _fareId = json['fare_id'];
    _rideDurationInMinute = json['ride_duration_in_minute'];
    _rideDurationInMinuteOrg = json['ride_duration_in_minute_org'];
    _baseFare = json['base_fare'];
    _baseFareHour = json['base_fare_hour'];
    _baseFareKm = json['base_fare_km'];
    _extraPerKmCharge = json['extra_per_km_charge'];
    _extraPerHourMinCharge = json['extra_per_hour_min_charge'];
    _fixDriverAllowance = json['fix_driver_allowance'];
    _perNightCharge = json['per_night_charge'];
    _isTollChargeExcluded = json['is_toll_charge_excluded'];
    _gstApplicable = json['gst_applicable'];
    _nightStartTime = json['night_start_time'];
    _nightEndTime = json['night_end_time'];
    _roundTripDiscountPercent = json['round_trip_discount_percent'];
    _isPartkingExtra = json['is_partking_extra'];
    _planName = json['plan_name'];
    _actualNightCharges = json['actual_night_charges'];
    _actualNights = json['actual_nights'];
    _actualExtraKm = json['actual_extra_km'];
    _actualExtraDurationInMinHour = json['actual_extra_duration_in_min_hour'];
    _actualExtraKmCharges = json['actual_extra_km_charges'];
    _actualDurationCharge = json['actual_duration_charge'];
    _discountAmt = json['discount_amt'];
    _gstAmt = json['gst_amt'];
    _parkingAmount = json['parking_amount'];
    _tollTaxAmt = json['toll_tax_amt'];
    _netPayment = json['net_payment'];
    _payByWallet = json['pay_by_wallet'];
    _payByOnline = json['pay_by_online'];
    _payByCash = json['pay_by_cash'];
    _skipForPay = json['skip_for_pay'];
    _acceptTime = json['accept_time'];
    _goToPickupTime = json['go_to_pickup_time'];
    _startOtp = json['start_otp'];
    _placedTime = json['placed_time'];
    _bookingStatus = json['booking_status'];
    _bookingLevel = json['booking_level'];
    _timeDisplayLevel = json['time_display_level'];
    _rideDurationDisplay = json['ride_duration_display'];
    _cancelBy = json['cancel_by'];
    _cancelReason = json['cancel_reason'];
    _driverId = json['driver_id'];
    _driverName = json['driver_name'];
    _driverPhoto = json['driver_photo'];
    _driverMobileNumber = json['driver_mobile_number'];
    _driverGender = json['driver_gender'];
    _vehiclePhoto = json['vehicle_photo'];
    _vehicleName = json['vehicle_name'];
    _vehicleNumber = json['vehicle_number'];
    _vehicleModel = json['vehicle_model'];
    _vehicleTypeIdDriver = json['vehicle_type_id_driver'];
    _driverIsAppOpen = json['driver_is_app_open'];
    _driverAllotTime = json['driver_allot_time'];
  }
  String? _bookingId;
  String? _userId;
  String? _userName;
  String? _userMobileNumber;
  String? _userPhoto;
  String? _userWalletAmt;
  String? _userDeviceToken;
  String? _fromGpsLat;
  String? _fromGpsLong;
  String? _fromGpsLocation;
  String? _toGpsLat;
  String? _toGpsLong;
  String? _toGpsLocation;
  String? _distance;
  String? _distanceDisplay;
  String? _orgFromLat;
  String? _orgFromLong;
  String? _orgToLat;
  String? _orgToLong;
  String? _orgFromGpsLocation;
  String? _orgToGpsLocation;
  String? _startKmReading;
  String? _endKmReading;
  String? _startKmPhoto;
  String? _endKmPhoto;
  String? _orgDistance;
  String? _pickupDate;
  String? _pickupTime;
  String? _pickupDateTime;
  String? _returnDate;
  String? _returnTime;
  String? _returnDateTime;
  String? _orgPickupDate;
  String? _orgPickupTime;
  String? _orgPickupDateTime;
  String? _orgReturnDate;
  String? _orgReturnTime;
  String? _orgReturnDateTime;
  String? _bookingType;
  String? _tripType;
  String? _vehicleTypeId;
  String? _vehicleTypeName;
  String? _icon;
  String? _fareId;
  String? _rideDurationInMinute;
  String? _rideDurationInMinuteOrg;
  String? _baseFare;
  String? _baseFareHour;
  String? _baseFareKm;
  String? _extraPerKmCharge;
  String? _extraPerHourMinCharge;
  String? _fixDriverAllowance;
  String? _perNightCharge;
  String? _isTollChargeExcluded;
  String? _gstApplicable;
  String? _nightStartTime;
  String? _nightEndTime;
  String? _roundTripDiscountPercent;
  String? _isPartkingExtra;
  String? _planName;
  String? _actualNightCharges;
  String? _actualNights;
  String? _actualExtraKm;
  String? _actualExtraDurationInMinHour;
  String? _actualExtraKmCharges;
  String? _actualDurationCharge;
  String? _discountAmt;
  String? _gstAmt;
  String? _parkingAmount;
  String? _tollTaxAmt;
  String? _netPayment;
  String? _payByWallet;
  String? _payByOnline;
  String? _payByCash;
  String? _skipForPay;
  String? _acceptTime;
  String? _goToPickupTime;
  String? _startOtp;
  String? _placedTime;
  String? _bookingStatus;
  String? _bookingLevel;
  String? _timeDisplayLevel;
  String? _rideDurationDisplay;
  String? _cancelBy;
  String? _cancelReason;
  String? _driverId;
  String? _driverName;
  String? _driverPhoto;
  String? _driverMobileNumber;
  String? _driverGender;
  String? _vehiclePhoto;
  String? _vehicleName;
  String? _vehicleNumber;
  String? _vehicleModel;
  String? _vehicleTypeIdDriver;
  String? _driverIsAppOpen;
  String? _driverAllotTime;
HistoryList copyWith({  String? bookingId,
  String? userId,
  String? userName,
  String? userMobileNumber,
  String? userPhoto,
  String? userWalletAmt,
  String? userDeviceToken,
  String? fromGpsLat,
  String? fromGpsLong,
  String? fromGpsLocation,
  String? toGpsLat,
  String? toGpsLong,
  String? toGpsLocation,
  String? distance,
  String? distanceDisplay,
  String? orgFromLat,
  String? orgFromLong,
  String? orgToLat,
  String? orgToLong,
  String? orgFromGpsLocation,
  String? orgToGpsLocation,
  String? startKmReading,
  String? endKmReading,
  String? startKmPhoto,
  String? endKmPhoto,
  String? orgDistance,
  String? pickupDate,
  String? pickupTime,
  String? pickupDateTime,
  String? returnDate,
  String? returnTime,
  String? returnDateTime,
  String? orgPickupDate,
  String? orgPickupTime,
  String? orgPickupDateTime,
  String? orgReturnDate,
  String? orgReturnTime,
  String? orgReturnDateTime,
  String? bookingType,
  String? tripType,
  String? vehicleTypeId,
  String? vehicleTypeName,
  String? icon,
  String? fareId,
  String? rideDurationInMinute,
  String? rideDurationInMinuteOrg,
  String? baseFare,
  String? baseFareHour,
  String? baseFareKm,
  String? extraPerKmCharge,
  String? extraPerHourMinCharge,
  String? fixDriverAllowance,
  String? perNightCharge,
  String? isTollChargeExcluded,
  String? gstApplicable,
  String? nightStartTime,
  String? nightEndTime,
  String? roundTripDiscountPercent,
  String? isPartkingExtra,
  String? planName,
  String? actualNightCharges,
  String? actualNights,
  String? actualExtraKm,
  String? actualExtraDurationInMinHour,
  String? actualExtraKmCharges,
  String? actualDurationCharge,
  String? discountAmt,
  String? gstAmt,
  String? parkingAmount,
  String? tollTaxAmt,
  String? netPayment,
  String? payByWallet,
  String? payByOnline,
  String? payByCash,
  String? skipForPay,
  String? acceptTime,
  String? goToPickupTime,
  String? startOtp,
  String? placedTime,
  String? bookingStatus,
  String? bookingLevel,
  String? timeDisplayLevel,
  String? rideDurationDisplay,
  String? cancelBy,
  String? cancelReason,
  String? driverId,
  String? driverName,
  String? driverPhoto,
  String? driverMobileNumber,
  String? driverGender,
  String? vehiclePhoto,
  String? vehicleName,
  String? vehicleNumber,
  String? vehicleModel,
  String? vehicleTypeIdDriver,
  String? driverIsAppOpen,
  String? driverAllotTime,
}) => HistoryList(  bookingId: bookingId ?? _bookingId,
  userId: userId ?? _userId,
  userName: userName ?? _userName,
  userMobileNumber: userMobileNumber ?? _userMobileNumber,
  userPhoto: userPhoto ?? _userPhoto,
  userWalletAmt: userWalletAmt ?? _userWalletAmt,
  userDeviceToken: userDeviceToken ?? _userDeviceToken,
  fromGpsLat: fromGpsLat ?? _fromGpsLat,
  fromGpsLong: fromGpsLong ?? _fromGpsLong,
  fromGpsLocation: fromGpsLocation ?? _fromGpsLocation,
  toGpsLat: toGpsLat ?? _toGpsLat,
  toGpsLong: toGpsLong ?? _toGpsLong,
  toGpsLocation: toGpsLocation ?? _toGpsLocation,
  distance: distance ?? _distance,
  distanceDisplay: distanceDisplay ?? _distanceDisplay,
  orgFromLat: orgFromLat ?? _orgFromLat,
  orgFromLong: orgFromLong ?? _orgFromLong,
  orgToLat: orgToLat ?? _orgToLat,
  orgToLong: orgToLong ?? _orgToLong,
  orgFromGpsLocation: orgFromGpsLocation ?? _orgFromGpsLocation,
  orgToGpsLocation: orgToGpsLocation ?? _orgToGpsLocation,
  startKmReading: startKmReading ?? _startKmReading,
  endKmReading: endKmReading ?? _endKmReading,
  startKmPhoto: startKmPhoto ?? _startKmPhoto,
  endKmPhoto: endKmPhoto ?? _endKmPhoto,
  orgDistance: orgDistance ?? _orgDistance,
  pickupDate: pickupDate ?? _pickupDate,
  pickupTime: pickupTime ?? _pickupTime,
  pickupDateTime: pickupDateTime ?? _pickupDateTime,
  returnDate: returnDate ?? _returnDate,
  returnTime: returnTime ?? _returnTime,
  returnDateTime: returnDateTime ?? _returnDateTime,
  orgPickupDate: orgPickupDate ?? _orgPickupDate,
  orgPickupTime: orgPickupTime ?? _orgPickupTime,
  orgPickupDateTime: orgPickupDateTime ?? _orgPickupDateTime,
  orgReturnDate: orgReturnDate ?? _orgReturnDate,
  orgReturnTime: orgReturnTime ?? _orgReturnTime,
  orgReturnDateTime: orgReturnDateTime ?? _orgReturnDateTime,
  bookingType: bookingType ?? _bookingType,
  tripType: tripType ?? _tripType,
  vehicleTypeId: vehicleTypeId ?? _vehicleTypeId,
  vehicleTypeName: vehicleTypeName ?? _vehicleTypeName,
  icon: icon ?? _icon,
  fareId: fareId ?? _fareId,
  rideDurationInMinute: rideDurationInMinute ?? _rideDurationInMinute,
  rideDurationInMinuteOrg: rideDurationInMinuteOrg ?? _rideDurationInMinuteOrg,
  baseFare: baseFare ?? _baseFare,
  baseFareHour: baseFareHour ?? _baseFareHour,
  baseFareKm: baseFareKm ?? _baseFareKm,
  extraPerKmCharge: extraPerKmCharge ?? _extraPerKmCharge,
  extraPerHourMinCharge: extraPerHourMinCharge ?? _extraPerHourMinCharge,
  fixDriverAllowance: fixDriverAllowance ?? _fixDriverAllowance,
  perNightCharge: perNightCharge ?? _perNightCharge,
  isTollChargeExcluded: isTollChargeExcluded ?? _isTollChargeExcluded,
  gstApplicable: gstApplicable ?? _gstApplicable,
  nightStartTime: nightStartTime ?? _nightStartTime,
  nightEndTime: nightEndTime ?? _nightEndTime,
  roundTripDiscountPercent: roundTripDiscountPercent ?? _roundTripDiscountPercent,
  isPartkingExtra: isPartkingExtra ?? _isPartkingExtra,
  planName: planName ?? _planName,
  actualNightCharges: actualNightCharges ?? _actualNightCharges,
  actualNights: actualNights ?? _actualNights,
  actualExtraKm: actualExtraKm ?? _actualExtraKm,
  actualExtraDurationInMinHour: actualExtraDurationInMinHour ?? _actualExtraDurationInMinHour,
  actualExtraKmCharges: actualExtraKmCharges ?? _actualExtraKmCharges,
  actualDurationCharge: actualDurationCharge ?? _actualDurationCharge,
  discountAmt: discountAmt ?? _discountAmt,
  gstAmt: gstAmt ?? _gstAmt,
  parkingAmount: parkingAmount ?? _parkingAmount,
  tollTaxAmt: tollTaxAmt ?? _tollTaxAmt,
  netPayment: netPayment ?? _netPayment,
  payByWallet: payByWallet ?? _payByWallet,
  payByOnline: payByOnline ?? _payByOnline,
  payByCash: payByCash ?? _payByCash,
  skipForPay: skipForPay ?? _skipForPay,
  acceptTime: acceptTime ?? _acceptTime,
  goToPickupTime: goToPickupTime ?? _goToPickupTime,
  startOtp: startOtp ?? _startOtp,
  placedTime: placedTime ?? _placedTime,
  bookingStatus: bookingStatus ?? _bookingStatus,
  bookingLevel: bookingLevel ?? _bookingLevel,
  timeDisplayLevel: timeDisplayLevel ?? _timeDisplayLevel,
  rideDurationDisplay: rideDurationDisplay ?? _rideDurationDisplay,
  cancelBy: cancelBy ?? _cancelBy,
  cancelReason: cancelReason ?? _cancelReason,
  driverId: driverId ?? _driverId,
  driverName: driverName ?? _driverName,
  driverPhoto: driverPhoto ?? _driverPhoto,
  driverMobileNumber: driverMobileNumber ?? _driverMobileNumber,
  driverGender: driverGender ?? _driverGender,
  vehiclePhoto: vehiclePhoto ?? _vehiclePhoto,
  vehicleName: vehicleName ?? _vehicleName,
  vehicleNumber: vehicleNumber ?? _vehicleNumber,
  vehicleModel: vehicleModel ?? _vehicleModel,
  vehicleTypeIdDriver: vehicleTypeIdDriver ?? _vehicleTypeIdDriver,
  driverIsAppOpen: driverIsAppOpen ?? _driverIsAppOpen,
  driverAllotTime: driverAllotTime ?? _driverAllotTime,
);
  String? get bookingId => _bookingId;
  String? get userId => _userId;
  String? get userName => _userName;
  String? get userMobileNumber => _userMobileNumber;
  String? get userPhoto => _userPhoto;
  String? get userWalletAmt => _userWalletAmt;
  String? get userDeviceToken => _userDeviceToken;
  String? get fromGpsLat => _fromGpsLat;
  String? get fromGpsLong => _fromGpsLong;
  String? get fromGpsLocation => _fromGpsLocation;
  String? get toGpsLat => _toGpsLat;
  String? get toGpsLong => _toGpsLong;
  String? get toGpsLocation => _toGpsLocation;
  String? get distance => _distance;
  String? get distanceDisplay => _distanceDisplay;
  String? get orgFromLat => _orgFromLat;
  String? get orgFromLong => _orgFromLong;
  String? get orgToLat => _orgToLat;
  String? get orgToLong => _orgToLong;
  String? get orgFromGpsLocation => _orgFromGpsLocation;
  String? get orgToGpsLocation => _orgToGpsLocation;
  String? get startKmReading => _startKmReading;
  String? get endKmReading => _endKmReading;
  String? get startKmPhoto => _startKmPhoto;
  String? get endKmPhoto => _endKmPhoto;
  String? get orgDistance => _orgDistance;
  String? get pickupDate => _pickupDate;
  String? get pickupTime => _pickupTime;
  String? get pickupDateTime => _pickupDateTime;
  String? get returnDate => _returnDate;
  String? get returnTime => _returnTime;
  String? get returnDateTime => _returnDateTime;
  String? get orgPickupDate => _orgPickupDate;
  String? get orgPickupTime => _orgPickupTime;
  String? get orgPickupDateTime => _orgPickupDateTime;
  String? get orgReturnDate => _orgReturnDate;
  String? get orgReturnTime => _orgReturnTime;
  String? get orgReturnDateTime => _orgReturnDateTime;
  String? get bookingType => _bookingType;
  String? get tripType => _tripType;
  String? get vehicleTypeId => _vehicleTypeId;
  String? get vehicleTypeName => _vehicleTypeName;
  String? get icon => _icon;
  String? get fareId => _fareId;
  String? get rideDurationInMinute => _rideDurationInMinute;
  String? get rideDurationInMinuteOrg => _rideDurationInMinuteOrg;
  String? get baseFare => _baseFare;
  String? get baseFareHour => _baseFareHour;
  String? get baseFareKm => _baseFareKm;
  String? get extraPerKmCharge => _extraPerKmCharge;
  String? get extraPerHourMinCharge => _extraPerHourMinCharge;
  String? get fixDriverAllowance => _fixDriverAllowance;
  String? get perNightCharge => _perNightCharge;
  String? get isTollChargeExcluded => _isTollChargeExcluded;
  String? get gstApplicable => _gstApplicable;
  String? get nightStartTime => _nightStartTime;
  String? get nightEndTime => _nightEndTime;
  String? get roundTripDiscountPercent => _roundTripDiscountPercent;
  String? get isPartkingExtra => _isPartkingExtra;
  String? get planName => _planName;
  String? get actualNightCharges => _actualNightCharges;
  String? get actualNights => _actualNights;
  String? get actualExtraKm => _actualExtraKm;
  String? get actualExtraDurationInMinHour => _actualExtraDurationInMinHour;
  String? get actualExtraKmCharges => _actualExtraKmCharges;
  String? get actualDurationCharge => _actualDurationCharge;
  String? get discountAmt => _discountAmt;
  String? get gstAmt => _gstAmt;
  String? get parkingAmount => _parkingAmount;
  String? get tollTaxAmt => _tollTaxAmt;
  String? get netPayment => _netPayment;
  String? get payByWallet => _payByWallet;
  String? get payByOnline => _payByOnline;
  String? get payByCash => _payByCash;
  String? get skipForPay => _skipForPay;
  String? get acceptTime => _acceptTime;
  String? get goToPickupTime => _goToPickupTime;
  String? get startOtp => _startOtp;
  String? get placedTime => _placedTime;
  String? get bookingStatus => _bookingStatus;
  String? get bookingLevel => _bookingLevel;
  String? get timeDisplayLevel => _timeDisplayLevel;
  String? get rideDurationDisplay => _rideDurationDisplay;
  String? get cancelBy => _cancelBy;
  String? get cancelReason => _cancelReason;
  String? get driverId => _driverId;
  String? get driverName => _driverName;
  String? get driverPhoto => _driverPhoto;
  String? get driverMobileNumber => _driverMobileNumber;
  String? get driverGender => _driverGender;
  String? get vehiclePhoto => _vehiclePhoto;
  String? get vehicleName => _vehicleName;
  String? get vehicleNumber => _vehicleNumber;
  String? get vehicleModel => _vehicleModel;
  String? get vehicleTypeIdDriver => _vehicleTypeIdDriver;
  String? get driverIsAppOpen => _driverIsAppOpen;
  String? get driverAllotTime => _driverAllotTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['booking_id'] = _bookingId;
    map['user_id'] = _userId;
    map['user_name'] = _userName;
    map['user_mobile_number'] = _userMobileNumber;
    map['user_photo'] = _userPhoto;
    map['user_wallet_amt'] = _userWalletAmt;
    map['user_device_token'] = _userDeviceToken;
    map['from_gps_lat'] = _fromGpsLat;
    map['from_gps_long'] = _fromGpsLong;
    map['from_gps_location'] = _fromGpsLocation;
    map['to_gps_lat'] = _toGpsLat;
    map['to_gps_long'] = _toGpsLong;
    map['to_gps_location'] = _toGpsLocation;
    map['distance'] = _distance;
    map['distance_display'] = _distanceDisplay;
    map['org_from_lat'] = _orgFromLat;
    map['org_from_long'] = _orgFromLong;
    map['org_to_lat'] = _orgToLat;
    map['org_to_long'] = _orgToLong;
    map['org_from_gps_location'] = _orgFromGpsLocation;
    map['org_to_gps_location'] = _orgToGpsLocation;
    map['start_km_reading'] = _startKmReading;
    map['end_km_reading'] = _endKmReading;
    map['start_km_photo'] = _startKmPhoto;
    map['end_km_photo'] = _endKmPhoto;
    map['org_distance'] = _orgDistance;
    map['pickup_date'] = _pickupDate;
    map['pickup_time'] = _pickupTime;
    map['pickup_date_time'] = _pickupDateTime;
    map['return_date'] = _returnDate;
    map['return_time'] = _returnTime;
    map['return_date_time'] = _returnDateTime;
    map['org_pickup_date'] = _orgPickupDate;
    map['org_pickup_time'] = _orgPickupTime;
    map['org_pickup_date_time'] = _orgPickupDateTime;
    map['org_return_date'] = _orgReturnDate;
    map['org_return_time'] = _orgReturnTime;
    map['org_return_date_time'] = _orgReturnDateTime;
    map['booking_type'] = _bookingType;
    map['trip_type'] = _tripType;
    map['vehicle_type_id'] = _vehicleTypeId;
    map['vehicle_type_name'] = _vehicleTypeName;
    map['icon'] = _icon;
    map['fare_id'] = _fareId;
    map['ride_duration_in_minute'] = _rideDurationInMinute;
    map['ride_duration_in_minute_org'] = _rideDurationInMinuteOrg;
    map['base_fare'] = _baseFare;
    map['base_fare_hour'] = _baseFareHour;
    map['base_fare_km'] = _baseFareKm;
    map['extra_per_km_charge'] = _extraPerKmCharge;
    map['extra_per_hour_min_charge'] = _extraPerHourMinCharge;
    map['fix_driver_allowance'] = _fixDriverAllowance;
    map['per_night_charge'] = _perNightCharge;
    map['is_toll_charge_excluded'] = _isTollChargeExcluded;
    map['gst_applicable'] = _gstApplicable;
    map['night_start_time'] = _nightStartTime;
    map['night_end_time'] = _nightEndTime;
    map['round_trip_discount_percent'] = _roundTripDiscountPercent;
    map['is_partking_extra'] = _isPartkingExtra;
    map['plan_name'] = _planName;
    map['actual_night_charges'] = _actualNightCharges;
    map['actual_nights'] = _actualNights;
    map['actual_extra_km'] = _actualExtraKm;
    map['actual_extra_duration_in_min_hour'] = _actualExtraDurationInMinHour;
    map['actual_extra_km_charges'] = _actualExtraKmCharges;
    map['actual_duration_charge'] = _actualDurationCharge;
    map['discount_amt'] = _discountAmt;
    map['gst_amt'] = _gstAmt;
    map['parking_amount'] = _parkingAmount;
    map['toll_tax_amt'] = _tollTaxAmt;
    map['net_payment'] = _netPayment;
    map['pay_by_wallet'] = _payByWallet;
    map['pay_by_online'] = _payByOnline;
    map['pay_by_cash'] = _payByCash;
    map['skip_for_pay'] = _skipForPay;
    map['accept_time'] = _acceptTime;
    map['go_to_pickup_time'] = _goToPickupTime;
    map['start_otp'] = _startOtp;
    map['placed_time'] = _placedTime;
    map['booking_status'] = _bookingStatus;
    map['booking_level'] = _bookingLevel;
    map['time_display_level'] = _timeDisplayLevel;
    map['ride_duration_display'] = _rideDurationDisplay;
    map['cancel_by'] = _cancelBy;
    map['cancel_reason'] = _cancelReason;
    map['driver_id'] = _driverId;
    map['driver_name'] = _driverName;
    map['driver_photo'] = _driverPhoto;
    map['driver_mobile_number'] = _driverMobileNumber;
    map['driver_gender'] = _driverGender;
    map['vehicle_photo'] = _vehiclePhoto;
    map['vehicle_name'] = _vehicleName;
    map['vehicle_number'] = _vehicleNumber;
    map['vehicle_model'] = _vehicleModel;
    map['vehicle_type_id_driver'] = _vehicleTypeIdDriver;
    map['driver_is_app_open'] = _driverIsAppOpen;
    map['driver_allot_time'] = _driverAllotTime;
    return map;
  }

}