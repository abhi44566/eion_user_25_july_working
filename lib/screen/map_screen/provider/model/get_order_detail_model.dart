
class GetOrderDetailModel {
  Response? response;

  GetOrderDetailModel({this.response});

  GetOrderDetailModel.fromJson(Map<String, dynamic> json) {
    if(json["response"] is Map) {
      response = json["response"] == null ? null : Response.fromJson(json["response"]);
    }
  }

  static List<GetOrderDetailModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(GetOrderDetailModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(response != null) {
      _data["response"] = response?.toJson();
    }
    return _data;
  }
}

class Response {
  List<HistoryList>? historyList;
  String? msg;
  bool? status;

  Response({this.historyList, this.msg, this.status});

  Response.fromJson(Map<String, dynamic> json) {
    if(json["history_list"] is List) {
      historyList = json["history_list"] == null ? null : (json["history_list"] as List).map((e) => HistoryList.fromJson(e)).toList();
    }
    if(json["msg"] is String) {
      msg = json["msg"];
    }
    if(json["status"] is bool) {
      status = json["status"];
    }
  }

  static List<Response> fromList(List<Map<String, dynamic>> list) {
    return list.map(Response.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(historyList != null) {
      _data["history_list"] = historyList?.map((e) => e.toJson()).toList();
    }
    _data["msg"] = msg;
    _data["status"] = status;
    return _data;
  }
}

class HistoryList {
  String? bookingId;
  String? userId;
  String? userName;
  String? userMobileNumber;
  String? userPhoto;
  String? userWalletAmt;
  String? userDeviceToken;
  String? fromGpsLat;
  String? fromGpsLong;
  String? surgeCharge;
  String? pickupTrackLink;
  String? fromGpsLocation;
  String? toGpsLat;
  String? toGpsLong;
  String? dropTrackLink;
  String? toGpsLocation;
  String? distance;
  String? distanceDisplay;
  String? companyAmt;
  String? driverAmt;
  String? orgFromLong;
  String? orgToLat;
  String? orgToLong;
  String? orgFromGpsLocation;
  String? orgToGpsLocation;
  String? startKmReading;
  String? endKmReading;
  String? startKmPhoto;
  String? endKmPhoto;
  String? orgDistance;
  String? pickupDate;
  String? pickupTime;
  String? pickupDateTime;
  String? returnDate;
  String? returnTime;
  String? returnDateTime;
  String? orgPickupDate;
  String? orgPickupTime;
  String? orgPickupDateTime;
  String? orgReturnDate;
  String? orgReturnTime;
  String? orgReturnDateTime;
  String? bookingType;
  String? tripType;
  String? vehicleTypeId;
  String? vehicleTypeName;
  String? icon;
  String? fareId;
  String? rideDurationInMinute;
  String? rideDurationInMinuteOrg;
  String? baseFare;
  String? bookedForName;
  String? bookedForMobileNumber;
  String? bookedFor;
  String? paymentMode;
  String? baseFareHour;
  String? baseFareKm;
  String? extraPerKmCharge;
  String? extraPerHourMinCharge;
  String? fixDriverAllowance;
  String? perNightCharge;
  String? isTollChargeExcluded;
  String? gstApplicable;
  String? nightStartTime;
  String? nightEndTime;
  String? roundTripDiscountPercent;
  String? isPartkingExtra;
  String? planName;
  String? actualNightCharges;
  String? actualNights;
  String? actualExtraKm;
  String? actualExtraDurationInMinHour;
  String? actualExtraKmCharges;
  String? actualDurationCharge;
  String? discountAmt;
  String? gstAmt;
  String? parkingAmount;
  String? tollTaxAmt;
  String? netPayment;
  String? payByWallet;
  String? payByOnline;
  String? payByCash;
  String? skipForPay;
  String? paymentStatus;
  String? bookingAmt;
  String? acceptTime;
  String? goToPickupTime;
  String? startOtp;
  String? placedTime;
  String? bookingStatus;
  String? bookingLevel;
  String? timeDisplayLevel;
  String? rideDurationDisplay;
  String? cancelBy;
  String? cancelReason;
  String? driverId;
  String? driverLat;
  String? driverLong;
  String? driverGpsUpdateTime;
  String? driverGpsLocation;
  String? driverName;
  String? driverPhoto;
  String? driverMobileNumber;
  String? driverGender;
  String? vehiclePhoto;
  String? vehicleName;
  String? vehicleNumber;
  String? vehicleModel;
  String? vehicleTypeIdDriver;
  String? driverIsAppOpen;
  String? driverAllotTime;
  String? ratingStatus;
  String? ratingId;
  String? starRating;
  String? ratingRemark;
  String? ratingDateTime;

  HistoryList({this.bookingId, this.userId, this.userName, this.userMobileNumber, this.userPhoto, this.userWalletAmt, this.userDeviceToken, this.fromGpsLat, this.fromGpsLong, this.surgeCharge, this.pickupTrackLink, this.fromGpsLocation, this.toGpsLat, this.toGpsLong, this.dropTrackLink, this.toGpsLocation, this.distance, this.distanceDisplay, this.companyAmt, this.driverAmt, this.orgFromLong, this.orgToLat, this.orgToLong, this.orgFromGpsLocation, this.orgToGpsLocation, this.startKmReading, this.endKmReading, this.startKmPhoto, this.endKmPhoto, this.orgDistance, this.pickupDate, this.pickupTime, this.pickupDateTime, this.returnDate, this.returnTime, this.returnDateTime, this.orgPickupDate, this.orgPickupTime, this.orgPickupDateTime, this.orgReturnDate, this.orgReturnTime, this.orgReturnDateTime, this.bookingType, this.tripType, this.vehicleTypeId, this.vehicleTypeName, this.icon, this.fareId, this.rideDurationInMinute, this.rideDurationInMinuteOrg, this.baseFare, this.bookedForName, this.bookedForMobileNumber, this.bookedFor, this.paymentMode, this.baseFareHour, this.baseFareKm, this.extraPerKmCharge, this.extraPerHourMinCharge, this.fixDriverAllowance, this.perNightCharge, this.isTollChargeExcluded, this.gstApplicable, this.nightStartTime, this.nightEndTime, this.roundTripDiscountPercent, this.isPartkingExtra, this.planName, this.actualNightCharges, this.actualNights, this.actualExtraKm, this.actualExtraDurationInMinHour, this.actualExtraKmCharges, this.actualDurationCharge, this.discountAmt, this.gstAmt, this.parkingAmount, this.tollTaxAmt, this.netPayment, this.payByWallet, this.payByOnline, this.payByCash, this.skipForPay, this.paymentStatus, this.bookingAmt, this.acceptTime, this.goToPickupTime, this.startOtp, this.placedTime, this.bookingStatus, this.bookingLevel, this.timeDisplayLevel, this.rideDurationDisplay, this.cancelBy, this.cancelReason, this.driverId, this.driverLat, this.driverLong, this.driverGpsUpdateTime, this.driverGpsLocation, this.driverName, this.driverPhoto, this.driverMobileNumber, this.driverGender, this.vehiclePhoto, this.vehicleName, this.vehicleNumber, this.vehicleModel, this.vehicleTypeIdDriver, this.driverIsAppOpen, this.driverAllotTime, this.ratingStatus, this.ratingId, this.starRating, this.ratingRemark, this.ratingDateTime});

  HistoryList.fromJson(Map<String, dynamic> json) {
    if(json["booking_id"] is String) {
      bookingId = json["booking_id"];
    }
    if(json["user_id"] is String) {
      userId = json["user_id"];
    }
    if(json["user_name"] is String) {
      userName = json["user_name"];
    }
    if(json["user_mobile_number"] is String) {
      userMobileNumber = json["user_mobile_number"];
    }
    if(json["user_photo"] is String) {
      userPhoto = json["user_photo"];
    }
    if(json["user_wallet_amt"] is String) {
      userWalletAmt = json["user_wallet_amt"];
    }
    if(json["user_device_token"] is String) {
      userDeviceToken = json["user_device_token"];
    }
    if(json["from_gps_lat"] is String) {
      fromGpsLat = json["from_gps_lat"];
    }
    if(json["from_gps_long"] is String) {
      fromGpsLong = json["from_gps_long"];
    }
    if(json["surge_charge"] is String) {
      surgeCharge = json["surge_charge"];
    }
    if(json["pickup_track_link"] is String) {
      pickupTrackLink = json["pickup_track_link"];
    }
    if(json["from_gps_location"] is String) {
      fromGpsLocation = json["from_gps_location"];
    }
    if(json["to_gps_lat"] is String) {
      toGpsLat = json["to_gps_lat"];
    }
    if(json["to_gps_long"] is String) {
      toGpsLong = json["to_gps_long"];
    }
    if(json["drop_track_link"] is String) {
      dropTrackLink = json["drop_track_link"];
    }
    if(json["to_gps_location"] is String) {
      toGpsLocation = json["to_gps_location"];
    }
    if(json["distance"] is String) {
      distance = json["distance"];
    }
    if(json["distance_display"] is String) {
      distanceDisplay = json["distance_display"];
    }
    if(json["company_amt"] is String) {
      companyAmt = json["company_amt"];
    }
    if(json["driver_amt"] is String) {
      driverAmt = json["driver_amt"];
    }
    if(json["org_from_long"] is String) {
      orgFromLong = json["org_from_long"];
    }
    if(json["org_to_lat"] is String) {
      orgToLat = json["org_to_lat"];
    }
    if(json["org_to_long"] is String) {
      orgToLong = json["org_to_long"];
    }
    if(json["org_from_gps_location"] is String) {
      orgFromGpsLocation = json["org_from_gps_location"];
    }
    if(json["org_to_gps_location"] is String) {
      orgToGpsLocation = json["org_to_gps_location"];
    }
    if(json["start_km_reading"] is String) {
      startKmReading = json["start_km_reading"];
    }
    if(json["end_km_reading"] is String) {
      endKmReading = json["end_km_reading"];
    }
    if(json["start_km_photo"] is String) {
      startKmPhoto = json["start_km_photo"];
    }
    if(json["end_km_photo"] is String) {
      endKmPhoto = json["end_km_photo"];
    }
    if(json["org_distance"] is String) {
      orgDistance = json["org_distance"];
    }
    if(json["pickup_date"] is String) {
      pickupDate = json["pickup_date"];
    }
    if(json["pickup_time"] is String) {
      pickupTime = json["pickup_time"];
    }
    if(json["pickup_date_time"] is String) {
      pickupDateTime = json["pickup_date_time"];
    }
    if(json["return_date"] is String) {
      returnDate = json["return_date"];
    }
    if(json["return_time"] is String) {
      returnTime = json["return_time"];
    }
    if(json["return_date_time"] is String) {
      returnDateTime = json["return_date_time"];
    }
    if(json["org_pickup_date"] is String) {
      orgPickupDate = json["org_pickup_date"];
    }
    if(json["org_pickup_time"] is String) {
      orgPickupTime = json["org_pickup_time"];
    }
    if(json["org_pickup_date_time"] is String) {
      orgPickupDateTime = json["org_pickup_date_time"];
    }
    if(json["org_return_date"] is String) {
      orgReturnDate = json["org_return_date"];
    }
    if(json["org_return_time"] is String) {
      orgReturnTime = json["org_return_time"];
    }
    if(json["org_return_date_time"] is String) {
      orgReturnDateTime = json["org_return_date_time"];
    }
    if(json["booking_type"] is String) {
      bookingType = json["booking_type"];
    }
    if(json["trip_type"] is String) {
      tripType = json["trip_type"];
    }
    if(json["vehicle_type_id"] is String) {
      vehicleTypeId = json["vehicle_type_id"];
    }
    if(json["vehicle_type_name"] is String) {
      vehicleTypeName = json["vehicle_type_name"];
    }
    if(json["icon"] is String) {
      icon = json["icon"];
    }
    if(json["fare_id"] is String) {
      fareId = json["fare_id"];
    }
    if(json["ride_duration_in_minute"] is String) {
      rideDurationInMinute = json["ride_duration_in_minute"];
    }
    if(json["ride_duration_in_minute_org"] is String) {
      rideDurationInMinuteOrg = json["ride_duration_in_minute_org"];
    }
    if(json["base_fare"] is String) {
      baseFare = json["base_fare"];
    }
    if(json["booked_for_name"] is String) {
      bookedForName = json["booked_for_name"];
    }
    if(json["booked_for_mobile_number"] is String) {
      bookedForMobileNumber = json["booked_for_mobile_number"];
    }
    if(json["booked_for"] is String) {
      bookedFor = json["booked_for"];
    }
    if(json["payment_mode"] is String) {
      paymentMode = json["payment_mode"];
    }
    if(json["base_fare_hour"] is String) {
      baseFareHour = json["base_fare_hour"];
    }
    if(json["base_fare_km"] is String) {
      baseFareKm = json["base_fare_km"];
    }
    if(json["extra_per_km_charge"] is String) {
      extraPerKmCharge = json["extra_per_km_charge"];
    }
    if(json["extra_per_hour_min_charge"] is String) {
      extraPerHourMinCharge = json["extra_per_hour_min_charge"];
    }
    if(json["fix_driver_allowance"] is String) {
      fixDriverAllowance = json["fix_driver_allowance"];
    }
    if(json["per_night_charge"] is String) {
      perNightCharge = json["per_night_charge"];
    }
    if(json["is_toll_charge_excluded"] is String) {
      isTollChargeExcluded = json["is_toll_charge_excluded"];
    }
    if(json["gst_applicable"] is String) {
      gstApplicable = json["gst_applicable"];
    }
    if(json["night_start_time"] is String) {
      nightStartTime = json["night_start_time"];
    }
    if(json["night_end_time"] is String) {
      nightEndTime = json["night_end_time"];
    }
    if(json["round_trip_discount_percent"] is String) {
      roundTripDiscountPercent = json["round_trip_discount_percent"];
    }
    if(json["is_partking_extra"] is String) {
      isPartkingExtra = json["is_partking_extra"];
    }
    if(json["plan_name"] is String) {
      planName = json["plan_name"];
    }
    if(json["actual_night_charges"] is String) {
      actualNightCharges = json["actual_night_charges"];
    }
    if(json["actual_nights"] is String) {
      actualNights = json["actual_nights"];
    }
    if(json["actual_extra_km"] is String) {
      actualExtraKm = json["actual_extra_km"];
    }
    if(json["actual_extra_duration_in_min_hour"] is String) {
      actualExtraDurationInMinHour = json["actual_extra_duration_in_min_hour"];
    }
    if(json["actual_extra_km_charges"] is String) {
      actualExtraKmCharges = json["actual_extra_km_charges"];
    }
    if(json["actual_duration_charge"] is String) {
      actualDurationCharge = json["actual_duration_charge"];
    }
    if(json["discount_amt"] is String) {
      discountAmt = json["discount_amt"];
    }
    if(json["gst_amt"] is String) {
      gstAmt = json["gst_amt"];
    }
    if(json["parking_amount"] is String) {
      parkingAmount = json["parking_amount"];
    }
    if(json["toll_tax_amt"] is String) {
      tollTaxAmt = json["toll_tax_amt"];
    }
    if(json["net_payment"] is String) {
      netPayment = json["net_payment"];
    }
    if(json["pay_by_wallet"] is String) {
      payByWallet = json["pay_by_wallet"];
    }
    if(json["pay_by_online"] is String) {
      payByOnline = json["pay_by_online"];
    }
    if(json["pay_by_cash"] is String) {
      payByCash = json["pay_by_cash"];
    }
    if(json["skip_for_pay"] is String) {
      skipForPay = json["skip_for_pay"];
    }
    if(json["payment_status"] is String) {
      paymentStatus = json["payment_status"];
    }
    if(json["booking_amt"] is String) {
      bookingAmt = json["booking_amt"];
    }
    if(json["accept_time"] is String) {
      acceptTime = json["accept_time"];
    }
    if(json["go_to_pickup_time"] is String) {
      goToPickupTime = json["go_to_pickup_time"];
    }
    if(json["start_otp"] is String) {
      startOtp = json["start_otp"];
    }
    if(json["placed_time"] is String) {
      placedTime = json["placed_time"];
    }
    if(json["booking_status"] is String) {
      bookingStatus = json["booking_status"];
    }
    if(json["booking_level"] is String) {
      bookingLevel = json["booking_level"];
    }
    if(json["time_display_level"] is String) {
      timeDisplayLevel = json["time_display_level"];
    }
    if(json["ride_duration_display"] is String) {
      rideDurationDisplay = json["ride_duration_display"];
    }
    if(json["cancel_by"] is String) {
      cancelBy = json["cancel_by"];
    }
    if(json["cancel_reason"] is String) {
      cancelReason = json["cancel_reason"];
    }
    if(json["driver_id"] is String) {
      driverId = json["driver_id"];
    }
    if(json["driver_lat"] is String) {
      driverLat = json["driver_lat"];
    }
    if(json["driver_long"] is String) {
      driverLong = json["driver_long"];
    }
    if(json["driver_gps_update_time"] is String) {
      driverGpsUpdateTime = json["driver_gps_update_time"];
    }
    if(json["driver_gps_location"] is String) {
      driverGpsLocation = json["driver_gps_location"];
    }
    if(json["driver_name"] is String) {
      driverName = json["driver_name"];
    }
    if(json["driver_photo"] is String) {
      driverPhoto = json["driver_photo"];
    }
    if(json["driver_mobile_number"] is String) {
      driverMobileNumber = json["driver_mobile_number"];
    }
    if(json["driver_gender"] is String) {
      driverGender = json["driver_gender"];
    }
    if(json["vehicle_photo"] is String) {
      vehiclePhoto = json["vehicle_photo"];
    }
    if(json["vehicle_name"] is String) {
      vehicleName = json["vehicle_name"];
    }
    if(json["vehicle_number"] is String) {
      vehicleNumber = json["vehicle_number"];
    }
    if(json["vehicle_model"] is String) {
      vehicleModel = json["vehicle_model"];
    }
    if(json["vehicle_type_id_driver"] is String) {
      vehicleTypeIdDriver = json["vehicle_type_id_driver"];
    }
    if(json["driver_is_app_open"] is String) {
      driverIsAppOpen = json["driver_is_app_open"];
    }
    if(json["driver_allot_time"] is String) {
      driverAllotTime = json["driver_allot_time"];
    }
    if(json["rating_status"] is String) {
      ratingStatus = json["rating_status"];
    }
    if(json["rating_id"] is String) {
      ratingId = json["rating_id"];
    }
    if(json["star_rating"] is String) {
      starRating = json["star_rating"];
    }
    if(json["rating_remark"] is String) {
      ratingRemark = json["rating_remark"];
    }
    if(json["rating_date_time"] is String) {
      ratingDateTime = json["rating_date_time"];
    }
  }

  static List<HistoryList> fromList(List<Map<String, dynamic>> list) {
    return list.map(HistoryList.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["booking_id"] = bookingId;
    _data["user_id"] = userId;
    _data["user_name"] = userName;
    _data["user_mobile_number"] = userMobileNumber;
    _data["user_photo"] = userPhoto;
    _data["user_wallet_amt"] = userWalletAmt;
    _data["user_device_token"] = userDeviceToken;
    _data["from_gps_lat"] = fromGpsLat;
    _data["from_gps_long"] = fromGpsLong;
    _data["surge_charge"] = surgeCharge;
    _data["pickup_track_link"] = pickupTrackLink;
    _data["from_gps_location"] = fromGpsLocation;
    _data["to_gps_lat"] = toGpsLat;
    _data["to_gps_long"] = toGpsLong;
    _data["drop_track_link"] = dropTrackLink;
    _data["to_gps_location"] = toGpsLocation;
    _data["distance"] = distance;
    _data["distance_display"] = distanceDisplay;
    _data["company_amt"] = companyAmt;
    _data["driver_amt"] = driverAmt;
    _data["org_from_long"] = orgFromLong;
    _data["org_to_lat"] = orgToLat;
    _data["org_to_long"] = orgToLong;
    _data["org_from_gps_location"] = orgFromGpsLocation;
    _data["org_to_gps_location"] = orgToGpsLocation;
    _data["start_km_reading"] = startKmReading;
    _data["end_km_reading"] = endKmReading;
    _data["start_km_photo"] = startKmPhoto;
    _data["end_km_photo"] = endKmPhoto;
    _data["org_distance"] = orgDistance;
    _data["pickup_date"] = pickupDate;
    _data["pickup_time"] = pickupTime;
    _data["pickup_date_time"] = pickupDateTime;
    _data["return_date"] = returnDate;
    _data["return_time"] = returnTime;
    _data["return_date_time"] = returnDateTime;
    _data["org_pickup_date"] = orgPickupDate;
    _data["org_pickup_time"] = orgPickupTime;
    _data["org_pickup_date_time"] = orgPickupDateTime;
    _data["org_return_date"] = orgReturnDate;
    _data["org_return_time"] = orgReturnTime;
    _data["org_return_date_time"] = orgReturnDateTime;
    _data["booking_type"] = bookingType;
    _data["trip_type"] = tripType;
    _data["vehicle_type_id"] = vehicleTypeId;
    _data["vehicle_type_name"] = vehicleTypeName;
    _data["icon"] = icon;
    _data["fare_id"] = fareId;
    _data["ride_duration_in_minute"] = rideDurationInMinute;
    _data["ride_duration_in_minute_org"] = rideDurationInMinuteOrg;
    _data["base_fare"] = baseFare;
    _data["booked_for_name"] = bookedForName;
    _data["booked_for_mobile_number"] = bookedForMobileNumber;
    _data["booked_for"] = bookedFor;
    _data["payment_mode"] = paymentMode;
    _data["base_fare_hour"] = baseFareHour;
    _data["base_fare_km"] = baseFareKm;
    _data["extra_per_km_charge"] = extraPerKmCharge;
    _data["extra_per_hour_min_charge"] = extraPerHourMinCharge;
    _data["fix_driver_allowance"] = fixDriverAllowance;
    _data["per_night_charge"] = perNightCharge;
    _data["is_toll_charge_excluded"] = isTollChargeExcluded;
    _data["gst_applicable"] = gstApplicable;
    _data["night_start_time"] = nightStartTime;
    _data["night_end_time"] = nightEndTime;
    _data["round_trip_discount_percent"] = roundTripDiscountPercent;
    _data["is_partking_extra"] = isPartkingExtra;
    _data["plan_name"] = planName;
    _data["actual_night_charges"] = actualNightCharges;
    _data["actual_nights"] = actualNights;
    _data["actual_extra_km"] = actualExtraKm;
    _data["actual_extra_duration_in_min_hour"] = actualExtraDurationInMinHour;
    _data["actual_extra_km_charges"] = actualExtraKmCharges;
    _data["actual_duration_charge"] = actualDurationCharge;
    _data["discount_amt"] = discountAmt;
    _data["gst_amt"] = gstAmt;
    _data["parking_amount"] = parkingAmount;
    _data["toll_tax_amt"] = tollTaxAmt;
    _data["net_payment"] = netPayment;
    _data["pay_by_wallet"] = payByWallet;
    _data["pay_by_online"] = payByOnline;
    _data["pay_by_cash"] = payByCash;
    _data["skip_for_pay"] = skipForPay;
    _data["payment_status"] = paymentStatus;
    _data["booking_amt"] = bookingAmt;
    _data["accept_time"] = acceptTime;
    _data["go_to_pickup_time"] = goToPickupTime;
    _data["start_otp"] = startOtp;
    _data["placed_time"] = placedTime;
    _data["booking_status"] = bookingStatus;
    _data["booking_level"] = bookingLevel;
    _data["time_display_level"] = timeDisplayLevel;
    _data["ride_duration_display"] = rideDurationDisplay;
    _data["cancel_by"] = cancelBy;
    _data["cancel_reason"] = cancelReason;
    _data["driver_id"] = driverId;
    _data["driver_lat"] = driverLat;
    _data["driver_long"] = driverLong;
    _data["driver_gps_update_time"] = driverGpsUpdateTime;
    _data["driver_gps_location"] = driverGpsLocation;
    _data["driver_name"] = driverName;
    _data["driver_photo"] = driverPhoto;
    _data["driver_mobile_number"] = driverMobileNumber;
    _data["driver_gender"] = driverGender;
    _data["vehicle_photo"] = vehiclePhoto;
    _data["vehicle_name"] = vehicleName;
    _data["vehicle_number"] = vehicleNumber;
    _data["vehicle_model"] = vehicleModel;
    _data["vehicle_type_id_driver"] = vehicleTypeIdDriver;
    _data["driver_is_app_open"] = driverIsAppOpen;
    _data["driver_allot_time"] = driverAllotTime;
    _data["rating_status"] = ratingStatus;
    _data["rating_id"] = ratingId;
    _data["star_rating"] = starRating;
    _data["rating_remark"] = ratingRemark;
    _data["rating_date_time"] = ratingDateTime;
    return _data;
  }
}