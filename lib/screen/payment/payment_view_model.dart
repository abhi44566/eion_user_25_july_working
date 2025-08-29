import 'package:driver_suvidha_user/import.dart';
import 'package:http/http.dart' as http;

import '../setting/provider/view_model/order_history_view_model.dart';

class PaymentViewModel extends ChangeNotifier {
  final _myRepo = PaymentRepository();
  bool isLoading = false;
  GetPaymentModel? getPaymentRes;
  Future<dynamic> getPaymentApi(BuildContext context,
      {String? bookingid, String? isSelectWallet}) async {
    isLoading = true;
    notifyListeners();
    final userId = await MySharedPreferences.getUserId();
    try {
      getPaymentRes = await _myRepo.getPaymentRepo({
        'user_id': userId,
        'booking_id': bookingid,
        'is_wallet_selected': isSelectWallet,
      }, context);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<dynamic> sendFeedbackApi(BuildContext context,
      {String? bookingid, String? ratingMessage, String? ratingCount,String?bookingStar,String?bookingMessage}) async {
    isLoading = true;
    notifyListeners();
    final userId = await MySharedPreferences.getUserId();
    try {
      await _myRepo.sendFeedBackRepo({
        'user_id': userId,
        'booking_id': bookingid,
        'rating_message': ratingMessage,
        'rating_star': ratingCount,
        'booking_star': bookingStar,
        'booking_message': bookingMessage,
      }, context);
      if (ApiStatus.status == true) {
        Navigator.pop(context);
        Provider.of<OrderHistoryViewModel>(context, listen: false).getOrderHistory(context, type:  "Completed");
      }
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<dynamic> sendBookingPaymentSuccess(BuildContext context,
      {String? bookingid, String? isSelectWallet, String? paymentId}) async {
    isLoading = true;
    notifyListeners();
    final userId = await MySharedPreferences.getUserId();
    try {
      await _myRepo.sendBookingPaymentSuccessRepo({
        'user_id': userId,
        'booking_id': bookingid,
        'is_wallet_selected': isSelectWallet,
        'payment_id': paymentId,
      }, context);
      if (ApiStatus.status == true) {
        await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              title: Center(
                child: Text(
                  "Thank You!",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.check_circle, color: Colors.green, size: 50),
                  SizedBox(height: 10),
                  Text("Payment completed successfully."),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    // Navigator.of(context).pushNamedAndRemoveUntil(
                    //   '/home',
                    //       (route) => false,
                    // ); // Navigate to Home and remove all previous routes
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        ).then(
          (value) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => MapScreen()),
                (route) => false);

            showRatingSheet(context, bookingId:  bookingid.toString(),

            );
          },
        );
      }
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  final Razorpay _razorpay = Razorpay();
  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
      msg: "Payment failed! Error: ${response.message}",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
      msg: "External Wallet selected: ${response.walletName}",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
    );
  }

  Future<dynamic> postWalletRechargeApi(BuildContext context,
      {String? amount, String? paymentId}) async {
    final userID = await MySharedPreferences.getUserId();
    isLoading = true;
    notifyListeners();
    try {
      await _myRepo.postWalletRechargeRepo({
        'user_id': userID,
        'recharge_amt': amount.toString(),
        'payment_id': paymentId.toString()
      }, context);
      if (ApiStatus.status == true) {
        ApiStatus.isRecharge = false;
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              title: Center(
                child: Text(
                  "Thank You!",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.check_circle, color: Colors.green, size: 60),
                  SizedBox(height: 15),
                  Text("Recharge successfully"),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
        Provider.of<ProfileViewModel>(context, listen: false)
            .getWalletTransactionApi(context);
      }
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<dynamic> createOrderRecharge(context, {String? amount}) async {
    final splash = Provider.of<BaseUrlViewModel>(context, listen: false);
    final getProfile =
        Provider.of<ProfileViewModel>(context, listen: false).getProfileRes;
    double amountValue = double.tryParse(amount.toString()) ?? 0;
    int sendAmount = (amountValue * 100).round();

    if (amountValue <= 0) {
      debugPrint("Invalid amount: must be greater than zero.");
      return;
    }
    isLoading = true;
    notifyListeners();
    String baseUrl = 'https://api.razorpay.com/v1/orders';
    final apiKey = splash.barFee?.response?.hl2cz;
    final apiSecret = splash.barFee?.response?.r9d4p7m;
    String credentials = "$apiKey:$apiSecret";
    String encodedCredentials = base64Encode(utf8.encode(credentials));

    try {
      var headers = {
        'Authorization': 'Basic $encodedCredentials',
        'Content-Type': 'application/json',
      };

      var body = json.encode({
        'amount': sendAmount, // ✅ sending as integer
        'currency': 'INR',
        'receipt': 'receipt_${DateTime.now().millisecondsSinceEpoch}',
      });

      var response =
          await http.post(Uri.parse(baseUrl), headers: headers, body: body);
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        final created = jsonResponse["created_at"].toString();
        final id = jsonResponse["id"].toString();
        if (jsonResponse["status"] == "created") {
          var options = {
            'key': apiKey,
            'amount': sendAmount,
            'name': 'Eion',
            'order_id': id,
            'description': "wallet recharge",
            'currency': "INR",
            'prefill': {
              'contact': '${getProfile?.response?.mobileNumber ?? ''}',
              'email': '${getProfile?.response?.emailId ?? ''}',
              'name': 'Eion',
            },
          };

          try {
            _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
                (PaymentSuccessResponse response) {
              postWalletRechargeApi(context,
                  amount: amount.toString(), paymentId: id.toString());
            });
            _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
            _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
            _razorpay.open(options);
          } catch (e) {
            debugPrint("Error opening Razorpay checkout: $e");
          }
        }
      } else {
        debugPrint('Order creation failed. Status: ${response.statusCode}');
      }
    } catch (e, stacktrace) {
      debugPrint('Exception: $e');
      debugPrint('Stacktrace: $stacktrace');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> createOrder(context,
      {String? amount, String? bookingId, String? isSelectWallet}) async {
    final splash = Provider.of<BaseUrlViewModel>(context, listen: false);
    double amountValue = double.tryParse(amount.toString()) ?? 0;
    int sendAmount = (amountValue * 100).round();

    if (amountValue <= 0) {
      debugPrint("Invalid amount: must be greater than zero.");
      return;
    }
    isLoading = true;
    notifyListeners();
    String baseUrl = 'https://api.razorpay.com/v1/orders';
    final apiKey = splash.barFee?.response?.hl2cz;
    final apiSecret = splash.barFee?.response?.r9d4p7m;

    String credentials = "$apiKey:$apiSecret";
    String encodedCredentials = base64Encode(utf8.encode(credentials));

    try {
      var headers = {
        'Authorization': 'Basic $encodedCredentials',
        'Content-Type': 'application/json',
      };

      var body = json.encode({
        'amount': sendAmount, // ✅ sending as integer
        'currency': 'INR',
        'receipt': 'receipt_${DateTime.now().millisecondsSinceEpoch}',
      });

      var response =
          await http.post(Uri.parse(baseUrl), headers: headers, body: body);

      debugPrint('Status code: ${response.statusCode}');
      debugPrint('Response body: ${response.body}');

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        final created = jsonResponse["created_at"].toString();
        final id = jsonResponse["id"].toString();

        debugPrint('Order ID: $id');
        debugPrint('Created at: $created');

        if (jsonResponse["status"] == "created") {
          var options = {
            'key': apiKey,
            'amount': sendAmount,
            'name': 'Tomthin',
            'order_id': id,
            'description': "wallet recharge",
            'currency': "INR",
            'prefill': {
              'contact': '2345678768d',
              'email': 'admin@gmail.com',
              'name': 'Tomthin',
            },
          };

          try {
            _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
                (PaymentSuccessResponse response) {
              sendBookingPaymentSuccess(context,
                  bookingid: bookingId,
                  isSelectWallet: isSelectWallet,
                  paymentId: response.paymentId);
            });
            _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
            _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
            _razorpay.open(options);
          } catch (e) {
            debugPrint("Error opening Razorpay checkout: $e");
          }
        }
      } else {
        debugPrint('Order creation failed. Status: ${response.statusCode}');
      }
    } catch (e, stacktrace) {
      debugPrint('Exception: $e');
      debugPrint('Stacktrace: $stacktrace');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
