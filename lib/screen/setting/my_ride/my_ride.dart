import 'package:driver_suvidha_user/assets.dart';
import 'package:driver_suvidha_user/screen/map_screen/navigate_map_screen.dart';
import 'package:driver_suvidha_user/screen/setting/my_ride/booking_history.dart';
import 'package:driver_suvidha_user/screen/setting/provider/view_model/order_history_view_model.dart';
import 'package:driver_suvidha_user/utils/app_color.dart';
import 'package:driver_suvidha_user/utils/feedback_widget.dart';
import 'package:driver_suvidha_user/utils/headings.dart';
import 'package:driver_suvidha_user/utils/progress_bar.dart';
import 'package:driver_suvidha_user/utils/size_utils.dart';
import 'package:driver_suvidha_user/utils/widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyRideScreen extends StatefulWidget {
  const MyRideScreen({super.key});
  @override
  State<MyRideScreen> createState() => _MyRideScreenState();
}

class _MyRideScreenState extends State<MyRideScreen>
    with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    tabController.index = 0;
    Future.microtask(() => fetchData());
  }

  void fetchData({String? type}) {
    Provider.of<OrderHistoryViewModel>(context, listen: false).getOrderHistory(context, type: type ?? "Upcoming");

  }

  @override
  Widget build(BuildContext context) {
    MyFontSize fontSize = MyFontSize(context);
    return Scaffold(
        backgroundColor: AppColor.primaryBackGround,
        body: Consumer<OrderHistoryViewModel>(
          builder: (context, value, child) {
            final getHistory = value.getOrderHistoryRes?.response;

            return Stack(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(top: fontSize.h / 6),
                    child: (getHistory?.historyList?.isEmpty ?? true)
                        ? Padding(
                            padding: EdgeInsets.only(top: fontSize.h / 3.5),
                            child:
                                Center(child: Image.asset("assets/empty.gif")))
                        : Column(
                            children: List.generate(
                            getHistory?.historyList?.length ?? 0,
                            (index) {
                              final getGetHISList =
                                  getHistory?.historyList?[index];
                              print('-------------------->${getGetHISList?.ratingStatus}');

                              return InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => BookingHistory(
                                              bookingId:
                                                  getGetHISList?.bookingId ??
                                                      '')));
                                },
                                child: Container(
                                    margin: EdgeInsets.only(bottom: 10),
                                    color: AppColor.whiteColor,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: fontSize.h * 0.01),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Flexible(
                                                child: Headings.txt13black(
                                                    "${getGetHISList?.bookingType == "Flexy" ? "Flexi" : getGetHISList?.bookingType} | ${getGetHISList?.tripType == "One way" ? 'Oneway' : getGetHISList?.tripType} | ${getGetHISList?.vehicleTypeName ?? ''} | #${getGetHISList?.bookingId ?? ''}",
                                                    context),
                                              ),
                                              Flexible(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5),
                                                  child: Headings.txt17BlackBold(
                                                      "₹${getGetHISList?.skipForPay ?? ''}",
                                                      context,
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: fontSize.h * 0.01),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Headings.txt13black(
                                                  getGetHISList
                                                          ?.pickupDateTime ??
                                                      '',
                                                  context),
                                              Row(
                                                children: [
                                                  Image.asset(Images.cash,
                                                      height:
                                                          fontSize.h * 0.03),
                                                  Headings.txt17BlackBold(
                                                      " ${getGetHISList?.paymentMode ?? ''}",
                                                      context),
                                                ],
                                              )
                                            ],
                                          ),
                                          SizedBox(height: fontSize.h * 0.01),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                        vertical: 3),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: AppColor.appColor),
                                                child: Row(
                                                  children: [
                                                    if (getGetHISList
                                                            ?.bookingType ==
                                                        'Flexy')
                                                      Headings.txt12White(
                                                          "Flexi", context)
                                                    else
                                                      Headings.txt12White(
                                                          "${getGetHISList?.bookingType ?? ''}",
                                                          context),
                                                    if (getGetHISList
                                                            ?.planName !=
                                                        '')
                                                      Headings.txt12White(
                                                          " | ${getGetHISList?.planName ?? ''}",
                                                          context),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                  width: fontSize.w * 0.02),
                                              Text(
                                                'OTP: ${getGetHISList?.startOtp ?? ''}',
                                                style: GoogleFonts.nunito(
                                                  textStyle: TextStyle(
                                                    color: AppColor.greenColor,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Divider(
                                              color: AppColor.lightGreyColor),
                                          Row(
                                            children: [
                                              Image.asset(Images.greenDot,
                                                  height: fontSize.h * 0.03),
                                              SizedBox(
                                                  width: fontSize.w * 0.02),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Headings.txt12green(
                                                      "Pickup", context),
                                                  SizedBox(
                                                      width: fontSize.w / 1.3,
                                                      child: Headings.txt16black(
                                                          getGetHISList
                                                                  ?.orgFromGpsLocation ??
                                                              '',
                                                          context)),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: fontSize.h * 0.01),
                                          Row(
                                            children: [
                                              Image.asset(Images.redDot,
                                                  height: fontSize.h * 0.03),
                                              SizedBox(
                                                  width: fontSize.w * 0.02),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Headings.txt12Red(
                                                      "Drop", context),
                                                  SizedBox(
                                                      width: fontSize.w / 1.3,
                                                      child: Headings.txt16black(
                                                          getGetHISList
                                                                  ?.orgToGpsLocation ??
                                                              '',
                                                          context)),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Divider(
                                              color: AppColor.lightGreyColor),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Image.asset(Images.pearsion1,
                                                      height:
                                                          fontSize.h * 0.03),
                                                  SizedBox(
                                                      width: fontSize.w * 0.02),
                                                  Headings.txt22Black600(
                                                      getGetHISList
                                                                  ?.bookingStatus ==
                                                              "0"
                                                          ? 'Status: Placed'
                                                          : false ||
                                                                  getGetHISList
                                                                          ?.bookingStatus ==
                                                                      "1"
                                                              ? 'Driver Confirmed'
                                                              : false ||
                                                                      getGetHISList
                                                                              ?.bookingStatus ==
                                                                          "2"
                                                                  ? 'Driver on the way'
                                                                  : false ||
                                                                          getGetHISList?.bookingStatus ==
                                                                              "3"
                                                                      ? 'Driver Reached at pickup'
                                                                      : false ||
                                                                              getGetHISList?.bookingStatus == "4"
                                                                          ? 'Ride Started'
                                                                          : false || getGetHISList?.bookingStatus == "5"
                                                                              ? 'Ride Completed'
                                                                              : false || getGetHISList?.bookingStatus == "6"
                                                                                  ? 'Ride Cancelled'
                                                                                  : '',
                                                      context),
                                                ],
                                              ),
                                              if (getGetHISList?.bookingStatus == "5")
                                                if (getGetHISList?.ratingStatus == '0')
                                                  InkWell(borderRadius: BorderRadius.circular(20),
                                                    onTap: () {
                                                      showRatingSheet(context,bookingId: getGetHISList?.bookingId??'',
                                                      driverPhoto: getGetHISList?.driverPhoto??"",
                                                        driverName: getGetHISList?.driverName??'',
                                                        driverMo: getGetHISList?.driverMobileNumber??'',
                                                      );
                                                    },
                                                    child: Container(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 10,
                                                          vertical: 3),
                                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                                                          color: AppColor.appColor),
                                                      child: Headings.txt15white('Rate Now', context),
                                                    ),
                                                  )
                                                else
                                                  Headings.txt13blackBold(
                                                      'Rating : ${getGetHISList?.starRating}',
                                                      context),
                                              //track
                                              if (getGetHISList?.bookingStatus == "2" ||
                                                  getGetHISList
                                                          ?.bookingStatus ==
                                                      "3" ||
                                                  getGetHISList
                                                          ?.bookingStatus ==
                                                      "4")
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                NavigateMapScreen(
                                                                    isRide:
                                                                        true,
                                                                    bookingId:
                                                                        getGetHISList?.bookingId ??
                                                                            '')));
                                                  },
                                                  child: Container(
                                                    padding: EdgeInsets.all(3),
                                                    decoration: BoxDecoration(
                                                        color:
                                                            AppColor.appColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: Headings.txt15white(
                                                        "TRACK", context),
                                                  ),
                                                )
                                            ],
                                          ),
                                        ],
                                      ),
                                    )),
                              );
                            },
                          )),
                  ),
                ),
                Container(
                 height: fontSize.h/6.3,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  color: AppColor.whiteColor,
                  child: Column(
                    children: [
                      SizedBox(height: fontSize.h * 0.05),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          arrowBackButton(),
                          Headings.txt22BlackBold("My Ride", context)
                        ],
                      ),
                      SizedBox(height: fontSize.h * 0.02),
                      Container(
                       height: fontSize.h * 0.05,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: AppColor.lightGreyColor)),
                        child: TabBar(

                            controller: tabController,
                            indicatorSize: TabBarIndicatorSize.tab,
                            automaticIndicatorColorAdjustment: true,
                            dividerColor: Colors.transparent,
                            labelColor: AppColor.whiteColor,
                            unselectedLabelColor: AppColor.blackColor,
                            indicator: BoxDecoration(
                              color: AppColor.appColor,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: AppColor.appColor),
                            ),
                            onTap: (value) {
                              print(value);
                              if (value == 0) {
                                fetchData(type: "Upcoming");
                              } else if (value == 1) {
                                fetchData(type: "Completed");
                              } else {
                                fetchData(type: "Canceled");
                              }
                            },
                            tabs:  [
                              Tab(

                                text: "Upcoming",
                              ),
                              Tab(

                                text: "Completed",
                              ),
                              Tab(

                                text: "Cancelled",
                              ),
                            ]),
                      ),
                    ],
                  ),
                ),
                value.isLoading
                    ? Center(child: CustomProgressBar())
                    : SizedBox()
              ],
            );
          },
        ));
  }
}
