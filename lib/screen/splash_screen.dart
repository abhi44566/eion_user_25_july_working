import 'package:driver_suvidha_user/import.dart';
import 'package:driver_suvidha_user/screen/auth_screen/auth_view_model.dart';

import 'map_screen/provider/home_page_view_model.dart';
import 'map_screen/provider/map_view_model.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
   Future.microtask(() {
     Provider.of<BaseUrlViewModel>(context,listen: false).fetchBarFee().then((value) {
       Future.delayed(const Duration(seconds: 3),() {
       //await  Provider.of<MapViewModel>(context, listen: false).getCurrentLocation();
         Provider.of<AuthViewModel>(context,listen: false).checkLoginStatus(context);
       // await Provider.of<HomePageViewModel>(context, listen: false)
       //     .getHomePageApi(context).then((value) async{
       //  await Provider.of<HomePageViewModel>(context, listen: false).homePageRes?.response;
       //     },);

       });
     },);
   },);
  }
  @override
  Widget build(BuildContext context) {
    MyFontSize fontSize = MyFontSize(context);
    return Scaffold(
      body:  Image.asset(
        Images.splash,
        height: fontSize.h/1,
        width: fontSize.w/1,
      ),
    );
  }
}
