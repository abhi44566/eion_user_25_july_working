import 'package:driver_suvidha_user/import.dart';
import 'package:driver_suvidha_user/screen/setting/refer_earn_screen.dart';
import 'package:driver_suvidha_user/screen/setting/web_view_screen.dart';
import 'package:driver_suvidha_user/utils/network_image.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});
  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => fetchData());
  }

  String? getTermAndConditionUrl;
  String? getAboutUrl;
  String? getPrivacyPolicy;
  String? getSafety;
  void fetchData() {
    Provider.of<ProfileViewModel>(context, listen: false)
        .getProfileApi(context);
    var baseUrl = Provider.of<BaseUrlViewModel>(context, listen: false);
    getTermAndConditionUrl = baseUrl.barFee?.response?.xxgvasc8733 ?? "";
    getAboutUrl = baseUrl.barFee?.response?.xxccb8731 ?? "";
    getSafety = baseUrl.barFee?.response?.xxgrssc8734 ?? "";
    getPrivacyPolicy = baseUrl.barFee?.response?.xxgcb8732 ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: AppColor.whiteColor,
            title: Headings.txt20BlackBold('Settings', context)),
        body: Consumer<ProfileViewModel>(
          builder: (context, value, child) {
            final getProfile = value.getProfileRes?.response;
            return Padding(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Card(
                        color: AppColor.whiteColor,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  CustomNetworkProfileImage(
                                      height: 80,
                                      width: 80,
                                      borderRadius: 40,
                                      image: getProfile?.profilePhoto ?? ''),
                                  const SizedBox(width: 5),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Headings.txt22BlackBold(
                                          getProfile?.fullName ?? 'N/A',
                                          context),
                                      Headings.txt13grey(
                                          getProfile?.mobileNumber ?? '',
                                          context),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Divider(color: AppColor.lightGreyColor),
                              settingTile("My profile", Images.pearsion1, () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const MyAccountScreen()));
                              }),
                              // settingTile("Rating", Images.rating,(){})
                            ],
                          ),
                        ),
                      ),
                    ),
                    Card(
                      color: AppColor.whiteColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Column(
                          children: [
                            settingTile("My Rides", Images.myRide, () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>MyRideScreen()
                                         // const AnimatedListScreen ()
                                  )
                              );
                            }),
                            settingTile("Wallet", Images.payment, () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const WalletTransactionScreen()));
                            }),
                            settingTile("Refer & Earn", Images.referAndEarn,
                                () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ReferEarnScreen()));
                            }),
                            settingTile("Safety", Images.safety, () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WebView(
                                          url: getSafety ?? '',
                                          title: 'Safety')));
                            }),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      color: AppColor.whiteColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Column(
                          children: [
                            settingTile("Help", Images.helps, () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const HelpScreen()));
                            }),
                            settingTile(
                                "Terms & Conditions ", Images.termAndCondition,
                                () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WebView(
                                          url: getTermAndConditionUrl ?? '',
                                          title: 'Terms & Conditions ')));
                            }),
                            settingTile(
                                "Privacy Policy", Images.termAndCondition,
                                () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WebView(
                                          url: getPrivacyPolicy ?? '',
                                          title: 'Privacy Policy')));
                            }),
                            settingTile("About", Images.info, () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WebView(
                                          url: getAboutUrl ?? '',
                                          title: 'About')));
                            }),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        await MySharedPreferences.setUserId('');
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NumVerification(),
                            ),
                            (Route route) => false);
                      },
                      child: Card(
                        color: AppColor.whiteColor,
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 15),
                            child: Row(
                              children: [
                                Image.asset(
                                  Images.signOut,
                                  height: 22,
                                  width: 22,
                                ),
                                const SizedBox(width: 10),
                                Headings.txt16black("Sign Out", context),
                              ],
                            )),
                      ),
                    ),

                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              elevation: 10,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    // Top Icon
                                    CircleAvatar(
                                      backgroundColor: Colors.red.withOpacity(0.1),
                                      radius: 30,
                                      child: Icon(
                                        Icons.warning_amber_rounded,
                                        color: AppColor.redColor,
                                        size: 40,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Text("Are you sure?",style: TextStyle(color: Colors.red),),

                                     SizedBox(height: 10),
                                    Text("Do you really want to log out?"),

                                    const SizedBox(height: 20),

                                    Row(
                                      children: [
                                        Expanded(
                                          child: ElevatedButton(
                                            onPressed: () => Navigator.of(context).pop(),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.grey[300],
                                              foregroundColor: Colors.black,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              padding: const EdgeInsets.symmetric(vertical: 14),
                                            ),
                                            child: const Text("No"),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: ElevatedButton(
                                            onPressed: () async {
                                             Navigator.of(context).pop(); // Close the dialog
                                              //await MySharedPreferences.setUserId('');
                                              await value.getDeleteAccountApi(context);
                                              // Navigate to login screen or verification screen

                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: AppColor.redColor,
                                              foregroundColor: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              padding: const EdgeInsets.symmetric(vertical: 14),
                                            ),
                                            child: const Text("Yes"),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Card(
                        color: AppColor.whiteColor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                          child: Row(
                            children: [
                              Image.asset(
                                Images.delete,
                                height: 22,
                                width: 22,
                              ),
                              const SizedBox(width: 10),
                              Headings.txt16black("Delete Account", context),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }

  Widget settingTile(String title, String icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          children: [
            Image.asset(
              icon,
              height: 22,
              width: 22,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Headings.txt16black(title, context),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child:
                        Divider(color: AppColor.lightGreyColor, thickness: 1.5))
              ],
            ),
            // const Spacer(),
            // Image.asset(Images.arrowF,height: 22,width: 22,),
          ],
        ),
      ),
    );
  }
}
