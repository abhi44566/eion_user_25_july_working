import 'package:driver_suvidha_user/import.dart';
import 'package:driver_suvidha_user/screen/setting/my_account/update_my_account.dart';
import 'package:driver_suvidha_user/utils/network_image.dart';
import 'package:driver_suvidha_user/utils/progress_bar.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({super.key});

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  void initState() {
    super.initState();
    Future.microtask(
      () {
        fetchData();
      },
    );
  }

  void fetchData() {
    Provider.of<ProfileViewModel>(context, listen: false)
        .getProfileApi(context);
  }

  @override
  Widget build(BuildContext context) {
    MyFontSize fontSize = MyFontSize(context);
    return Scaffold(body: Consumer<ProfileViewModel>(
      builder: (context, value, child) {
        final getProfile = value.getProfileRes?.response;
        return Stack(
          children: [
            Column(
              children: [
                Container(
                  color: AppColor.appColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: fontSize.h * 0.04),
                      BackButton(color: AppColor.whiteColor),
                      SizedBox(height: fontSize.h * 0.02),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Headings.txt34WhiteBold("My account", context),
                            CustomNetworkProfileImage(
                                height: 80,
                                width: 80,
                                image: getProfile?.profilePhoto ?? ''),
                          ],
                        ),
                      ),
                      SizedBox(height: fontSize.h * 0.02),
                    ],
                  ),
                ),
                SizedBox(height: fontSize.h * 0.02),
                detailWidget("Name", getProfile?.fullName ?? "", context),
                detailWidget("Email", getProfile?.emailId ?? "N/A", context),
                detailWidget("Phone", getProfile?.mobileNumber ?? "", context),
                detailWidget("Address", getProfile?.address ?? "", context),
                detailWidget("City", getProfile?.city ?? "", context),
                detailWidget("State", getProfile?.state ?? "", context),
                detailWidget("Pin", getProfile?.zipCode ?? "", context),
                detailWidget("Country", getProfile?.country ?? "", context),
                // detailWidget("Password", "********", context),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: CustomButton(
                          onTap: () async {
                            final refresh = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UpdateMyAccount()));
                            if (refresh == "refresh") {
                              fetchData();
                              setState(() {});
                            }
                          },
                          child: Headings.txt17BlackBold("Update", context)),
                    ),
                  ),
                )
              ],
            ),
            value.isLoading ? Center(child: CustomProgressBar()) : SizedBox()
          ],
        );
      },
    ));
  }

  Widget detailWidget(String title, String value, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Headings.txt17BlackBold(title, context),
          Row(
            children: [
              Headings.txt17greyBold(value, context),
            ],
          )
        ],
      ),
    );
  }
}
