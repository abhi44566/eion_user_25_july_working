import 'package:driver_suvidha_user/import.dart';
import 'package:driver_suvidha_user/provider/data/checkStatus.dart';
import 'package:driver_suvidha_user/provider/utils/utils.dart';
import 'package:driver_suvidha_user/screen/map_screen/provider/home_page_view_model.dart';
import 'package:provider/provider.dart';

class Header extends StatefulWidget {
  final void Function()? onTap;
  final String? title;
  final bool? isFev;
  final Widget? onTapFev;
  Header({super.key, this.onTap, this.title, this.isFev, this.onTapFev});
  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    MyFontSize fontSize = MyFontSize(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: fontSize.h * 0.07,
          width: fontSize.w,
          decoration: BoxDecoration(
            color: AppColor.whiteColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              InkWell(
                onTap: widget.onTap,
                child: const Icon(Icons.menu),
              ),
              SizedBox(width: fontSize.w * 0.007),
              Image.asset(Images.greenDot, height: fontSize.h * 0.03),
              SizedBox(width: fontSize.w * 0.007),
              SizedBox(
                  width: fontSize.w / 1.8,
                  child: Headings.txt13blackBold(widget.title ?? '', context)),
              const Spacer(),
              Icon(Icons.my_location_rounded,
                  color: AppColor.appColor, size: 20),
              if (widget.isFev == true) widget.onTapFev ?? Container(),
            ],
          ),
        ),
      ),
    );
  }
}

class EnterCoupon extends StatefulWidget {
  final VoidCallback? onTap;
  final VoidCallback? removeCouponTap;
  final couponValue;
  EnterCoupon(
      {super.key,
      this.onTap,
      required this.couponValue,
      required this.removeCouponTap});
  @override
  State<EnterCoupon> createState() => _EnterCouponState();
}

class _EnterCouponState extends State<EnterCoupon> {
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    Provider.of<HomePageViewModel>(context, listen: false)
        .couponCodeController
        .dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Consumer<HomePageViewModel>(
          builder: (context, value, child) {
            value.couponCodeController.text = widget.couponValue ?? '';
            return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomTextForm(
                        suffixIcon: InkWell(
                            onTap: () {
                              if (widget.couponValue == '') {
                                widget.onTap!();
                              } else {
                                widget.removeCouponTap!();
                              }
                            },
                            child: value.couponCodeController.text.isEmpty
                                ? Icon(Icons.send,
                                    color: AppColor.greenColor, size: 20)
                                : Icon(Icons.close,
                                    color: AppColor.redColor, size: 20)),
                        controller: value.couponCodeController,
                        focusNode: _focusNode,
                        hintText: "Enter Coupon Code",
                        prefixIcon: Icon(Icons.local_offer_outlined,
                            color: AppColor.greenColor, size: 20)),
                  ],
                ),
              ),
            );
          },
        );
      },
    ).whenComplete(() {
      _focusNode.unfocus();
    });
    Future.delayed(const Duration(milliseconds: 100), () {
      _focusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    MyFontSize fontSize = MyFontSize(context);
    return InkWell(
      onTap: _showBottomSheet,
      child: Row(
        children: [
          Image.asset(Images.coupon, height: fontSize.h * 0.03),
          const SizedBox(width: 6),
          Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Headings.txt13grey("Coupon", context),
              if (ApiStatus.setCouponCode != null && widget.couponValue != '')
                Headings.txt13grey(widget.couponValue, context),
            ],
          )
        ],
      ),
    );
  }
}

class PersonalOrOther extends StatefulWidget {
  const PersonalOrOther({super.key});
  @override
  State<PersonalOrOther> createState() => _PersonalOrOtherState();
}

class _PersonalOrOtherState extends State<PersonalOrOther> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    nameController.dispose();
    mobileNumberController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  bool isPersonal = false;
  bool isOther = false;
  Future<String?> _showBottomSheet() async {
    return await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColor.whiteColor,
      builder: (context) {
        bool isTempPersonal = isPersonal;
        bool isTempOther = isOther;

        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: EdgeInsets.only(
                left: 15,
                right: 15,
                bottom: MediaQuery.of(context).viewInsets.bottom,
                top: 15,
              ),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Headings.txt20BlackBold(
                      "Someone else taking this ride", context),
                  Headings.txt13grey(
                    "Choose a contact so they also get driver number, vehicle details and ride OTP via SMS",
                    context,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            shape: const CircleBorder(),
                            value: isTempPersonal,
                            onChanged: (value) {
                              setModalState(() {
                                isTempPersonal = value!;
                                isTempOther = false;
                              });
                            },
                          ),
                          Image.asset(Images.pearsion1, height: 20),
                          const SizedBox(width: 8),
                          Headings.txt13grey("Personal", context),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            shape: const CircleBorder(),
                            value: isTempOther,
                            onChanged: (value) {
                              if (value == true) {
                                setModalState(() {
                                  isTempOther = true;
                                  isTempPersonal = false;
                                });
                                showDialog(
                                  context: context,
                                  builder: (BuildContext dialogContext) {
                                    return AlertDialog(
                                      backgroundColor: AppColor.whiteColor,
                                      shape: BeveledRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      title: Text("Enter Other Details",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: AppColor.appColor)),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextFormField(
                                            keyboardType: TextInputType.text,
                                            controller: nameController,
                                            decoration: const InputDecoration(
                                                hintText: "Name"),
                                          ),
                                          const SizedBox(height: 10),
                                          TextFormField(
                                            maxLength: 10,
                                            controller: mobileNumberController,
                                            keyboardType: TextInputType.phone,
                                            decoration: const InputDecoration(
                                              counterText: '',
                                              hintText: "Mobile number",
                                            ),
                                          ),
                                        ],
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(dialogContext).pop();
                                          },
                                          child: Text("Cancel",
                                              style: TextStyle(
                                                  color: AppColor.redColor)),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            if (nameController.text.isEmpty ||
                                                mobileNumberController
                                                    .text.isEmpty) {
                                              Utils.toastMessage(
                                                  'Please enter your detail');
                                              return;
                                            }
                                            if (mobileNumberController
                                                    .text.length !=
                                                10) {
                                              Utils.toastMessage(
                                                  'Please enter valid mobile number');
                                              return;
                                            }
                                            ApiStatus.setOtherName =
                                                nameController.text;
                                            ApiStatus.setOtherMobileNumber =
                                                mobileNumberController.text;
                                            Navigator.of(dialogContext).pop();
                                            Navigator.of(context).pop(
                                                "Other"); // RETURN value here
                                          },
                                          child: Text("Continue",
                                              style: TextStyle(
                                                  color: AppColor.appColor)),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              } else {
                                setModalState(() {
                                  isTempOther = false;
                                });
                              }
                            },
                          ),
                          Image.asset(Images.pearsion1, height: 20),
                          const SizedBox(width: 8),
                          Headings.txt13grey("Other", context),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Divider(color: AppColor.lightGreyColor),
                  if (!isTempPersonal)
                    CustomButton(
                      onTap: () => Navigator.pop(context, "Other"),
                      child: Headings.txt17WhiteBold("Skip", context),
                    ),
                  if (isTempPersonal)
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            onTap: () => Navigator.pop(context, "Other"),
                            child: Headings.txt17WhiteBold("Skip", context),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: CustomButton(
                            onTap: () => Navigator.pop(context, "Self"),
                            child: Headings.txt17WhiteBold("Continue", context),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    MyFontSize fontSize = MyFontSize(context);

    return InkWell(
      onTap: () async {
        final result = await _showBottomSheet();
        if (result != null) {
          setState(() {
            isPersonal = result == "Self";
            isOther = result == "Other";
          });
        }
      },
      child: Row(children: [
        Image.asset(Images.pearsion1,
            height: fontSize.h * 0.03, color: AppColor.brownColor),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isPersonal == true
                ? Headings.txt13grey("Personal", context)
                : false || isOther == true
                    ? Headings.txt13grey("Other", context)
                    : Headings.txt13grey("Personal", context),
          ],
        )
      ]),
    );
  }
}

class PickUpLocationHeader extends StatelessWidget {
  String? title = "Pickup Location...";
  PickUpLocationHeader({super.key, this.title});
  @override
  Widget build(BuildContext context) {
    MyFontSize fontSize = MyFontSize(context);
    return Container(
      width: fontSize.w,
      height: fontSize.h / 5,
      decoration: const BoxDecoration(color: Colors.white),
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(height: fontSize.h * 0.02),
            Row(
              children: [
                arrowBackButton(),
                Headings.txt20BlackBold("Pickup Location", context)
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: fontSize.h * 0.07,
                width: fontSize.w,
                decoration: BoxDecoration(
                    color: AppColor.whiteColor,
                    border: Border.all(color: AppColor.lightGreyColor),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    SizedBox(width: fontSize.w * 0.007),
                    InkWell(
                        child: Image.asset(
                      Images.greenDot,
                      height: fontSize.h * 0.03,
                    )),
                    SizedBox(width: fontSize.w * 0.007),
                    Headings.txt13blackBold(title ?? '', context),
                    const Spacer(),
                    Icon(Icons.my_location_rounded,
                        color: AppColor.appColor, size: 20),
                    SizedBox(width: fontSize.w * 0.02),
                    Icon(Icons.favorite_border,
                        color: AppColor.blackColor, size: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
