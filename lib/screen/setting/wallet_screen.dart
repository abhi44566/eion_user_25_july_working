import 'package:driver_suvidha_user/import.dart';
import 'package:driver_suvidha_user/utils/progress_bar.dart';

class WalletTransactionScreen extends StatefulWidget {
  const WalletTransactionScreen({super.key});

  @override
  State<WalletTransactionScreen> createState() =>
      _WalletTransactionScreenState();
}

class _WalletTransactionScreenState extends State<WalletTransactionScreen> {
  @override
  void initState() {
    super.initState();
    ApiStatus.isRecharge = false;
    fetchData();
  }

  void fetchData() {
    Future.microtask(
      () {
        Provider.of<ProfileViewModel>(context, listen: false)
            .getWalletTransactionApi(context);
      },
    );
  }

  TextEditingController amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    MyFontSize fontSize = MyFontSize(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.appColor,
          title: Headings.txt17WhiteBold("Wallet Transaction", context),
        ),
        body: Consumer<ProfileViewModel>(
          builder: (context, value, child) {
            final getTransaction = value.getTransctionRes?.response;
            return Stack(children: [
              Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: fontSize.h * 0.03),
                      Card(
                        color: AppColor.whiteColor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          child: Column(
                            children: [
                              Headings.txt17BlackBold(
                                  "Your Wallet Balance", context),
                              Text(
                                "₹${getTransaction?.walletBalance ?? ''}",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                        ),
                      ),
                      rechargeButton(context),
                      SizedBox(height: fontSize.h * 0.03),
                      if (ApiStatus.isRecharge == true)
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Enter Amount",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 15),
                                  CustomTextForm(
                                    controller: amountController,
                                    inputType: TextInputType.number,
                                    hintText: 'Enter amount',
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(
                                              context); // Close dialog
                                        },
                                        child: Text(
                                          "Cancel",
                                          style: TextStyle(
                                              color: Colors.redAccent),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      ElevatedButton(
                                        onPressed: () async {
                                          String enteredAmount =
                                              amountController.text.trim();
                                          if (enteredAmount.isNotEmpty) {
                                            Provider.of<PaymentViewModel>(
                                                    context,
                                                    listen: false)
                                                .createOrderRecharge(context,
                                                    amount: enteredAmount)
                                                .then(
                                              (success) {
                                                if (success &&
                                                    ApiStatus.status == true &&
                                                    context.mounted) {
                                                  if (context.mounted) {
                                                    Navigator.pop(context);
                                                    Utils.toastMessage(
                                                        "Recharge Successfully");
                                                  }
                                                }
                                              },
                                            );
                                          } else {
                                            Utils.toastMessage(
                                                "Please enter Recharge Amount");
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                10), // Button border radius
                                          ),
                                          backgroundColor: AppColor.appColor,
                                        ),
                                        child: Headings.txt13White(
                                            "Submit", context),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      Column(
                        children: List.generate(
                          getTransaction?.transactionList?.length ?? 0,
                          (index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Card(
                                elevation: 5,
                                color: AppColor.whiteColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Headings.txt13black(
                                                getTransaction
                                                        ?.transactionList?[
                                                            index]
                                                        .remark ??
                                                    '',
                                                context),
                                            Headings.txt13black(
                                                getTransaction
                                                        ?.transactionList?[
                                                            index]
                                                        .trDate ??
                                                    '',
                                                context),
                                          ]),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          if (getTransaction
                                                  ?.transactionList?[index]
                                                  .operationType ==
                                              "plus")
                                            Headings.txt13Green(
                                                'Credit', context)
                                          else
                                            Headings.txt13Red("Debit", context),
                                          if (getTransaction
                                                  ?.transactionList?[index]
                                                  .operationType ==
                                              "plus")
                                            Headings.txt13Green(
                                                "₹${getTransaction?.transactionList?[index].amt}",
                                                context)
                                          else
                                            Headings.txt13Red(
                                                "₹${getTransaction?.transactionList?[index].amt}",
                                                context)
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              value.isLoading ? Center(child: CustomProgressBar()) : SizedBox(),
            ]);
          },
        ));
  }

  //
  // void showAmountDialog(BuildContext context) {
  //   TextEditingController amountController = TextEditingController();
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return Dialog(
  //         backgroundColor: AppColor.whiteColor,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(10), // Custom border radius
  //         ),
  //         child: Padding(
  //           padding: const EdgeInsets.all(20),
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               Text(
  //                 "Enter Amount",
  //                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //               ),
  //               SizedBox(height: 15),
  //               CustomTextForm(
  //                 controller: amountController,
  //                 inputType: TextInputType.number,
  //                 hintText:'Enter amount' ,
  //               ),
  //
  //               SizedBox(height: 20),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.end,
  //                 children: [
  //                   TextButton(
  //                     onPressed: () {
  //                       Navigator.pop(context); // Close dialog
  //                     },
  //                     child: Text("Cancel",style: TextStyle(color: Colors.redAccent),),
  //                   ),
  //                   SizedBox(width: 10),
  //                   ElevatedButton(
  //                     onPressed: () async{
  //
  //
  //
  //                       String enteredAmount = amountController.text.trim();
  //                       if (enteredAmount.isNotEmpty) {
  //                         Provider.of<PaymentViewModel>(context,listen: false).createOrderRecharge(context,amount: enteredAmount).then((success) {
  //                           if(success && ApiStatus.status == true && context.mounted){
  //                             if (context.mounted) {
  //                               Navigator.pop(context);
  //                               Utils.toastMessage("Recharge Successfully");
  //                             }
  //                           }
  //                         },);
  //                       }else{
  //                         Utils.toastMessage("Please enter Recharge Amount");
  //                       }
  //
  //                     },
  //                     style: ElevatedButton.styleFrom(
  //                       shape: RoundedRectangleBorder(
  //                         borderRadius: BorderRadius.circular(10), // Button border radius
  //                       ),
  //                       backgroundColor:AppColor.appColor,
  //                     ),
  //                     child:  Headings.txt13White("Submit", context),
  //                   ),
  //                 ],
  //               ),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  Widget rechargeButton(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          ApiStatus.isRecharge = true;
          print(ApiStatus.isRecharge);
        });
        // showAmountDialog(context);
      },
      child: Card(
        color: AppColor.appColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
          child: Column(
            children: [
              Text(
                "Recharge",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
