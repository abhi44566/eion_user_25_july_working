import 'package:driver_suvidha_user/import.dart';
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}
class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    MyFontSize fontSize = MyFontSize(context);
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: fontSize.h/1.3,
            child: PageView(
              controller: _pageController,
              onPageChanged: (value) {
                print(value);
               setState(() {
                 currentPage =  value;
               });
              },
              children:List.generate(3, (index) {
                return   buildOnboardingPage(
                  fontSize,
                  Images.onboardingBackground,
                  "Making your drive best is our responsibility",
                  "",
                );
              },)
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 0),
            child:  Row(children: List.generate(3, (index) {
              return Container(
                margin: const EdgeInsets.only(right: 10),
                height: 12,
                width: currentPage==index?22:12,
                decoration: BoxDecoration(
                  color: currentPage==index?AppColor.appColor:Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all( color: currentPage==index?Colors.transparent:AppColor.appColor,)
                ),
              );
            },),)
          ),


           Expanded(
             child: Align(
               alignment: Alignment.bottomCenter,
               child: Padding(
                 padding:  const EdgeInsets.symmetric(horizontal: 20),
                 child: CustomButton(onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const NumVerification()));
                 }, child:Headings.txt17WhiteBold("Get Started", context) ),
               ),
             ),
           ),
          SizedBox(height: fontSize.h*0.01),
          AgreementText(onTermsTap: (){}, onPrivacyPolicyTap: (){}),
          SizedBox(height: fontSize.h*0.03)
        ],
      ),
    );
  }

  Widget buildOnboardingPage(
      MyFontSize fontSize,
      String imagePath,
      String title,
      String description,
      ) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imagePath,
          // height: fontSize.h / 2,
          width: fontSize.w/1,
          fit: BoxFit.cover,
        ),
        SizedBox(height: fontSize.h*0.02),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Headings.txt34BlackBold(title, context),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Headings.txt15Grey(description, context),
        ),

      ],
    );
  }
}









class AgreementText extends StatelessWidget {
  final VoidCallback onTermsTap;
  final VoidCallback onPrivacyPolicyTap;

  const AgreementText({
    Key? key,
    required this.onTermsTap,
    required this.onPrivacyPolicyTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(
          fontSize: 14,
          color: AppColor.greyColor,
        ),
        children: [
           TextSpan(

            text: "By continuing, you agree that you have read and accept our ",
            style: TextStyle(
              color: AppColor.greyColor, // Highlighted link color

            ),
          ),
          TextSpan(
            text: "T&Cs",
            style: TextStyle(
              color: AppColor.blackColor,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTermsTap,
          ),
          const TextSpan(
            text: " and ",
          ),
          TextSpan(
            text: "Privacy Policy",
            style: TextStyle(
              color: AppColor.blackColor,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()..onTap = onPrivacyPolicyTap,
          ),
          const TextSpan(
            text: ".",
          ),
        ],
      ),
    );
  }
}
