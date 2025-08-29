class HomePageModel {
  Response? response;

  HomePageModel({this.response});

  HomePageModel.fromJson(Map<String, dynamic> json) {
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
  String? ongoingBookingId;
  List<PickupDefaultDateTimeList>? pickupDefaultDateTimeList;
  String? msg;
  String? pendingRatingId;
  bool? status;

  Response(
      {this.fromCity,
      this.fromState,
      this.ongoingBookingId,
      this.pickupDefaultDateTimeList,
      this.msg,
      this.pendingRatingId,
      this.status});

  Response.fromJson(Map<String, dynamic> json) {
    fromCity = json['from_city'];
    fromState = json['from_state'];
    ongoingBookingId = json['ongoing_booking_id'];
    if (json['pickup_default_date_time_list'] != null) {
      pickupDefaultDateTimeList = <PickupDefaultDateTimeList>[];
      json['pickup_default_date_time_list'].forEach((v) {
        pickupDefaultDateTimeList!
            .add(new PickupDefaultDateTimeList.fromJson(v));
      });
    }
    msg = json['msg'];
    pendingRatingId = json['pending_rating_id'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['from_city'] = this.fromCity;
    data['from_state'] = this.fromState;
    data['ongoing_booking_id'] = this.ongoingBookingId;
    if (this.pickupDefaultDateTimeList != null) {
      data['pickup_default_date_time_list'] =
          this.pickupDefaultDateTimeList!.map((v) => v.toJson()).toList();
    }
    data['msg'] = this.msg;
    data['pending_rating_id'] = this.pendingRatingId;
    data['status'] = this.status;
    return data;
  }
}

class PickupDefaultDateTimeList {
  String? dataType;
  String? defaultPickupDate;
  String? defaultPickupTime;
  String? defaultPickupDateTime;
  String? defaultPickupDateDisplay;
  String? defaultPickupTimeDisplay;
  String? defaultPickupDateTimeDisplay;

  PickupDefaultDateTimeList(
      {this.dataType,
      this.defaultPickupDate,
      this.defaultPickupTime,
      this.defaultPickupDateTime,
      this.defaultPickupDateDisplay,
      this.defaultPickupTimeDisplay,
      this.defaultPickupDateTimeDisplay});

  PickupDefaultDateTimeList.fromJson(Map<String, dynamic> json) {
    dataType = json['data_type'];
    defaultPickupDate = json['default_pickup_date'];
    defaultPickupTime = json['default_pickup_time'];
    defaultPickupDateTime = json['default_pickup_date_time'];
    defaultPickupDateDisplay = json['default_pickup_date_display'];
    defaultPickupTimeDisplay = json['default_pickup_time_display'];
    defaultPickupDateTimeDisplay = json['default_pickup_date_time_display'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data_type'] = this.dataType;
    data['default_pickup_date'] = this.defaultPickupDate;
    data['default_pickup_time'] = this.defaultPickupTime;
    data['default_pickup_date_time'] = this.defaultPickupDateTime;
    data['default_pickup_date_display'] = this.defaultPickupDateDisplay;
    data['default_pickup_time_display'] = this.defaultPickupTimeDisplay;
    data['default_pickup_date_time_display'] =
        this.defaultPickupDateTimeDisplay;
    return data;
  }
}
