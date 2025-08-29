import 'package:driver_suvidha_user/import.dart';
import 'package:driver_suvidha_user/utils/network_image.dart';
import 'package:share_plus/share_plus.dart';

class ReferEarnScreen extends StatefulWidget {
  const ReferEarnScreen({super.key});

  @override
  State<ReferEarnScreen> createState() => _ReferEarnScreenState();
}

class _ReferEarnScreenState extends State<ReferEarnScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>  Provider.of<ProfileViewModel>(context,listen: false).getReferAndEarn(context),);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor:AppColor.appColor,
          elevation: 0,
          leading: BackButton(
            color: AppColor.whiteColor,
          ),
          title:Headings.txt17WhiteBold("Refer & Earn", context)
      ),
      body: Consumer<ProfileViewModel>(
        builder: (context, value, child) {
          return value.isLoading?Center(child: CircularProgressIndicator(),): Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Headings.txt17BlackBold("Refer & Earn", context),
              SizedBox(
                height: 20,
              ),

              SizedBox(
                height: 150,
                width: double.infinity,
                child: CustomNetworkImage(
                    image: value.getReferAndEarnRes.response?.referImage??''),
              ),

              SizedBox(
                height: 50,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Headings.txt17BlackBold(value.getReferAndEarnRes.response?.referPageMsg??'', context),
              ),
              SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Headings.txt17BlackBold("Referral Code:", context),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Headings.txt17BlackBold(value.getReferAndEarnRes.response?.referralCode??'', context),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CustomButton(
                      onTap: () {
                        final shareMsg = value.getReferAndEarnRes.response?.shareMessage ?? '';
                        Share.share(shareMsg);
                      },
                      child: Headings.txt15white(
                        "Share",
                        context,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
          ],
          );
        },
      ),
    );
  }
}
