import 'package:driver_suvidha_user/import.dart';
class PaymentScreen extends StatefulWidget {
 final String?bookingId;
   PaymentScreen({super.key,this.bookingId});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool isPayNow = false;

  @override
  void initState() {
    super.initState();
   Future.microtask( () {
    fetchPayment(isWallet: "0");
   });
  }
  void fetchPayment({String? isWallet})async{
    Provider.of<PaymentViewModel>(context,listen: false).getPaymentApi(context,bookingid: widget.bookingId,isSelectWallet:isWallet );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        title: const Text('Payment'),
      ),
      body: Consumer<PaymentViewModel>(builder: (context, value, child) {
        final getPayment = value.getPaymentRes?.response;
        return Padding(
          padding: const EdgeInsets.all(15),
          child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Headings.txt17BlackBold("Total Payment:", context),
                Headings.txt16black("Rs. ${getPayment?.totalAmtForPayment??''}", context),
              ],),
            SizedBox(height: 5,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Headings.txt17BlackBold("Pay by wallet:", context),
                Headings.txt16black("Rs. ${getPayment?.payByWallet??''}", context),
              ],),
            SizedBox(height: 5,),
            Divider(),
            SizedBox(height: 5,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Headings.txt17BlackBold("Skip for pay:", context),
                Headings.txt16black("Rs.${getPayment?.skipForPay}", context),
              ],),
            SizedBox(height: 5,),
            Divider(),
            SizedBox(height: 5),
            Row( mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  activeColor: AppColor.appColor,
                  value: isPayNow, onChanged: (value) {
                  setState(() {
                    isPayNow = value!;
                    fetchPayment(isWallet: isPayNow==true?"1":"0");
                  });
                },),
                SizedBox(width: 10),

                Headings.txt17BlackBold("Wallet Balance: ", context),
                Headings.txt16black("Rs.${getPayment?.walletBalance??''}", context),
              ],),
            SizedBox(height: 5,),
            Divider(),
            SizedBox(height: 50),
            if(getPayment?.isAllPaid=="0")

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomButton(onTap: (){
                print(getPayment?.totalAmtForPayment??'');
                if(getPayment?.skipForPay!='0'){
                  value.createOrder(context,
                      amount:getPayment?.totalAmtForPayment.toString(),
                      bookingId: widget.bookingId,
                      isSelectWallet: isPayNow==true?"1":"0"
                  );
                }else{

                  value.sendBookingPaymentSuccess(context,
                      bookingid:widget.bookingId,
                      isSelectWallet:isPayNow==true?"1":"0",paymentId: '');
                }
              }, child: Headings.txt17WhiteBold(getPayment?.buttonName??'', context)),
            )
          ],),
        );
      },)
    );
  }
}
