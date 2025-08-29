import 'package:driver_suvidha_user/provider/data/checkStatus.dart';
import 'package:driver_suvidha_user/provider/utils/utils.dart';
import 'package:driver_suvidha_user/screen/map_screen/map.dart';
import 'package:driver_suvidha_user/utils/app_color.dart';
import 'package:driver_suvidha_user/utils/button.dart';
import 'package:driver_suvidha_user/utils/headings.dart';
import 'package:driver_suvidha_user/utils/import.dart';
import 'package:driver_suvidha_user/utils/session.dart';
import 'package:driver_suvidha_user/utils/size_utils.dart';
import 'package:driver_suvidha_user/utils/widget.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  final String? userId;
  final String? full_name;
  final String msg;
  OtpScreen({super.key, this.userId, this.full_name, required this.msg});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

TextEditingController pinController = TextEditingController();

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    MyFontSize fontSize = MyFontSize(context);
    return Scaffold(
      backgroundColor: AppColor.primaryBackGround,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: fontSize.h * 0.03),
            arrowBackButton(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: fontSize.h * 0.03),
                  Headings.txt28BlackBold("Verify Phone Number", context),
                  SizedBox(height: fontSize.h * 0.02),
                  InkWell(
                    onTap: () async {
                      Navigator.pop(context);
                    },
                    child: RichText(
                        text: TextSpan(
                      text: "Edit your phone number?",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: AppColor.appColor,
                        decoration: TextDecoration.underline,
                      ),
                    )),
                  ),
                  SizedBox(height: fontSize.h * 0.03),
                  Align(
                    alignment: Alignment.center,
                    child: Pinput(
                      defaultPinTheme: PinTheme(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            border: Border.all(color: AppColor.lightGreyColor)),
                      ),
                      controller: pinController,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(
                        onTap: () async {
                          if (pinController.text == ApiStatus.otp) {
                            await MySharedPreferences.setUserId(
                                widget.userId.toString());
                            await MySharedPreferences.setFullName(
                                widget.full_name.toString());
                            Utils.toastMessage(widget.msg);
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MapScreen(),
                                ),
                                (Route route) => false);
                          } else {
                            Utils.toastMessage("Please fill correct OTP");
                          }
                        },
                        child: Headings.txt17WhiteBold("Submit", context)),
                    SizedBox(height: fontSize.h * 0.01),
                    Headings.txt13grey(
                        "Haven't got the confirmation code yet? 00:59",
                        context),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
