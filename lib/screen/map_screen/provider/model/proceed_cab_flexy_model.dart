class ProceedCabFlexyModel {
  Response? response;

  ProceedCabFlexyModel({this.response});

  ProceedCabFlexyModel.fromJson(Map<String, dynamic> json) {
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
  String? startDate;
  String? returnDate;
  String? coupanCode;
  String? startTime;
  String? returnTime;
  String? startDateTime;
  String? returnDateTime;
  String? actualHour;
  String? perKmCharge;
  String? perKmChargeOrg;
  String? perMinCharge;
  String? perMinChargeOrg;
  String? baseFare;
  String? isTollApplicable;
  String? kmCharges;
  String? durationCharges;
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
  String? distance;
  String? distanceOrg;
  String? rideDuration;
  String? rideDurationOrg;
  String? reachedBy;
  String? vehicleTypeId;
  String? vehileTypeName;
  String? vehicleTypeImage;

  CategoryList(
      {this.startDate,
        this.returnDate,
        this.coupanCode,
        this.startTime,
        this.returnTime,
        this.startDateTime,
        this.returnDateTime,
        this.actualHour,
        this.perKmCharge,
        this.perKmChargeOrg,
        this.perMinCharge,
        this.perMinChargeOrg,
        this.baseFare,
        this.isTollApplicable,
        this.kmCharges,
        this.durationCharges,
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
        this.distance,
        this.distanceOrg,
        this.rideDuration,
        this.rideDurationOrg,
        this.reachedBy,
        this.vehicleTypeId,
        this.vehileTypeName,
        this.vehicleTypeImage});

  CategoryList.fromJson(Map<String, dynamic> json) {
    startDate = json['start_date'];
    returnDate = json['return_date'];
    coupanCode = json['coupan_code'];
    startTime = json['start_time'];
    returnTime = json['return_time'];
    startDateTime = json['start_date_time'];
    returnDateTime = json['return_date_time'];
    actualHour = json['actual_hour'];
    perKmCharge = json['per_km_charge'];
    perKmChargeOrg = json['per_km_charge_org'];
    perMinCharge = json['per_min_charge'];
    perMinChargeOrg = json['per_min_charge_org'];
    baseFare = json['base_fare'];
    isTollApplicable = json['is_toll_applicable'];
    kmCharges = json['km_charges'];
    durationCharges = json['duration_charges'];
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
    distance = json['distance'];
    distanceOrg = json['distance_org'];
    rideDuration = json['ride_duration'];
    rideDurationOrg = json['ride_duration_org'];
    reachedBy = json['reached_by'];
    vehicleTypeId = json['vehicle_type_id'];
    vehileTypeName = json['vehile_type_name'];
    vehicleTypeImage = json['vehicle_type_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['start_date'] = this.startDate;
    data['return_date'] = this.returnDate;
    data['coupan_code'] = this.coupanCode;
    data['start_time'] = this.startTime;
    data['return_time'] = this.returnTime;
    data['start_date_time'] = this.startDateTime;
    data['return_date_time'] = this.returnDateTime;
    data['actual_hour'] = this.actualHour;
    data['per_km_charge'] = this.perKmCharge;
    data['per_km_charge_org'] = this.perKmChargeOrg;
    data['per_min_charge'] = this.perMinCharge;
    data['per_min_charge_org'] = this.perMinChargeOrg;
    data['base_fare'] = this.baseFare;
    data['is_toll_applicable'] = this.isTollApplicable;
    data['km_charges'] = this.kmCharges;
    data['duration_charges'] = this.durationCharges;
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
    data['distance'] = this.distance;
    data['distance_org'] = this.distanceOrg;
    data['ride_duration'] = this.rideDuration;
    data['ride_duration_org'] = this.rideDurationOrg;
    data['reached_by'] = this.reachedBy;
    data['vehicle_type_id'] = this.vehicleTypeId;
    data['vehile_type_name'] = this.vehileTypeName;
    data['vehicle_type_image'] = this.vehicleTypeImage;
    return data;
  }
}
