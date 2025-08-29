class GetPaymentModel {
  GetPaymentModel({
      Response? response,}){
    _response = response;
}

  GetPaymentModel.fromJson(dynamic json) {
    _response = json['response'] != null ? Response.fromJson(json['response']) : null;
  }
  Response? _response;
GetPaymentModel copyWith({  Response? response,
}) => GetPaymentModel(  response: response ?? _response,
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
      String? totalAmtForPayment, 
      String? walletBalance, 
      String? payByWallet, 
      String? skipForPay, 
      String? isAllPaid, 
      String? buttonName, 
      String? msg, 
      bool? status,}){
    _totalAmtForPayment = totalAmtForPayment;
    _walletBalance = walletBalance;
    _payByWallet = payByWallet;
    _skipForPay = skipForPay;
    _isAllPaid = isAllPaid;
    _buttonName = buttonName;
    _msg = msg;
    _status = status;
}

  Response.fromJson(dynamic json) {
    _totalAmtForPayment = json['total_amt_for_payment'];
    _walletBalance = json['wallet_balance'];
    _payByWallet = json['pay_by_wallet'];
    _skipForPay = json['skip_for_pay'];
    _isAllPaid = json['is_all_paid'];
    _buttonName = json['button_name'];
    _msg = json['msg'];
    _status = json['status'];
  }
  String? _totalAmtForPayment;
  String? _walletBalance;
  String? _payByWallet;
  String? _skipForPay;
  String? _isAllPaid;
  String? _buttonName;
  String? _msg;
  bool? _status;
Response copyWith({  String? totalAmtForPayment,
  String? walletBalance,
  String? payByWallet,
  String? skipForPay,
  String? isAllPaid,
  String? buttonName,
  String? msg,
  bool? status,
}) => Response(  totalAmtForPayment: totalAmtForPayment ?? _totalAmtForPayment,
  walletBalance: walletBalance ?? _walletBalance,
  payByWallet: payByWallet ?? _payByWallet,
  skipForPay: skipForPay ?? _skipForPay,
  isAllPaid: isAllPaid ?? _isAllPaid,
  buttonName: buttonName ?? _buttonName,
  msg: msg ?? _msg,
  status: status ?? _status,
);
  String? get totalAmtForPayment => _totalAmtForPayment;
  String? get walletBalance => _walletBalance;
  String? get payByWallet => _payByWallet;
  String? get skipForPay => _skipForPay;
  String? get isAllPaid => _isAllPaid;
  String? get buttonName => _buttonName;
  String? get msg => _msg;
  bool? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total_amt_for_payment'] = _totalAmtForPayment;
    map['wallet_balance'] = _walletBalance;
    map['pay_by_wallet'] = _payByWallet;
    map['skip_for_pay'] = _skipForPay;
    map['is_all_paid'] = _isAllPaid;
    map['button_name'] = _buttonName;
    map['msg'] = _msg;
    map['status'] = _status;
    return map;
  }

}