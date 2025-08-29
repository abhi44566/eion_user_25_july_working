import 'package:driver_suvidha_user/import.dart';
Widget vehicleTypeWidget(
void Function()? onTap,
String? image,
String? title,
Color borderColor,

    String?price,
    Color txtColor,
    ){
  return InkWell(
    onTap:onTap,
    child: Container(
      margin: const EdgeInsets.only(right:3),
      padding: const EdgeInsets.symmetric(horizontal:6,vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
          color: borderColor,
         ),
      child:  Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(image??"",height:28,fit: BoxFit.contain),
          const SizedBox(
            width: 3,
          ),
          Text(title.toString(),style: TextStyle(color: txtColor),),
          Text(" ₹${price.toString()}",style: TextStyle(color: txtColor)),
        ],
      ),
    ),
  );
}