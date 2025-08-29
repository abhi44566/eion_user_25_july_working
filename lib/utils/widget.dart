 import 'package:driver_suvidha_user/assets.dart';
import 'package:driver_suvidha_user/utils/app_color.dart';
import 'package:flutter/material.dart';

Widget customProgressBarWhite()  {
  return  CircularProgressIndicator(
    color: Colors.white,
  );
}

Widget customPurProgressBar()  {
  return  CircularProgressIndicator(
    color: Colors.black,
  );
}

Widget customBackButton(){
  return Builder(
    builder: (context) {
      return InkWell(
        onTap: (){
          Navigator.pop(context);
        },
        child: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: AppColor.whiteColor,
            borderRadius: BorderRadius.circular(10)

          ),
          child: Center(child: Icon(Icons.arrow_back_ios_new,color: AppColor.blackColor,size: 22,)),
        ),
      );
    }
  );
}

Widget arrowBackButton(){
  return  Builder(
    builder: (context) {
      return Padding(
        padding:  const EdgeInsets.only(left:10,right: 10),
        child: Row(children: [
          InkWell(
              onTap:(){
                Navigator.pop(context);
              },
              child:  Padding(
                padding: const EdgeInsets.all(5),
                child: Image.asset(Images.backArrow,height: 20,),
              )),
        //  Expanded(child: Align(alignment: Alignment.center,child: Headings.extraLargeTextBlackColor(title, context),))
        ],),
      );
    }
  );
}


 class SingleWaveClipper extends CustomClipper<Path> {
   @override
   Path getClip(Size size) {
     var path = Path();

     path.lineTo(0, size.height * 0.75);
     path.cubicTo(
       size.width * 0.25,
       size.height * 0.95,
       size.width * 0.75,
       size.height * 0.55,
       size.width,
       size.height * 0.75,
     );
     path.lineTo(size.width, 0);
     path.close();

     return path;
   }

   @override
   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
 }