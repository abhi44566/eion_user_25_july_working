import 'package:driver_suvidha_user/utils/app_color.dart';
import 'package:driver_suvidha_user/utils/headings.dart';
import 'package:flutter/material.dart';

class ConfimationBox extends StatefulWidget {
  final String msg;
  const ConfimationBox({super.key, required this.msg});

  @override
  State<ConfimationBox> createState() => _ConfimationBoxState();
}

class _ConfimationBoxState extends State<ConfimationBox> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.whiteColor,
      surfaceTintColor: AppColor.whiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Headings.txt17BlackBold('${widget.msg}', context,
                textAlign: TextAlign.center),
            SizedBox(
              height: 30,
            ),
            btn()
          ],
        ),
      ),
    );
  }

  Widget btn() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        decoration: BoxDecoration(
            color: AppColor.appColor, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding:
              EdgeInsetsDirectional.symmetric(horizontal: 30, vertical: 10),
          child: Headings.txt17BlackBold('Ok', context,
              color: AppColor.whiteColor),
        ),
      ),
    );
  }
}
