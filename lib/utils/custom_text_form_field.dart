
import 'package:driver_suvidha_user/utils/app_color.dart';

import 'import.dart';
class CustomTextForm extends StatelessWidget {
  Icon? prefixIcon;
  TextEditingController? controller;
  String? hintText;
  String? labelText;
  Widget? suffixIcon;
  dynamic inputType ;
  int? maxLength;
  FocusNode? focusNode;
  void Function(String)? onChanged;
  bool? enabled;
  Color?fillColor;
  dynamic submited;
  int? maxLines = 1;
   CustomTextForm({super.key,
     this.prefixIcon,
     this.controller,
     this.suffixIcon,
     this.hintText,
     this.onChanged,
     this.fillColor,
     this.submited,
     this.enabled,
     this.maxLength,
     this.focusNode,
     this.labelText,
     this.inputType,
     this.maxLines
   });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength:maxLength ,
      onChanged: onChanged,
      enabled:enabled ,
      controller: controller,
     onFieldSubmitted: submited,
      keyboardType:  inputType,
      focusNode:focusNode ,
      maxLines: maxLines,


      decoration:InputDecoration(
        counterText: '',
          contentPadding: const EdgeInsets.fromLTRB(15, 5, 5, 5),
        filled: true,
        fillColor:AppColor.whiteColor,
        prefixIcon: prefixIcon,
          suffixIcon:suffixIcon ,
          hintText: hintText,

          hintStyle: TextStyle(color: AppColor.lightGreyColor),
          labelText:labelText ,

          labelStyle: TextStyle(color: AppColor.lightGreyColor),
          disabledBorder: OutlineInputBorder(


              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(color:AppColor.appColor)),
          enabledBorder:    OutlineInputBorder(

            borderRadius: BorderRadius.circular(14),
            borderSide:  BorderSide(color:AppColor.appColor),
          ),
          border: OutlineInputBorder(

              borderRadius: BorderRadius.circular(14),
            borderSide:   BorderSide(color:AppColor.appColor)
          ),


      ),

    );
  }
}

