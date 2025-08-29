class OutstationModel {
  Response? response;

  OutstationModel({this.response});

  OutstationModel.fromJson(Map<String, dynamic> json) {
    response = json['response'] != null
        ? new Response.fromJson(json['response'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.response != null) {
      data['response'] = this.response!.toJson();
    }
    return data;
  }
}

class Response {
  String? fromCity;
  String? fromState;
  String? toCity;
  String? toState;
  String? distanceInKm;
  String? travelDurationInMinutes;
  String? pickupDate;
  String? pickupTime;
  String? pickupDateTime;
  String? pickupDateDisplay;
  String? pickupTimeDisplay;
  String? pickupDateTimeDisplay;
  String? returnDate;
  String? returnTime;
  String? returnDateTime;
  String? returnDateDisplay;
  String? returnTimeDisplay;
  String? returnDateTimeDisplay;
  String? couponCode;
  List<CategoryList>? categoryList;
  String? msg;
  bool? status;

  Response(
      {this.fromCity,
        this.fromState,
        this.toCity,
        this.toState,
        this.distanceInKm,
        this.travelDurationInMinutes,
        this.pickupDate,
        this.pickupTime,
        this.pickupDateTime,
        this.pickupDateDisplay,
        this.pickupTimeDisplay,
        this.pickupDateTimeDisplay,
        this.returnDate,
        this.returnTime,
        this.returnDateTime,
        this.returnDateDisplay,
        this.returnTimeDisplay,
        this.returnDateTimeDisplay,
        this.couponCode,
        this.categoryList,
        this.msg,
        this.status});

  Response.fromJson(Map<String, dynamic> json) {
    fromCity = json['from_city'];
    fromState = json['from_state'];
    toCity = json['to_city'];
    toState = json['to_state'];
    distanceInKm = json['distance_in_km'];
    travelDurationInMinutes = json['travel_duration_in_minutes'];
    pickupDate = json['pickup_date'];
    pickupTime = json['pickup_time'];
    pickupDateTime = json['pickup_date_time'];
    pickupDateDisplay = json['pickup_date_display'];
    pickupTimeDisplay = json['pickup_time_display'];
    pickupDateTimeDisplay = json['pickup_date_time_display'];
    returnDate = json['return_date'];
    returnTime = json['return_time'];
    returnDateTime = json['return_date_time'];
    returnDateDisplay = json['return_date_display'];
    returnTimeDisplay = json['return_time_display'];
    returnDateTimeDisplay = json['return_date_time_display'];
    couponCode = json['coupon_code'];
    if (json['category_list'] != null) {
      categoryList = <CategoryList>[];
      json['category_list'].forEach((v) {
        categoryList!.add(new CategoryList.fromJson(v));
      });
    }
    msg = json['msg'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['from_city'] = this.fromCity;
    data['from_state'] = this.fromState;
    data['to_city'] = this.toCity;
    data['to_state'] = this.toState;
    data['distance_in_km'] = this.distanceInKm;
    data['travel_duration_in_minutes'] = this.travelDurationInMinutes;
    data['pickup_date'] = this.pickupDate;
    data['pickup_time'] = this.pickupTime;
    data['pickup_date_time'] = this.pickupDateTime;
    data['pickup_date_display'] = this.pickupDateDisplay;
    data['pickup_time_display'] = this.pickupTimeDisplay;
    data['pickup_date_time_display'] = this.pickupDateTimeDisplay;
    data['return_date'] = this.returnDate;
    data['return_time'] = this.returnTime;
    data['return_date_time'] = this.returnDateTime;
    data['return_date_display'] = this.returnDateDisplay;
    data['return_time_display'] = this.returnTimeDisplay;
    data['return_date_time_display'] = this.returnDateTimeDisplay;
    data['coupon_code'] = this.couponCode;
    if (this.categoryList != null) {
      data['category_list'] =
          this.categoryList!.map((v) => v.toJson()).toList();
    }
    data['msg'] = this.msg;
    data['status'] = this.status;
    return data;
  }
}

class CategoryList {
  String? nightStartTime;
  String? nightEndTime;
  String? coupanCode;
  String? startDate;
  String? returnDate;
  String? startTime;
  String? returnTime;
  String? startDateTime;
  String? returnDateTime;
  String? actualHour;
  String? durationLevel;
  String? baseKm;
  String? baseKmOrg;
  String? baseHour;
  String? baseHourOrg;
  String? planLevel;
  String? planName;
  String? baseFare;
  String? nightCharge;
  String? extraPerKmCharge;
  String? extraPerKmChargeOrg;
  String? extraPerNightCharge;
  String? extraPerNightChargeOrg;
  String? extraPerHourCharge;
  String? extraPerHourChargeOrg;
  String? actualExtraKmCharge;
  String? actualExtraHourCharge;
  String? fixDriverAllowance;
  String? roundTripDiscount;
  String? totalAmt;
  String? roundDiscountAmt;
  String? totalAfterDiscount;
  String? gstAmt;
  String? gstApplicable;
  String? netPayWithGst;
  String? driverAmt;
  String? companyAmt;
  String? nights;
  String? extraKm;
  String? extraHour;
  String? nightsOrg;
  String? extraKmOrg;
  String? extraHourOrg;
  String? distance;
  String? distanceOrg;
  String? reachedBy;
  String? isTollChargeExcluded;
  String? isParkingChargeExcluded;
  String? vehicleTypeId;
  String? vehileTypeName;
  String? vehicleTypeImage;
  String? roundTripDiscountLevel;

  CategoryList(
      {this.nightStartTime,
        this.nightEndTime,
        this.coupanCode,
        this.startDate,
        this.returnDate,
        this.startTime,
        this.returnTime,
        this.startDateTime,
        this.returnDateTime,
        this.actualHour,
        this.durationLevel,
        this.baseKm,
        this.baseKmOrg,
        this.baseHour,
        this.baseHourOrg,
        this.planLevel,
        this.planName,
        this.baseFare,
        this.nightCharge,
        this.extraPerKmCharge,
        this.extraPerKmChargeOrg,
        this.extraPerNightCharge,
        this.extraPerNightChargeOrg,
        this.extraPerHourCharge,
        this.extraPerHourChargeOrg,
        this.actualExtraKmCharge,
        this.actualExtraHourCharge,
        this.fixDriverAllowance,
        this.roundTripDiscount,
        this.totalAmt,
        this.roundDiscountAmt,
        this.totalAfterDiscount,
        this.gstAmt,
        this.gstApplicable,
        this.netPayWithGst,
        this.driverAmt,
        this.companyAmt,
        this.nights,
        this.extraKm,
        this.extraHour,
        this.nightsOrg,
        this.extraKmOrg,
        this.extraHourOrg,
        this.distance,
        this.distanceOrg,
        this.reachedBy,
        this.isTollChargeExcluded,
        this.isParkingChargeExcluded,
        this.vehicleTypeId,
        this.vehileTypeName,
        this.vehicleTypeImage,
        this.roundTripDiscountLevel});

  CategoryList.fromJson(Map<String, dynamic> json) {
    nightStartTime = json['night_start_time'];
    nightEndTime = json['night_end_time'];
    coupanCode = json['coupan_code'];
    startDate = json['start_date'];
    returnDate = json['return_date'];
    startTime = json['start_time'];
    returnTime = json['return_time'];
    startDateTime = json['start_date_time'];
    returnDateTime = json['return_date_time'];
    actualHour = json['actual_hour'];
    durationLevel = json['duration_level'];
    baseKm = json['base_km'];
    baseKmOrg = json['base_km_org'];
    baseHour = json['base_hour'];
    baseHourOrg = json['base_hour_org'];
    planLevel = json['plan_level'];
    planName = json['plan_name'];
    baseFare = json['base_fare'];
    nightCharge = json['night_charge'];
    extraPerKmCharge = json['extra_per_km_charge'];
    extraPerKmChargeOrg = json['extra_per_km_charge_org'];
    extraPerNightCharge = json['extra_per_night_charge'];
    extraPerNightChargeOrg = json['extra_per_night_charge_org'];
    extraPerHourCharge = json['extra_per_hour_charge'];
    extraPerHourChargeOrg = json['extra_per_hour_charge_org'];
    actualExtraKmCharge = json['actual_extra_km_charge'];
    actualExtraHourCharge = json['actual_extra_hour_charge'];
    fixDriverAllowance = json['fix_driver_allowance'];
    roundTripDiscount = json['round_trip_discount'];
    totalAmt = json['total_amt'];
    roundDiscountAmt = json['round_discount_amt'];
    totalAfterDiscount = json['total_after_discount'];
    gstAmt = json['gst_amt'];
    gstApplicable = json['gst_applicable'];
    netPayWithGst = json['net_pay_with_gst'];
    driverAmt = json['driver_amt'];
    companyAmt = json['company_amt'];
    nights = json['nights'];
    extraKm = json['extra_km'];
    extraHour = json['extra_hour'];
    nightsOrg = json['nights_org'];
    extraKmOrg = json['extra_km_org'];
    extraHourOrg = json['extra_hour_org'];
    distance = json['distance'];
    distanceOrg = json['distance_org'];
    reachedBy = json['reached_by'];
    isTollChargeExcluded = json['is_toll_charge_excluded'];
    isParkingChargeExcluded = json['is_parking_charge_excluded'];
    vehicleTypeId = json['vehicle_type_id'];
    vehileTypeName = json['vehile_type_name'];
    vehicleTypeImage = json['vehicle_type_image'];
    roundTripDiscountLevel = json['round_trip_discount_level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['night_start_time'] = this.nightStartTime;
    data['night_end_time'] = this.nightEndTime;
    data['coupan_code'] = this.coupanCode;
    data['start_date'] = this.startDate;
    data['return_date'] = this.returnDate;
    data['start_time'] = this.startTime;
    data['return_time'] = this.returnTime;
    data['start_date_time'] = this.startDateTime;
    data['return_date_time'] = this.returnDateTime;
    data['actual_hour'] = this.actualHour;
    data['duration_level'] = this.durationLevel;
    data['base_km'] = this.baseKm;
    data['base_km_org'] = this.baseKmOrg;
    data['base_hour'] = this.baseHour;
    data['base_hour_org'] = this.baseHourOrg;
    data['plan_level'] = this.planLevel;
    data['plan_name'] = this.planName;
    data['base_fare'] = this.baseFare;
    data['night_charge'] = this.nightCharge;
    data['extra_per_km_charge'] = this.extraPerKmCharge;
    data['extra_per_km_charge_org'] = this.extraPerKmChargeOrg;
    data['extra_per_night_charge'] = this.extraPerNightCharge;
    data['extra_per_night_charge_org'] = this.extraPerNightChargeOrg;
    data['extra_per_hour_charge'] = this.extraPerHourCharge;
    data['extra_per_hour_charge_org'] = this.extraPerHourChargeOrg;
    data['actual_extra_km_charge'] = this.actualExtraKmCharge;
    data['actual_extra_hour_charge'] = this.actualExtraHourCharge;
    data['fix_driver_allowance'] = this.fixDriverAllowance;
    data['round_trip_discount'] = this.roundTripDiscount;
    data['total_amt'] = this.totalAmt;
    data['round_discount_amt'] = this.roundDiscountAmt;
    data['total_after_discount'] = this.totalAfterDiscount;
    data['gst_amt'] = this.gstAmt;
    data['gst_applicable'] = this.gstApplicable;
    data['net_pay_with_gst'] = this.netPayWithGst;
    data['driver_amt'] = this.driverAmt;
    data['company_amt'] = this.companyAmt;
    data['nights'] = this.nights;
    data['extra_km'] = this.extraKm;
    data['extra_hour'] = this.extraHour;
    data['nights_org'] = this.nightsOrg;
    data['extra_km_org'] = this.extraKmOrg;
    data['extra_hour_org'] = this.extraHourOrg;
    data['distance'] = this.distance;
    data['distance_org'] = this.distanceOrg;
    data['reached_by'] = this.reachedBy;
    data['is_toll_charge_excluded'] = this.isTollChargeExcluded;
    data['is_parking_charge_excluded'] = this.isParkingChargeExcluded;
    data['vehicle_type_id'] = this.vehicleTypeId;
    data['vehile_type_name'] = this.vehileTypeName;
    data['vehicle_type_image'] = this.vehicleTypeImage;
    data['round_trip_discount_level'] = this.roundTripDiscountLevel;
    return data;
  }
}
