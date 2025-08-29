
import '../../import.dart';

class PaymentAndCouponDialog extends StatefulWidget {
  @override
  _PaymentAndCouponDialogState createState() => _PaymentAndCouponDialogState();
}
class _PaymentAndCouponDialogState extends State<PaymentAndCouponDialog> {
  String? selectedPaymentMode;
  final TextEditingController _couponController = TextEditingController();
  final FocusNode _couponFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    selectedPaymentMode = ApiStatus.setPaymentMode;
  }

  @override
  void dispose() {
    _couponController.dispose();
    _couponFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        top: 20,
        left: 20,
        right: 20,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Headings.txt20BlackBold('Select Payment', context)),
            const SizedBox(height: 20),
            const Text(
              "Select Payment Mode",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            _paymentOption("Online", Icons.credit_card),
            _paymentOption("Cash", Icons.money),

            const SizedBox(height: 30),
            CustomButton(
              onTap: () {
                ApiStatus.setPaymentMode = selectedPaymentMode;
                Navigator.pop(context, selectedPaymentMode);
              },
              child: Headings.txt17WhiteBold("Apply", context),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _paymentOption(String title, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title),
      trailing: selectedPaymentMode == title
          ? Icon(Icons.check_circle, color: AppColor.appColor)
          : Icon(Icons.radio_button_unchecked, color: Colors.grey), // Inactive
      onTap: () {
        setState(() {
          selectedPaymentMode = title;
        });
      },
    );
  }
}


