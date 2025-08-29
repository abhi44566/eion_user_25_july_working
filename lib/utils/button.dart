import 'package:driver_suvidha_user/import.dart';
import 'package:sliding_action_button/sliding_action_button.dart';
import 'import.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;
  final Color? backGroundColor;
  CustomButton(
      {super.key,
      required this.onTap,
      required this.child,
      this.backGroundColor});

  @override
  Widget build(BuildContext context) {
    // MyFontSize fontSize = MyFontSize(context);
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
              elevation: 5,
              // minimumSize: Size( fontSize.resWidth*1, fontSize.resHeight*0.06),
              backgroundColor: backGroundColor ?? AppColor.appColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          child: child),
    );
  }
}

class CusTomAnimatedButton extends StatelessWidget {
  final String txt;
  final Color? backGroundColor;
  final dynamic Function() onSlideActionCompleted;
  CusTomAnimatedButton(
      {super.key,
      required this.txt,
      this.backGroundColor,
      required this.onSlideActionCompleted});

  @override
  Widget build(BuildContext context) {
    return SquareSlideToActionButton(
      width: MediaQuery.of(context).size.width,
      parentBoxRadiusValue: 15,
      initialSlidingActionLabel: txt,
      initialSlidingActionLabelTextStyle: TextStyle(
          color: AppColor.whiteColor,
          fontSize: 17,
          fontWeight: FontWeight.w500),
      finalSlidingActionLabel: 'Process...',
      squareSlidingButtonSize: 50,
      squareSlidingButtonIcon: Image.asset(Images.swipeArrow, fit: BoxFit.fill),
      squareSlidingButtonBackgroundColor: Colors.white,
      parentBoxGradientBackgroundColor:
          LinearGradient(colors: [AppColor.appColor, AppColor.greyColor]),
      parentBoxDisableGradientBackgroundColor: LinearGradient(colors: [
        AppColor.appColor,
      ]),
      leftEdgeSpacing: 2,
      rightEdgeSpacing: 4,
      onSlideActionCompleted: onSlideActionCompleted,
      onSlideActionCanceled: () {
        print("Sliding action cancelled");
      },
    );
  }
}

Widget proceedButton(BuildContext context, VoidCallback onTap) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 80),
    child: InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: AppColor.appColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
            child: Text(
          "Proceed",
          style: GoogleFonts.nunito(
            textStyle: TextStyle(
              color: AppColor.whiteColor,
              fontWeight: FontWeight.w900,
              fontSize: 15,
            ),
          ),
        )),
      ),
    ),
  );
}
