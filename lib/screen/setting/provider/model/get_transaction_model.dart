class GetTransactionModel {
  GetTransactionModel({
      Response? response,}){
    _response = response;
}

  GetTransactionModel.fromJson(dynamic json) {
    _response = json['response'] != null ? Response.fromJson(json['response']) : null;
  }
  Response? _response;
GetTransactionModel copyWith({  Response? response,
}) => GetTransactionModel(  response: response ?? _response,
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
      String? walletBalance, 
      List<TransactionList>? transactionList, 
      String? msg, 
      bool? status,}){
    _walletBalance = walletBalance;
    _transactionList = transactionList;
    _msg = msg;
    _status = status;
}

  Response.fromJson(dynamic json) {
    _walletBalance = json['wallet_balance'];
    if (json['transaction_list'] != null) {
      _transactionList = [];
      json['transaction_list'].forEach((v) {
        _transactionList?.add(TransactionList.fromJson(v));
      });
    }
    _msg = json['msg'];
    _status = json['status'];
  }
  String? _walletBalance;
  List<TransactionList>? _transactionList;
  String? _msg;
  bool? _status;
Response copyWith({  String? walletBalance,
  List<TransactionList>? transactionList,
  String? msg,
  bool? status,
}) => Response(  walletBalance: walletBalance ?? _walletBalance,
  transactionList: transactionList ?? _transactionList,
  msg: msg ?? _msg,
  status: status ?? _status,
);
  String? get walletBalance => _walletBalance;
  List<TransactionList>? get transactionList => _transactionList;
  String? get msg => _msg;
  bool? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['wallet_balance'] = _walletBalance;
    if (_transactionList != null) {
      map['transaction_list'] = _transactionList?.map((v) => v.toJson()).toList();
    }
    map['msg'] = _msg;
    map['status'] = _status;
    return map;
  }

}

class TransactionList {
  TransactionList({
      String? id, 
      String? userId, 
      String? amt, 
      String? operationType, 
      String? remark, 
      String? trType, 
      String? trDate, 
      String? trDateTime, 
      String? refrenceNo, 
      String? status,}){
    _id = id;
    _userId = userId;
    _amt = amt;
    _operationType = operationType;
    _remark = remark;
    _trType = trType;
    _trDate = trDate;
    _trDateTime = trDateTime;
    _refrenceNo = refrenceNo;
    _status = status;
}

  TransactionList.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _amt = json['amt'];
    _operationType = json['operation_type'];
    _remark = json['remark'];
    _trType = json['tr_type'];
    _trDate = json['tr_date'];
    _trDateTime = json['tr_date_time'];
    _refrenceNo = json['refrence_no'];
    _status = json['status'];
  }
  String? _id;
  String? _userId;
  String? _amt;
  String? _operationType;
  String? _remark;
  String? _trType;
  String? _trDate;
  String? _trDateTime;
  String? _refrenceNo;
  String? _status;
TransactionList copyWith({  String? id,
  String? userId,
  String? amt,
  String? operationType,
  String? remark,
  String? trType,
  String? trDate,
  String? trDateTime,
  String? refrenceNo,
  String? status,
}) => TransactionList(  id: id ?? _id,
  userId: userId ?? _userId,
  amt: amt ?? _amt,
  operationType: operationType ?? _operationType,
  remark: remark ?? _remark,
  trType: trType ?? _trType,
  trDate: trDate ?? _trDate,
  trDateTime: trDateTime ?? _trDateTime,
  refrenceNo: refrenceNo ?? _refrenceNo,
  status: status ?? _status,
);
  String? get id => _id;
  String? get userId => _userId;
  String? get amt => _amt;
  String? get operationType => _operationType;
  String? get remark => _remark;
  String? get trType => _trType;
  String? get trDate => _trDate;
  String? get trDateTime => _trDateTime;
  String? get refrenceNo => _refrenceNo;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['amt'] = _amt;
    map['operation_type'] = _operationType;
    map['remark'] = _remark;
    map['tr_type'] = _trType;
    map['tr_date'] = _trDate;
    map['tr_date_time'] = _trDateTime;
    map['refrence_no'] = _refrenceNo;
    map['status'] = _status;
    return map;
  }

}