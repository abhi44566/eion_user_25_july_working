import 'package:driver_suvidha_user/screen/setting/web_view_screen.dart';
import 'package:driver_suvidha_user/utils/import.dart';
import 'package:flutter/cupertino.dart';
import 'package:driver_suvidha_user/import.dart';

class NeedDriverSheet extends StatefulWidget {
  final VoidCallback onTap;

  NeedDriverSheet({super.key, required this.onTap});
  @override
  _NeedDriverSheetState createState() => _NeedDriverSheetState();
}

class _NeedDriverSheetState extends State<NeedDriverSheet> {
  bool isSchedule = false;
  bool isNow = true;
  DateTime? selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    MyFontSize fontSize = MyFontSize(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Headings.txt20BlackBold("When do you need driver?", context),
        ),
        Headings.txt15Grey("Pickup time: 8 mins from now", context),
        isNow
            ? Image.asset(Images.shadule, height: fontSize.h / 4)
            : Column(
                children: [
                  Visibility(
                    visible: isSchedule,
                    child: Container(
                      height: 200, // Set height for the date picker
                      child: CupertinoDatePicker(
                        initialDateTime: selectedDate,
                        mode: CupertinoDatePickerMode.dateAndTime,
                        onDateTimeChanged: (DateTime newDate) {
                          setState(() {
                            selectedDate = newDate;
                          });
                        },
                        minimumDate: DateTime(2024, 7, 10),
                        maximumDate: DateTime(2025, 7, 10),
                      ),
                    ),
                  ),
                ],
              ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            shaduleButton(context, "Schedule", () {
              setState(() {
                isNow = false;
                isSchedule = true;
              });
            }, isSchedule ? AppColor.appColor : AppColor.lightGreyColor,
                isSchedule ? AppColor.lightGreyColor : Colors.transparent),
            shaduleButton(context, "Now", () {
              setState(() {
                isNow = true;
                isSchedule = false;
              });
            }, isNow ? AppColor.appColor : AppColor.lightGreyColor,
                isNow ? AppColor.lightGreyColor : Colors.transparent),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: CustomButton(
            onTap: widget.onTap,
            child: Headings.txt17WhiteBold(
                isNow ? "Set Pickup Time to Now" : "Set Pickup Time", context),
          ),
        ),
      ],
    );
  }
}

Future<void> needDriver(BuildContext context, void Function() onTap) {
  return showModalBottomSheet(
    context: context,
    builder: (context) {
      return NeedDriverSheet(onTap: onTap);
    },
  );
}

Widget shaduleButton(BuildContext context, String title, VoidCallback onTap,
    Color color, Color backgroundColor) {
  MyFontSize fontSize = MyFontSize(context);
  return InkWell(
    onTap: onTap,
    child: Container(
      width: fontSize.w / 2.5,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(color: AppColor.blackColor),
        ),
      ),
    ),
  );
}

Widget trackStatus({
  VoidCallback? TrackBOnTap,
  String? date,
  String? time,
  String? tripType,
  String? tripKm,
  String? tripHrs,
  String? status,
  String? bookingLavel,
  String? tripTypeImage,
  String? bookingId,
  required String OTP,
}) {
  return Builder(builder: (context) {
    MyFontSize fontSize = MyFontSize(context);
    return Container(
      // height:fontSize.h/3.6 ,
      width: fontSize.w,
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            height: fontSize.h * 0.03,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColor.primaryBackGround,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: fontSize.h * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Headings.txt13black(
                        "BOOKING STATUS #${bookingId}", context),
                    if (OTP != '')
                      Row(
                        children: [
                          Headings.txt13black("OTP :", context),
                          Headings.txt13black(" ${OTP}", context),
                        ],
                      )
                  ],
                ),
                SizedBox(height: fontSize.h * 0.01),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.lightGreyColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Headings.txt17BlackBold(
                                      "$bookingLavel", context),
                                  Headings.txt12grey("$date, $time", context),
                                ],
                              ),
                              Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 1),
                                  decoration: BoxDecoration(
                                    color: AppColor.appColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    children: [
                                      if (status == '0')
                                        Headings.txt13White("Pending", context),
                                      if (status == '1')
                                        Headings.txt13White(
                                            "Confirmed", context),
                                      if (status == '2')
                                        Headings.txt13White(
                                            "On the way", context),
                                      if (status == '3')
                                        Headings.txt13White("Reached", context),
                                      if (status == '4')
                                        Headings.txt13White("Started", context),
                                      if (status == '5')
                                        Headings.txt13White(
                                            "Completed", context),
                                      if (status == '6')
                                        Headings.txt13White(
                                            "Cancelled", context),
                                    ],
                                  )),
                            ]),
                      ),
                      SizedBox(height: fontSize.h * 0.01),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.network(tripTypeImage ?? '', height: 26),
                                Headings.txt13black(tripType ?? '', context)
                              ],
                            ),
                            // statusWidget(" $tripType", Images.auto, context),
                            statusWidget(" $tripKm", Images.routing, context),
                            statusWidget(" $tripHrs", Images.clock, context),
                          ],
                        ),
                      ),
                      SizedBox(height: fontSize.h * 0.01),
                      if (status == '0')
                        Image.asset("assets/searching2.gif", height: 50),
                      if (status == '6') Icon(Icons.search),
                      InkWell(
                        onTap: TrackBOnTap,
                        child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              color: AppColor.primaryBackGround,
                              borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                            ),
                            child: Center(
                                child: Column(
                              children: [
                                //if (status == '0')
                                Headings.txt17BlackBold("Go To Ride", context)
                                // else Headings.txt17BlackBold( "Track status", context),
                              ],
                            ))),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  });
}

Widget statusWidget(String title, String icon, BuildContext context) {
  return Row(
    children: [
      Image.asset(icon, height: 26),
      Headings.txt13black(title, context)
    ],
  );
}

class CancelRide extends StatelessWidget {
  final String title = "Mumbai, Maharashtra, India";
  VoidCallback cancelRideButton;
  CancelRide({super.key, required this.cancelRideButton});

  @override
  Widget build(BuildContext context) {
    MyFontSize fontSize = MyFontSize(context);
    return Container(
      width: fontSize.w,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Headings.txt20BlackBold("One Way", context),
          Headings.txt15black400("Hatchback", context),
          SizedBox(height: fontSize.h * 0.02),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColor.lightGreyColor)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    rowTxt(Images.clock, "Start in", context),
                    Headings.txt13grey("10:15", context),
                  ],
                ),
                Divider(
                  color: AppColor.lightGreyColor,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      rowTxt(Images.profileCircle, "Driver Name", context),
                      Headings.txt13grey("Chandrasekhar reddy", context),
                    ]),
                Divider(color: AppColor.lightGreyColor),
                Row(
                  children: [
                    Icon(Icons.location_on_sharp, color: AppColor.appColor),
                    Headings.txt13black(title, context)
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: fontSize.h * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              rowButton(() {}, Images.call, "Call to Driver", context),
              rowButton(() {}, Images.otp, "Start Otp 4543", context),
            ],
          ),
          SizedBox(height: fontSize.h * 0.01),
          InkWell(
              onTap: cancelRideButton, child: Image.asset(Images.cancelButton))
        ],
      ),
    );
  }

  Widget rowTxt(String icon, String title, BuildContext context) {
    return Row(
      children: [
        Image.asset(
          icon,
          color: AppColor.appColor,
          height: 24,
        ),
        const SizedBox(width: 5),
        Headings.txt13black(title, context)
      ],
    );
  }

  Widget rowButton(
      VoidCallback onTap, String icon, String title, BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
            border: Border.all(color: AppColor.lightGreyColor),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Image.asset(icon, height: 24),
            const SizedBox(width: 5),
            Headings.txt13black(title, context)
          ],
        ),
      ),
    );
  }
}

void showFlexyDialog(BuildContext context,
    {String? vahicalName,
    String? estDis,
    String? estDuration,
    String? baseFare,
    String? kmCharge,
    String? totalAmt,
    String? durationCrg,
    String? discount,
    String? gstAmt,
    String? netPay,
    String? surgeCharge,
    String? vahicleImge}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: AppColor.whiteColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Container(
          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
          decoration: BoxDecoration(
            color: AppColor.appColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                vahicleImge ?? "",
                height: 30,
              ),
              Text(
                vahicalName ?? '',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ],
          ),
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Headings.txt15black400("Est. Distance: ", context),
                Headings.txt13grey(estDis ?? '', context)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Headings.txt15black400("Est. Duration: ", context),
                Headings.txt13grey('${estDuration}', context)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Headings.txt15black400("Base Fare: ", context),
                Headings.txt13grey('₹${baseFare}', context)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Headings.txt15black400("KM Charge: ", context),
                Headings.txt13grey('₹${kmCharge}', context)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Headings.txt15black400("Duration Charge: ", context),
                Headings.txt13grey('₹${durationCrg}', context)
              ],
            ),
            if (surgeCharge != '0' && surgeCharge != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Headings.txt15black400("Surge Charge: ", context),
                  Headings.txt13grey('₹${surgeCharge}', context)
                ],
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Headings.txt15black400("Total Amt: ", context),
                Headings.txt13grey('₹${totalAmt}', context)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Headings.txt15black400("Discount: ", context),
                Headings.txt13grey('₹${discount}', context)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Headings.txt15black400("FR & Taxes: ", context),
                Headings.txt13grey('₹${gstAmt}', context)
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Headings.txt17BlackBold("Net Pay: ", context),
                Headings.txt17BlackBold('₹${netPay}', context),
              ],
            ),
            Divider(),
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                width: 1,
                color: AppColor.blueColor,
              ))),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WebView(
                              url:
                                  '${Provider.of<BaseUrlViewModel>(context, listen: false).barFee?.response?.t8xqyt ?? ""}',
                              title: 'Rates T&C')));
                },
                child: Text(
                  'Rates T&C',
                  style: GoogleFonts.nunito(
                    textStyle: TextStyle(
                      color: AppColor.blueColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),

        // Action Buttons
        // actions: [
        //   // Cancel Button
        //   TextButton(
        //     onPressed: () {
        //       Navigator.of(context).pop();
        //     },
        //     child: Text("Cancel", style: TextStyle(color: Colors.red)),
        //   ),
        //
        //   // Save Button
        //   ElevatedButton(
        //     onPressed: () {
        //
        //     },
        //     child: Text("Save"),
        //   ),
        // ],
      );
    },
  );
}

void showRentalDialog(BuildContext context,
    {String? baseFare,
    String? vahicalName,
    String? estDis,
    String? estDuration,
    String? kmCharge,
    String? totalAmt,
    String? discount,
    String? gstAmt,
    String? netPay,
    String? vahicleImge,
    String? extraPerKMCharge,
    String? extraPerMinCharge,
    String? surgeCharge,
    String? planLabel}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: AppColor.whiteColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Container(
          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
          decoration: BoxDecoration(
            color: AppColor.appColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                vahicleImge ?? '',
                height: 30,
              ),
              Text(
                vahicalName ?? '',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ],
          ),
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Headings.txt15black400("Est. Distance: ", context),
                Headings.txt13grey(estDis ?? '', context)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Headings.txt15black400("Est. Duration: ", context),
                Headings.txt13grey('${estDuration}', context)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Headings.txt15black400("Base Fare: ", context),
                    Text(
                      "($planLabel)",
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
                Headings.txt13grey('₹${baseFare}', context)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Headings.txt15black400("Extra km : ", context),
                    Text('(${extraPerKMCharge})',
                        style: TextStyle(fontSize: 10))
                  ],
                ),
                Headings.txt13grey(kmCharge ?? '', context)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Headings.txt15black400("Extra minut charge : ", context),
                    Text(
                      '(${extraPerMinCharge})',
                      style: TextStyle(fontSize: 10),
                    )
                  ],
                ),
                Headings.txt13grey('₹${kmCharge}', context)
              ],
            ),
            if (surgeCharge != '0')
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Headings.txt15black400("Night Charge: ", context),
                  Headings.txt13grey('₹${surgeCharge}', context)
                ],
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Headings.txt15black400("Total Amt: ", context),
                Headings.txt13grey('₹${totalAmt}', context)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Headings.txt15black400("Discount: ", context),
                Headings.txt13grey('₹${discount}', context)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Headings.txt15black400("FR & Taxes: ", context),
                Headings.txt13grey('₹${gstAmt}', context)
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Headings.txt17BlackBold("Net Pay: ", context),
                Headings.txt17BlackBold('₹${netPay}', context),
              ],
            ),
            Divider(),
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                width: 1,
                color: AppColor.blueColor,
              ))),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WebView(
                              url:
                                  '${Provider.of<BaseUrlViewModel>(context, listen: false).barFee?.response?.t8xqyt ?? ""}',
                              title: 'Rates T&C')));
                },
                child: Text(
                  'Rates T&C',
                  style: GoogleFonts.nunito(
                    textStyle: TextStyle(
                      color: AppColor.blueColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    },
  );
}

void showOutstationDialog(
  BuildContext context, {
  String? baseFare,
  String? driverAllowance,
  String? nightCharge,
  String? perNightCharge,
  String? extraKmCharge,
  String? extraPerKm,
  String? extraHrsCharge,
  String? extraPerHrsCharge,
  String? vahicalName,
  String? estDis,
  String? estDuration,
  String? kmCharge,
  String? totalAmt,
  String? durationCrg,
  String? discount,
  String? gstAmt,
  String? netPay,
  String? vahicleImge,
  String? extraPerKMCharge,
  String? planLabel,
  String? tripType,
  String? durationLabel,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: AppColor.whiteColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
            decoration: BoxDecoration(
              color: AppColor.appColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  Image.network(
                    vahicleImge ?? '',
                    height: 30,
                  ),
                  Text(
                    vahicalName ?? '',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ]),
                Row(
                  children: [
                    Text(
                      'Outstation',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    SizedBox(width: 2),
                    Container(
                      height: 18,
                      width: 2,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 2),
                    Text(
                      tripType ?? '',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ],
            )),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Headings.txt15black400("Ride Distance: ", context),
                Headings.txt13grey("${estDis ?? ''}", context)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Headings.txt15black400("Ride Duration: ", context),
                Headings.txt13grey('$durationLabel', context)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Headings.txt15black400("Base Fare: ", context),
                    Text(
                      "($planLabel)",
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
                Headings.txt13grey('₹${baseFare}', context)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Headings.txt15black400("Driver allowance : ", context),
                Headings.txt13grey(driverAllowance ?? '', context)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Headings.txt15black400("Night charge : ", context),
                    Text('(${nightCharge})', style: TextStyle(fontSize: 10))
                  ],
                ),
                Headings.txt13grey(perNightCharge ?? '', context)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Headings.txt15black400("Extra km Charge: ", context),
                    Text('(${extraPerKMCharge})',
                        style: TextStyle(fontSize: 10))
                  ],
                ),
                Headings.txt13grey(kmCharge ?? '', context)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Headings.txt15black400("Extra Hrs.Charge: ", context),
                    Text('(${extraPerHrsCharge})',
                        style: TextStyle(fontSize: 10))
                  ],
                ),
                Headings.txt13grey('${extraHrsCharge}', context)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Headings.txt15black400("Total Amt: ", context),
                Headings.txt13grey('₹${totalAmt}', context)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Headings.txt15black400("Discount: ", context),
                Headings.txt13grey('₹${discount}', context)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Headings.txt15black400("FR & Taxes: ", context),
                Headings.txt13grey('₹${gstAmt}', context)
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Headings.txt17BlackBold("Net Pay: ", context),
                Headings.txt17BlackBold('₹${netPay}', context),
              ],
            ),
            Divider(),
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                width: 1,
                color: AppColor.blueColor,
              ))),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WebView(
                              url:
                                  '${Provider.of<BaseUrlViewModel>(context, listen: false).barFee?.response?.t8xqyt ?? ""}',
                              title: 'Rates T&C')));
                },
                child: Text(
                  'Rates T&C',
                  style: GoogleFonts.nunito(
                    textStyle: TextStyle(
                      color: AppColor.blueColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    },
  );
}

Widget dateWidget(VoidCallback onTap, String date) {
  return Builder(builder: (context) {
    return Row(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColor.lightGreyColor)),
            child: Center(
              child: Image.asset(Images.calendar, height: 30),
            ),
          ),
        ),
        const SizedBox(width: 5),
        Container(
          width: MediaQuery.of(context).size.width * 0.3,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColor.lightGreyColor)),
          child: Center(child: Headings.txt13grey(date, context)),
        )
      ],
    );
  });
}

Widget selectLocationWidget(
    {String? image, String? title, VoidCallback? onTap}) {
  return Builder(builder: (context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColor.lightGreyColor)),
        child: Row(
          children: [
            Image.asset(image.toString(), height: 30),
            const SizedBox(width: 5),
            SizedBox(
                width: MediaQuery.of(context).size.width / 1.35,
                child: Headings.txt13grey(title.toString(), context)),
          ],
        ),
      ),
    );
  });
}

Widget searchingForDriverWidget({
  String? typeMsg,
  String? msg2,
  required VoidCallback cancelButton,
}) {
  return Builder(builder: (context) {
    MyFontSize fontSize = MyFontSize(context);
    return Center(
      child: Container(
        width: fontSize.w,
        height: fontSize.h / 2.9,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColor.whiteColor,
            border: Border.all(color: AppColor.lightGreyColor)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Headings.txt16black(typeMsg ?? "", context),
            Image.asset("assets/searching2.gif", height: 100),
            Headings.txt16black(msg2 ?? '', context),
            SizedBox(height: fontSize.h * 0.03),
            Row(
              children: [
                // Expanded(child: CustomButton(
                //     onTap:listNowButton, child: Headings.txt15white("List Now", context))),
                SizedBox(width: fontSize.w * 0.02),
                Expanded(
                    child: CustomButton(
                        backGroundColor: Colors.redAccent,
                        onTap: cancelButton,
                        child: Headings.txt15white("Cancel", context)))
              ],
            )
          ],
        ),
      ),
    );
  });
}

void showCancelConfirmationDialog(
    BuildContext context, VoidCallback? CancelButton) {
  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Text("Cancel Ride"),
        content: Text("Are you sure you want to cancel this ride?"),
        actions: [
          TextButton(
            child: Text("No", style: TextStyle(color: Colors.red)),
            onPressed: () {
              Navigator.pop(dialogContext); // close dialog
            },
          ),
          TextButton(
            child: Text("Yes", style: TextStyle(color: AppColor.appColor)),
            onPressed: CancelButton,
          ),
        ],
      );
    },
  );
}
