class GetRentalModel {
  Response? response;

  GetRentalModel({this.response});

  GetRentalModel.fromJson(Map<String, dynamic> json) {
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
  String? couponCode;
  List<PlanList>? planList;
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
        this.couponCode,
        this.planList,
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
    couponCode = json['coupon_code'];
    if (json['plan_list'] != null) {
      planList = <PlanList>[];
      json['plan_list'].forEach((v) {
        planList!.add(new PlanList.fromJson(v));
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
    data['coupon_code'] = this.couponCode;
    if (this.planList != null) {
      data['plan_list'] = this.planList!.map((v) => v.toJson()).toList();
    }
    data['msg'] = this.msg;
    data['status'] = this.status;
    return data;
  }
}

class PlanList {
  String? timeInHour;
  String? baseKm;
  String? displayLevel;
  List<CategoryList>? categoryList;

  PlanList(
      {this.timeInHour, this.baseKm, this.displayLevel, this.categoryList});

  PlanList.fromJson(Map<String, dynamic> json) {
    timeInHour = json['time_in_hour'];
    baseKm = json['base_km'];
    displayLevel = json['display_level'];
    if (json['category_list'] != null) {
      categoryList = <CategoryList>[];
      json['category_list'].forEach((v) {
        categoryList!.add(new CategoryList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time_in_hour'] = this.timeInHour;
    data['base_km'] = this.baseKm;
    data['display_level'] = this.displayLevel;
    if (this.categoryList != null) {
      data['category_list'] =
          this.categoryList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryList {
  String? startDate;
  String? returnDate;
  String? startTime;
  String? returnTime;
  String? startDateTime;
  String? returnDateTime;
  String? actualHour;
  String? actualDurationMinutes;
  String? planName;
  String? planLevel;
  String? baseKm;
  String? baseHour;
  String? baseFare;
  String? isTollExtra;
  String? isParkingExtra;
  String? extraPerKmCharge;
  String? extraPerKmChargeOrg;
  String? extraPerMinCharge;
  String? extraPerMinChargeOrg;
  String? actualExtraKmCharge;
  String? actualExtraMinCharge;
  String? surgeCharge;
  String? totalAmt;
  String? roundDiscountAmt;
  String? roundDiscount;
  String? totalAfterDiscount;
  String? driverAmt;
  String? companyAmt;
  String? gstAmt;
  String? gstApplicable;
  String? netPayWithGst;
  String? extraKm;
  String? extraMinutes;
  String? extraKmOrg;
  String? extraMinutesOrg;
  String? coupanCode;
  String? distance;
  String? distanceOrg;
  String? reachedBy;
  String? vehicleTypeId;
  String? vehileTypeName;
  String? vehicleTypeImage;

  CategoryList(
      {this.startDate,
        this.returnDate,
        this.startTime,
        this.returnTime,
        this.startDateTime,
        this.returnDateTime,
        this.actualHour,
        this.actualDurationMinutes,
        this.planName,
        this.planLevel,
        this.baseKm,
        this.baseHour,
        this.baseFare,
        this.isTollExtra,
        this.isParkingExtra,
        this.extraPerKmCharge,
        this.extraPerKmChargeOrg,
        this.extraPerMinCharge,
        this.extraPerMinChargeOrg,
        this.actualExtraKmCharge,
        this.actualExtraMinCharge,
        this.surgeCharge,
        this.totalAmt,
        this.roundDiscountAmt,
        this.roundDiscount,
        this.totalAfterDiscount,
        this.driverAmt,
        this.companyAmt,
        this.gstAmt,
        this.gstApplicable,
        this.netPayWithGst,
        this.extraKm,
        this.extraMinutes,
        this.extraKmOrg,
        this.extraMinutesOrg,
        this.coupanCode,
        this.distance,
        this.distanceOrg,
        this.reachedBy,
        this.vehicleTypeId,
        this.vehileTypeName,
        this.vehicleTypeImage});

  CategoryList.fromJson(Map<String, dynamic> json) {
    startDate = json['start_date'];
    returnDate = json['return_date'];
    startTime = json['start_time'];
    returnTime = json['return_time'];
    startDateTime = json['start_date_time'];
    returnDateTime = json['return_date_time'];
    actualHour = json['actual_hour'];
    actualDurationMinutes = json['actual_duration_minutes'];
    planName = json['plan_name'];
    planLevel = json['plan_level'];
    baseKm = json['base_km'];
    baseHour = json['base_hour'];
    baseFare = json['base_fare'];
    isTollExtra = json['is_toll_extra'];
    isParkingExtra = json['is_parking_extra'];
    extraPerKmCharge = json['extra_per_km_charge'];
    extraPerKmChargeOrg = json['extra_per_km_charge_org'];
    extraPerMinCharge = json['extra_per_min_charge'];
    extraPerMinChargeOrg = json['extra_per_min_charge_org'];
    actualExtraKmCharge = json['actual_extra_km_charge'];
    actualExtraMinCharge = json['actual_extra_min_charge'];
    surgeCharge = json['surge_charge'];
    totalAmt = json['total_amt'];
    roundDiscountAmt = json['round_discount_amt'];
    roundDiscount = json['round_discount'];
    totalAfterDiscount = json['total_after_discount'];
    driverAmt = json['driver_amt'];
    companyAmt = json['company_amt'];
    gstAmt = json['gst_amt'];
    gstApplicable = json['gst_applicable'];
    netPayWithGst = json['net_pay_with_gst'];
    extraKm = json['extra_km'];
    extraMinutes = json['extra_minutes'];
    extraKmOrg = json['extra_km_org'];
    extraMinutesOrg = json['extra_minutes_org'];
    coupanCode = json['coupan_code'];
    distance = json['distance'];
    distanceOrg = json['distance_org'];
    reachedBy = json['reached_by'];
    vehicleTypeId = json['vehicle_type_id'];
    vehileTypeName = json['vehile_type_name'];
    vehicleTypeImage = json['vehicle_type_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['start_date'] = this.startDate;
    data['return_date'] = this.returnDate;
    data['start_time'] = this.startTime;
    data['return_time'] = this.returnTime;
    data['start_date_time'] = this.startDateTime;
    data['return_date_time'] = this.returnDateTime;
    data['actual_hour'] = this.actualHour;
    data['actual_duration_minutes'] = this.actualDurationMinutes;
    data['plan_name'] = this.planName;
    data['plan_level'] = this.planLevel;
    data['base_km'] = this.baseKm;
    data['base_hour'] = this.baseHour;
    data['base_fare'] = this.baseFare;
    data['is_toll_extra'] = this.isTollExtra;
    data['is_parking_extra'] = this.isParkingExtra;
    data['extra_per_km_charge'] = this.extraPerKmCharge;
    data['extra_per_km_charge_org'] = this.extraPerKmChargeOrg;
    data['extra_per_min_charge'] = this.extraPerMinCharge;
    data['extra_per_min_charge_org'] = this.extraPerMinChargeOrg;
    data['actual_extra_km_charge'] = this.actualExtraKmCharge;
    data['actual_extra_min_charge'] = this.actualExtraMinCharge;
    data['surge_charge'] = this.surgeCharge;
    data['total_amt'] = this.totalAmt;
    data['round_discount_amt'] = this.roundDiscountAmt;
    data['round_discount'] = this.roundDiscount;
    data['total_after_discount'] = this.totalAfterDiscount;
    data['driver_amt'] = this.driverAmt;
    data['company_amt'] = this.companyAmt;
    data['gst_amt'] = this.gstAmt;
    data['gst_applicable'] = this.gstApplicable;
    data['net_pay_with_gst'] = this.netPayWithGst;
    data['extra_km'] = this.extraKm;
    data['extra_minutes'] = this.extraMinutes;
    data['extra_km_org'] = this.extraKmOrg;
    data['extra_minutes_org'] = this.extraMinutesOrg;
    data['coupan_code'] = this.coupanCode;
    data['distance'] = this.distance;
    data['distance_org'] = this.distanceOrg;
    data['reached_by'] = this.reachedBy;
    data['vehicle_type_id'] = this.vehicleTypeId;
    data['vehile_type_name'] = this.vehileTypeName;
    data['vehicle_type_image'] = this.vehicleTypeImage;
    return data;
  }
}
