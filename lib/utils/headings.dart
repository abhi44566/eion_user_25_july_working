import 'package:driver_suvidha_user/utils/app_color.dart';

import 'import.dart';

class Headings {
  static Widget txt34BlackBold(String title, BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.nunito(
        height: 0,
        textStyle: TextStyle(
          color: AppColor.blackColor,
          fontWeight: FontWeight.w700,
          fontSize: 34,
        ),
      ),
    );
  }

  static Widget txt34WhiteBold(String title, BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.nunito(
        textStyle: TextStyle(
          color: AppColor.whiteColor,
          fontWeight: FontWeight.w700,
          fontSize: 34,
        ),
      ),
    );
  }

  static Widget txt13grey(String title, BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.nunito(
        textStyle: TextStyle(
          color: AppColor.greyColor,
          fontWeight: FontWeight.w600,
          fontSize: 13,
        ),
      ),
    );
  }

  static Widget txt12grey(String title, BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.nunito(
        textStyle: TextStyle(
          color: AppColor.greyColor,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ),
    );
  }

  static Widget txt12green(String title, BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.nunito(
        textStyle: TextStyle(
          color: AppColor.greenColor,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ),
    );
  }

  static Widget txt12Red(String title, BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.nunito(
        textStyle: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ),
    );
  }

  static Widget txt12White(String title, BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.nunito(
        textStyle: TextStyle(
          color: AppColor.whiteColor,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ),
    );
  }

  static Widget txt13blackBold(String title, BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.nunito(
        textStyle: TextStyle(
          color: AppColor.blackColor,
          fontWeight: FontWeight.w700,
          fontSize: 13,
        ),
      ),
    );
  }

  static Widget txt13black(String title, BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.nunito(
        textStyle: TextStyle(
          color: AppColor.blackColor,
          fontWeight: FontWeight.w400,
          fontSize: 13,
        ),
      ),
    );
  }

  static Widget txt13Red(String title, BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.nunito(
        textStyle: TextStyle(
          color: AppColor.redColor,
          fontWeight: FontWeight.w400,
          fontSize: 13,
        ),
      ),
    );
  }

  static Widget txt13Green(String title, BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.nunito(
        textStyle: TextStyle(
          color: AppColor.greenColor,
          fontWeight: FontWeight.w400,
          fontSize: 13,
        ),
      ),
    );
  }

  static Widget txt13White(String title, BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.nunito(
        textStyle: TextStyle(
          color: AppColor.whiteColor,
          fontWeight: FontWeight.w400,
          fontSize: 13,
        ),
      ),
    );
  }

  static Widget txt16black(String title, BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.nunito(
        textStyle: TextStyle(
          color: AppColor.blackColor,
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
      ),
    );
  }

  static Widget txt28BlackBold(String title, BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.nunito(
        textStyle: TextStyle(
          color: AppColor.blackColor,
          fontWeight: FontWeight.w700,
          fontSize: 28,
        ),
      ),
    );
  }

  static Widget txt15Grey(String title, BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.nunito(
        textStyle: TextStyle(
          color: AppColor.greyColor,
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ),
      ),
    );
  }

  static Widget txt15black400(String title, BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.nunito(
        textStyle: TextStyle(
          color: AppColor.blackColor,
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ),
      ),
    );
  }

  static Widget txt15white(String title, BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.nunito(
        textStyle: TextStyle(
          color: AppColor.whiteColor,
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ),
      ),
    );
  }

  static Widget txt17WhiteBold(String title, BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.nunito(
        textStyle: TextStyle(
          color: AppColor.whiteColor,
          fontWeight: FontWeight.w800,
          fontSize: 17,
        ),
      ),
    );
  }

  static Widget txt22BlackBold(String title, BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.nunito(
        textStyle: TextStyle(
          color: AppColor.blackColor,
          fontWeight: FontWeight.w700,
          fontSize: 22,
        ),
      ),
    );
  }

  static Widget txt22Black600(String title, BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.nunito(
        textStyle: TextStyle(
          color: AppColor.blackColor,
          fontWeight: FontWeight.w600,
          fontSize: 22,
        ),
      ),
    );
  }

  static Widget txt22Red600(String title, BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.nunito(
        textStyle: TextStyle(
          color: AppColor.redColor,
          fontWeight: FontWeight.w600,
          fontSize: 22,
        ),
      ),
    );
  }

  static Widget txt22AppColor600(String title, BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.nunito(
        textStyle: TextStyle(
          color: AppColor.appColor,
          fontWeight: FontWeight.w600,
          fontSize: 22,
        ),
      ),
    );
  }

  static Widget txt17BlackBold(String title, BuildContext context,
      {TextAlign? textAlign, Color? color, TextOverflow? overflow}) {
    return Text(
      title,
      textAlign: textAlign,
      style: GoogleFonts.nunito(
        textStyle: TextStyle(
            color: color ?? AppColor.blackColor,
            fontWeight: FontWeight.w600,
            fontSize: 17,
            overflow: overflow),
      ),
    );
  }

  static Widget txt17greyBold(String title, BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.nunito(
        textStyle: TextStyle(
          color: AppColor.greyColor,
          fontWeight: FontWeight.w600,
          fontSize: 17,
        ),
      ),
    );
  }

  static Widget txt20BlackBold(String title, BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.nunito(
        textStyle: TextStyle(
          color: AppColor.blackColor,
          fontWeight: FontWeight.w700,
          fontSize: 20,
        ),
      ),
    );
  }
}
