import 'package:driver_suvidha_user/assets.dart';
import 'package:driver_suvidha_user/screen/map_screen/provider/home_page_view_model.dart';
import 'package:driver_suvidha_user/screen/payment/payment_screen.dart';
import 'package:driver_suvidha_user/screen/setting/provider/view_model/order_history_view_model.dart';
import 'package:driver_suvidha_user/utils/app_color.dart';
import 'package:driver_suvidha_user/utils/button.dart';
import 'package:driver_suvidha_user/utils/feedback_widget.dart';
import 'package:driver_suvidha_user/utils/headings.dart';
import 'package:driver_suvidha_user/utils/import.dart';
import 'package:driver_suvidha_user/utils/network_image.dart';
import 'package:driver_suvidha_user/utils/order_step.dart';
import 'package:driver_suvidha_user/utils/size_utils.dart';
import 'package:provider/provider.dart';

import '../../map_screen/widgets.dart';

class BookingHistory extends StatefulWidget {
  final bookingId;
  BookingHistory({super.key, required this.bookingId});

  @override
  State<BookingHistory> createState() => _BookingHistoryState();
}

class _BookingHistoryState extends State<BookingHistory> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () {
        Provider.of<OrderHistoryViewModel>(context, listen: false)
            .getOrderHistoryDetail(context,
                bookingId: widget.bookingId.toString());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    MyFontSize fontSize = MyFontSize(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: AppColor.whiteColor,
          ),
        ),
        title: Headings.txt17WhiteBold("Booking History", context),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Consumer<OrderHistoryViewModel>(
            builder: (context, value, child) {
              final getHistoryDetail =
                  value.getHistoryDetailRes?.response?.historyList?.first;
              return Container(
                  color: AppColor.primaryBackGround,
                  width: fontSize.w,
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            color: AppColor.whiteColor,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      Images.greenDot,
                                      height: fontSize.h / 27,
                                    ),
                                    SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Headings.txt12green("PickUp", context),
                                        SizedBox(
                                            width: fontSize.w / 1.2,
                                            child: Headings.txt13black(getHistoryDetail?.orgFromGpsLocation ?? '', context)),
                                      ],
                                    )
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 3, horizontal: 38),
                                  height: 1,
                                  width: fontSize.w,
                                  color: AppColor.lightGreyColor,
                                ),
                                Row(
                                  children: [
                                    Image.asset(Images.redDot, height: fontSize.h * 0.03),
                                    SizedBox(width: 10),
                                    SizedBox(
                                      width: fontSize.w / 1.2,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Headings.txt12Red("Destination", context),
                                          Headings.txt13black(getHistoryDetail?.orgToGpsLocation ?? '', context),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: fontSize.h * 0.01),
                          Container(
                            color: AppColor.whiteColor,
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Headings.txt13black("RIDE DETAIL", context),
                                SizedBox(height: fontSize.h * 0.01),
                                rowTxt("Booking Id:", '#${getHistoryDetail?.bookingId ?? ''}', context),
                                rowTxt("Ride Type:", '${getHistoryDetail?.bookingType == 'Flexy' ? 'Flexi' : getHistoryDetail?.bookingType} | ${getHistoryDetail?.tripType == 'One way' ? 'Oneway' : getHistoryDetail?.tripType}', context),
                                rowTxt("Car Type:", getHistoryDetail?.vehicleTypeName ?? '', context),
                                if (getHistoryDetail?.planName != '')
                                  rowTxt("No of hours:", getHistoryDetail?.planName ?? '', context),
                                rowTxt("Date & Time:", getHistoryDetail?.pickupDateTime ?? '', context),
                                rowTxt("Booked For:", '(${getHistoryDetail?.bookedFor ?? ''} - ${getHistoryDetail?.bookedForName ?? ''} - ${getHistoryDetail?.bookedForMobileNumber ?? ''})',
                                    context),
                                if (getHistoryDetail?.ratingStatus == '0')
                                  InkWell(
                                    borderRadius: BorderRadius.circular(20),
                                    onTap: () {

                                      showRatingSheet(context,
                                          bookingId:  getHistoryDetail!.bookingId.toString(),
                                          driverMo: getHistoryDetail.driverMobileNumber??"",
                                          driverName: getHistoryDetail.driverName??"",
                                          driverPhoto: getHistoryDetail.driverPhoto??"",
                                      );
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 3),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: AppColor.appColor),
                                      child: Headings.txt15white('Rate Now', context),
                                    ),
                                  )
                                else
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Headings.txt13blackBold('Rating : ${getHistoryDetail?.starRating}', context),
                                      Headings.txt13blackBold('Rating Remark : ${getHistoryDetail?.ratingRemark}', context),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                          SizedBox(height: fontSize.h * 0.01),
                          if (getHistoryDetail?.bookingType == "Flexy")
                            Container(
                              padding: EdgeInsets.all(10),
                              color: AppColor.whiteColor,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Headings.txt13black("PAYMENT", context),
                                  rowTxt("Base Fare:", "₹${getHistoryDetail?.baseFare ?? ''}", context),
                                  if (getHistoryDetail?.actualExtraKmCharges != '0')
                                    rowTxt("KM Charges (₹${getHistoryDetail?.extraPerKmCharge ?? ''}/Kms):", "₹${getHistoryDetail?.actualExtraKmCharges ?? ''}", context),
                                  rowTxt("Duration Charge:", "₹${getHistoryDetail?.actualDurationCharge ?? ''}", context),
                                  if (getHistoryDetail?.surgeCharge != '0')
                                    rowTxt("Surge Charge:", "₹${getHistoryDetail?.surgeCharge ?? ''}", context),
                                  if (getHistoryDetail?.discountAmt != '0')
                                    rowTxt("Discount:", "₹${getHistoryDetail?.discountAmt ?? ''}", context),
                                  rowTxt("FR & Taxes:", "₹${getHistoryDetail?.gstAmt ?? ''}", context),
                                  rowTxt("Total Amt:", "₹${getHistoryDetail?.netPayment ?? ''}", context),
                                  rowTxt("Remaining Amt:", "₹${getHistoryDetail?.skipForPay ?? ''}", context),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Headings.txt13black("Payment Mode:", context),
                                      Row(
                                        children: [
                                          Headings.txt13black('${getHistoryDetail?.paymentMode ?? ''}', context),
                                        ],
                                      )
                                    ],
                                  ),
                                  Divider(),
                                  if (getHistoryDetail!.driverId!.isNotEmpty && getHistoryDetail.driverId != '0')
                                    Row(
                                      children: [
                                        CustomNetworkProfileImage(
                                            height: 50,
                                            width: 50,
                                            image: getHistoryDetail.driverPhoto ?? ''),
                                        SizedBox(width: 5),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Headings.txt13black('${getHistoryDetail.driverName ?? ''}', context),
                                            if (getHistoryDetail.bookingStatus != '5' && getHistoryDetail.bookingStatus != '6')
                                              Headings.txt13black('${getHistoryDetail.driverMobileNumber ?? ''}', context),
                                          ],
                                        )
                                      ],
                                    )
                                ],
                              ),
                            ),
                          if (getHistoryDetail?.bookingType == "Rental")
                            Container(
                              padding: EdgeInsets.all(10),
                              color: AppColor.whiteColor,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Headings.txt13black("PAYMENT", context),
                                  rowTxt("Base Fare:", "₹${getHistoryDetail?.baseFare ?? ''}", context),
                                  rowTxt("Extra Km Charges: (₹${getHistoryDetail?.extraPerKmCharge ?? ''}/Kms)", "₹${getHistoryDetail?.actualExtraKmCharges ?? ''}", context),
                                  rowTxt("Extra Duration Charges:", "₹${getHistoryDetail?.extraPerHourMinCharge ?? ''}", context),
                                  if (getHistoryDetail?.discountAmt != '0')
                                    rowTxt("Discount:", "₹${getHistoryDetail?.discountAmt ?? ''}", context),
                                  if (getHistoryDetail?.surgeCharge != '0')
                                    rowTxt("Night Charge:", "₹${getHistoryDetail?.surgeCharge ?? ''}", context),
                                  rowTxt("FR & Taxes:", "₹${getHistoryDetail?.gstAmt ?? ''}", context),
                                  rowTxt("Net Amount:", "₹${getHistoryDetail?.netPayment ?? ''}", context),
                                  rowTxt("Remaining Amt:", "₹${getHistoryDetail?.skipForPay ?? ''}", context),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Headings.txt13black("Payment Mode:", context),
                                      Row(
                                        children: [
                                          Headings.txt13black('${getHistoryDetail?.paymentMode ?? ''} Pay', context),
                                        ],
                                      )
                                    ],
                                  ),
                                  Divider(),
                                  if (getHistoryDetail!.driverId!.isNotEmpty &&
                                      getHistoryDetail.driverId != '0')
                                    Row(
                                      children: [
                                        CustomNetworkProfileImage(
                                            height: 50,
                                            width: 50,
                                            image: getHistoryDetail.driverPhoto ?? ''),
                                        SizedBox(width: 5),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Headings.txt13black('${getHistoryDetail.driverName ?? ''}', context),
                                            if (getHistoryDetail.bookingStatus != '5' && getHistoryDetail.bookingStatus != '6')
                                              Headings.txt13black('${getHistoryDetail.driverMobileNumber ?? ''}', context),
                                          ],
                                        )
                                      ],
                                    )
                                ],
                              ),
                            ),
                          if (getHistoryDetail?.bookingType == "Outstation")
                            Container(
                              padding: EdgeInsets.all(10),
                              color: AppColor.whiteColor,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Headings.txt13black("PAYMENT", context),
                                  rowTxt("Base Fare:", "₹${getHistoryDetail?.baseFare ?? ''}", context),
                                  rowTxt("Driver allowance:", "₹${getHistoryDetail?.fixDriverAllowance ?? ''}", context),
                                  rowTxt("Night Charge (${getHistoryDetail?.actualNights ?? ''} Nights):", "₹${getHistoryDetail?.actualNightCharges ?? ''}", context),
                                  rowTxt("Extra Km Charges: (₹${getHistoryDetail?.extraPerKmCharge ?? ''}/Kms)", "₹${getHistoryDetail?.actualExtraKmCharges ?? ''}", context),
                                  rowTxt("Extra Duration Charges:", "₹${getHistoryDetail?.actualDurationCharge ?? ''}", context),
                                  if (getHistoryDetail?.surgeCharge != '0')
                                    rowTxt("Surge Charge:", "₹${getHistoryDetail?.surgeCharge ?? ''}", context),
                                  if (getHistoryDetail?.discountAmt != '0')
                                    rowTxt("Discount:", "₹${getHistoryDetail?.discountAmt ?? ''}", context),
                                  rowTxt("FR & Taxes:", "₹${getHistoryDetail?.gstAmt ?? ''}", context),
                                  rowTxt("Net Amount:", "₹${getHistoryDetail?.netPayment ?? ''}", context),
                                  rowTxt("Remaining Amt:", "₹${getHistoryDetail?.skipForPay ?? ''}", context),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Headings.txt13black("Payment Mode:", context),
                                      Row(
                                        children: [
                                          Headings.txt13black(" ${getHistoryDetail?.paymentMode ?? ''} Pay", context),
                                        ],
                                      )
                                    ],
                                  ),
                                  Divider(),
                                  if (getHistoryDetail?.bookingStatus != "0")
                                    Row(
                                      children: [
                                        CustomNetworkProfileImage(
                                            height: 50,
                                            width: 50,
                                            image: getHistoryDetail?.driverPhoto ?? ''),
                                        SizedBox(width: 5),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Headings.txt13black('${getHistoryDetail?.driverName ?? ''}', context),
                                            if (getHistoryDetail?.bookingStatus != '5' && getHistoryDetail?.bookingStatus != '6')
                                              Headings.txt13black('${getHistoryDetail?.driverMobileNumber ?? ''}', context),
                                          ],
                                        )
                                      ],
                                    )
                                ],
                              ),
                            ),
                          SizedBox(height: 5),
                          OrderStatusPage(currentStep: int.tryParse(getHistoryDetail?.bookingStatus ?? '') ?? 0,),
                          SizedBox(height: 5),
                          if (getHistoryDetail?.bookingStatus == "5")
                            if (getHistoryDetail?.skipForPay != '0')
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: CustomButton(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>PaymentScreen( bookingId:getHistoryDetail?.bookingId ??'')));
                                    },
                                    child: Headings.txt17WhiteBold("Pay Online", context)),
                              ),
                          SizedBox(height: 5),
                          if (['0', '1', '2'].contains(getHistoryDetail?.bookingStatus))
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: CustomButton(
                                  backGroundColor: AppColor.redColor,
                                  onTap: () {
                                    showCancelConfirmationDialog(
                                      context,
                                      () async {
                                        Navigator.pop(context);
                                        Provider.of<HomePageViewModel>(context, listen: false)
                                            .canceledBookingApi(context, bookingId: getHistoryDetail?.bookingId ?? "").then((value) {
                                          Provider.of<OrderHistoryViewModel>(context, listen: false).getOrderHistory(context, type: "Upcoming");
                                          Provider.of<OrderHistoryViewModel>(context, listen: false).
                                          getOrderHistoryDetail(context, bookingId: getHistoryDetail?.bookingId.toString());
                                        });
                                      },
                                    );
                                  },
                                  child: Headings.txt17WhiteBold("Cancel", context)),
                            ),
                          SizedBox(height: 5),
                        ]),
                  ));
            },
          )
        ],
      ),
    );
  }

  Widget rowTxt(String leading, String suffix, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Headings.txt13black(leading, context),
          Headings.txt13black(suffix, context)
        ],
      ),
    );
  }
}
