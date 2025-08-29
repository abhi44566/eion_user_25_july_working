import 'package:driver_suvidha_user/import.dart';
import 'package:driver_suvidha_user/utils/progress_bar.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  TextEditingController  nameController = TextEditingController();
  TextEditingController  mobileController = TextEditingController();
  TextEditingController  remarkController = TextEditingController();
  @override
  void initState() {
    super.initState();
  Future.microtask(() {
    Provider.of<ProfileViewModel>(context,listen: false).getProfileApi(context).then((value) {
      final getProfile = Provider.of<ProfileViewModel>(context,listen: false).getProfileRes?.response;
      nameController.text = getProfile?.fullName??'';
      mobileController.text = getProfile?.mobileNumber??'';
    },);
  },);
  }
  @override
  Widget build(BuildContext context) {
    MyFontSize fontSize = MyFontSize(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appColor,
        title: const Text('Help'),
      ),
      body:  Consumer<ProfileViewModel>(
        builder: (context, value, child) {
          return Stack(children: [
            Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: SingleChildScrollView(
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.support_agent,size: 100,color: AppColor.appColor),
                        SizedBox(height: fontSize.h*0.03),
                        Headings.txt15black400("Hello How can We Help You", context),

                        SizedBox(height: fontSize.h*0.03),
                        CustomTextForm(

                          hintText: "Name", controller: nameController,),
                        SizedBox(height: fontSize.h*0.03),
                        CustomTextForm(hintText: "Mobile Number", controller: mobileController),
                        SizedBox(height: fontSize.h*0.03),
                        CustomTextForm(

                            maxLines: 4,
                            hintText: "Remark", controller: remarkController),
                        SizedBox(height: fontSize.h*0.03),
                        CustomButton(onTap: (){
                          value.sendHelpAPi(context,mobileNumber: mobileController.text,remark: remarkController.text,userName: nameController.text);
                        }, child: Headings.txt17WhiteBold("SUBMIT", context))

                      ],
                    ),
                  ),
                )
            ),
            value.isLoading?Center(child: CustomProgressBar()):SizedBox()
          ]);
        },
      )
    );
  }
}
