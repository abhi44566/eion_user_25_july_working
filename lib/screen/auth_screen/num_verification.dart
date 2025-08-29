import 'package:driver_suvidha_user/import.dart';
import 'package:driver_suvidha_user/screen/auth_screen/auth_view_model.dart';
import 'package:driver_suvidha_user/utils/progress_bar.dart';
class NumVerification extends StatefulWidget {
  const NumVerification({super.key});

  @override
  State<NumVerification> createState() => _NumVerificationState();
}

class _NumVerificationState extends State<NumVerification> {
  String selectedCountryCode = '+91';
  final List<Map<String, String>> countryCodes = [
    {'code': '+91', 'flag': '🇮🇳', 'name': 'India'},
  ];

  @override
  Widget build(BuildContext context) {
    MyFontSize fontSize = MyFontSize(context);
    return Scaffold(
      body: SafeArea(
        child: Consumer<AuthViewModel>(builder: (context, value, child) {
          return Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: fontSize.h*0.03),
                  arrowBackButton(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        SizedBox(height: fontSize.h*0.03),
                        Headings.txt28BlackBold("Enter Phone number for verification", context),
                        Headings.txt15Grey("We’ll text a code to verify your phone number", context),
                        SizedBox(height: fontSize.h*0.03),
                        Row(children: [
                          DropdownButtonHideUnderline(
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    border: Border.all(
                                        color: AppColor.appColor)),
                                child: DropdownButton<String>(
                                  isDense: true,
                                  borderRadius: BorderRadius.circular(10),
                                  value: selectedCountryCode,
                                  onChanged: (newValue) {
                                    setState(() {
                                      selectedCountryCode = newValue!;
                                    });
                                  },
                                  items: countryCodes.map((country) {
                                    return DropdownMenuItem<String>(
                                      value: country['code'],
                                      child: Row(
                                        children: [
                                          Text(country['flag']!, style: const TextStyle(fontSize: 20)),
                                          const SizedBox(width: 8),
                                          Text(country['code']!),
                                        ],
                                      ),
                                    );
                                  }).toList(),),
                              )),
                          SizedBox(width: fontSize.w*0.03),
                          Expanded(child: CustomTextForm(
                            maxLength: 10,
                              inputType:TextInputType.phone,
                            controller: value.mobileNum,
                              hintText: "Enter Phone Number")),
                        ],),
              
                      ],),
                  ),
                  Expanded(
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                          child: CustomButton(onTap: (){
                            value.mobileVerificationApi(context);
                          }, child: Headings.txt17WhiteBold("Get Verification Code", context)),
                        )),
                  )
                ],
              ),
              Center(child: value.isLoading?CustomProgressBar():SizedBox())
            ],
          );
        },)
      ),
    );
  }
}
