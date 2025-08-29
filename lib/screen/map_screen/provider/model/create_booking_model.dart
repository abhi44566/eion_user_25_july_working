class CreateBookingModel {
  CreateBookingModel({
      Response? response,}){
    _response = response;
}

  CreateBookingModel.fromJson(dynamic json) {
    _response = json['response'] != null ? Response.fromJson(json['response']) : null;
  }
  Response? _response;
CreateBookingModel copyWith({  Response? response,
}) => CreateBookingModel(  response: response ?? _response,
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
      String? fromCity, 
      String? fromState, 
      String? toCity, 
      String? toState, 
      String? distanceInKm, 
      String? travelDurationInMinutes, 
      String? pickupDate, 
      String? pickupTime, 
      String? pickupDateTime, 
      String? pickupDateDisplay, 
      String? pickupTimeDisplay, 
      String? pickupDateTimeDisplay, 
      String? returnDate, 
      String? returnTime, 
      String? returnDateTime, 
      String? returnDateDisplay, 
      String? returnTimeDisplay, 
      String? returnDateTimeDisplay, 
      String? bookingId, 
      String? bookingAmt, 
      String? msg, 
      String? msg2, 
      String? msg3, 
      bool? status,}){
    _fromCity = fromCity;
    _fromState = fromState;
    _toCity = toCity;
    _toState = toState;
    _distanceInKm = distanceInKm;
    _travelDurationInMinutes = travelDurationInMinutes;
    _pickupDate = pickupDate;
    _pickupTime = pickupTime;
    _pickupDateTime = pickupDateTime;
    _pickupDateDisplay = pickupDateDisplay;
    _pickupTimeDisplay = pickupTimeDisplay;
    _pickupDateTimeDisplay = pickupDateTimeDisplay;
    _returnDate = returnDate;
    _returnTime = returnTime;
    _returnDateTime = returnDateTime;
    _returnDateDisplay = returnDateDisplay;
    _returnTimeDisplay = returnTimeDisplay;
    _returnDateTimeDisplay = returnDateTimeDisplay;
    _bookingId = bookingId;
    _bookingAmt = bookingAmt;
    _msg = msg;
    _msg2 = msg2;
    _msg3 = msg3;
    _status = status;
}

  Response.fromJson(dynamic json) {
    _fromCity = json['from_city'];
    _fromState = json['from_state'];
    _toCity = json['to_city'];
    _toState = json['to_state'];
    _distanceInKm = json['distance_in_km'];
    _travelDurationInMinutes = json['travel_duration_in_minutes'];
    _pickupDate = json['pickup_date'];
    _pickupTime = json['pickup_time'];
    _pickupDateTime = json['pickup_date_time'];
    _pickupDateDisplay = json['pickup_date_display'];
    _pickupTimeDisplay = json['pickup_time_display'];
    _pickupDateTimeDisplay = json['pickup_date_time_display'];
    _returnDate = json['return_date'];
    _returnTime = json['return_time'];
    _returnDateTime = json['return_date_time'];
    _returnDateDisplay = json['return_date_display'];
    _returnTimeDisplay = json['return_time_display'];
    _returnDateTimeDisplay = json['return_date_time_display'];
    _bookingId = json['booking_id'];
    _bookingAmt = json['booking_amt'];
    _msg = json['msg'];
    _msg2 = json['msg2'];
    _msg3 = json['msg3'];
    _status = json['status'];
  }
  String? _fromCity;
  String? _fromState;
  String? _toCity;
  String? _toState;
  String? _distanceInKm;
  String? _travelDurationInMinutes;
  String? _pickupDate;
  String? _pickupTime;
  String? _pickupDateTime;
  String? _pickupDateDisplay;
  String? _pickupTimeDisplay;
  String? _pickupDateTimeDisplay;
  String? _returnDate;
  String? _returnTime;
  String? _returnDateTime;
  String? _returnDateDisplay;
  String? _returnTimeDisplay;
  String? _returnDateTimeDisplay;
  String? _bookingId;
  String? _bookingAmt;
  String? _msg;
  String? _msg2;
  String? _msg3;
  bool? _status;
Response copyWith({  String? fromCity,
  String? fromState,
  String? toCity,
  String? toState,
  String? distanceInKm,
  String? travelDurationInMinutes,
  String? pickupDate,
  String? pickupTime,
  String? pickupDateTime,
  String? pickupDateDisplay,
  String? pickupTimeDisplay,
  String? pickupDateTimeDisplay,
  String? returnDate,
  String? returnTime,
  String? returnDateTime,
  String? returnDateDisplay,
  String? returnTimeDisplay,
  String? returnDateTimeDisplay,
  String? bookingId,
  String? bookingAmt,
  String? msg,
  String? msg2,
  String? msg3,
  bool? status,
}) => Response(  fromCity: fromCity ?? _fromCity,
  fromState: fromState ?? _fromState,
  toCity: toCity ?? _toCity,
  toState: toState ?? _toState,
  distanceInKm: distanceInKm ?? _distanceInKm,
  travelDurationInMinutes: travelDurationInMinutes ?? _travelDurationInMinutes,
  pickupDate: pickupDate ?? _pickupDate,
  pickupTime: pickupTime ?? _pickupTime,
  pickupDateTime: pickupDateTime ?? _pickupDateTime,
  pickupDateDisplay: pickupDateDisplay ?? _pickupDateDisplay,
  pickupTimeDisplay: pickupTimeDisplay ?? _pickupTimeDisplay,
  pickupDateTimeDisplay: pickupDateTimeDisplay ?? _pickupDateTimeDisplay,
  returnDate: returnDate ?? _returnDate,
  returnTime: returnTime ?? _returnTime,
  returnDateTime: returnDateTime ?? _returnDateTime,
  returnDateDisplay: returnDateDisplay ?? _returnDateDisplay,
  returnTimeDisplay: returnTimeDisplay ?? _returnTimeDisplay,
  returnDateTimeDisplay: returnDateTimeDisplay ?? _returnDateTimeDisplay,
  bookingId: bookingId ?? _bookingId,
  bookingAmt: bookingAmt ?? _bookingAmt,
  msg: msg ?? _msg,
  msg2: msg2 ?? _msg2,
  msg3: msg3 ?? _msg3,
  status: status ?? _status,
);
  String? get fromCity => _fromCity;
  String? get fromState => _fromState;
  String? get toCity => _toCity;
  String? get toState => _toState;
  String? get distanceInKm => _distanceInKm;
  String? get travelDurationInMinutes => _travelDurationInMinutes;
  String? get pickupDate => _pickupDate;
  String? get pickupTime => _pickupTime;
  String? get pickupDateTime => _pickupDateTime;
  String? get pickupDateDisplay => _pickupDateDisplay;
  String? get pickupTimeDisplay => _pickupTimeDisplay;
  String? get pickupDateTimeDisplay => _pickupDateTimeDisplay;
  String? get returnDate => _returnDate;
  String? get returnTime => _returnTime;
  String? get returnDateTime => _returnDateTime;
  String? get returnDateDisplay => _returnDateDisplay;
  String? get returnTimeDisplay => _returnTimeDisplay;
  String? get returnDateTimeDisplay => _returnDateTimeDisplay;
  String? get bookingId => _bookingId;
  String? get bookingAmt => _bookingAmt;
  String? get msg => _msg;
  String? get msg2 => _msg2;
  String? get msg3 => _msg3;
  bool? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['from_city'] = _fromCity;
    map['from_state'] = _fromState;
    map['to_city'] = _toCity;
    map['to_state'] = _toState;
    map['distance_in_km'] = _distanceInKm;
    map['travel_duration_in_minutes'] = _travelDurationInMinutes;
    map['pickup_date'] = _pickupDate;
    map['pickup_time'] = _pickupTime;
    map['pickup_date_time'] = _pickupDateTime;
    map['pickup_date_display'] = _pickupDateDisplay;
    map['pickup_time_display'] = _pickupTimeDisplay;
    map['pickup_date_time_display'] = _pickupDateTimeDisplay;
    map['return_date'] = _returnDate;
    map['return_time'] = _returnTime;
    map['return_date_time'] = _returnDateTime;
    map['return_date_display'] = _returnDateDisplay;
    map['return_time_display'] = _returnTimeDisplay;
    map['return_date_time_display'] = _returnDateTimeDisplay;
    map['booking_id'] = _bookingId;
    map['booking_amt'] = _bookingAmt;
    map['msg'] = _msg;
    map['msg2'] = _msg2;
    map['msg3'] = _msg3;
    map['status'] = _status;
    return map;
  }

}