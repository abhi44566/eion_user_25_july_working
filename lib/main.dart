import 'dart:io';
import 'package:flutter/services.dart';
import 'package:driver_suvidha_user/screen/auth_screen/auth_view_model.dart';
import 'package:driver_suvidha_user/screen/map_screen/provider/home_page_view_model.dart';
import 'package:driver_suvidha_user/screen/map_screen/provider/map_view_model.dart';
import 'package:driver_suvidha_user/screen/setting/provider/view_model/order_history_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:driver_suvidha_user/screen/splash_screen.dart';
import 'import.dart';
import 'notification_services/notification_service.dart';
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  myBackgroundMessageHandler(message);
}

Future<void> requestNotificationPermission() async {
  if (await Permission.notification.isDenied) {
    await Permission.notification.request();
  }
  // For Android 13+ (API 33+)
  final bool? granted = await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()
      ?.requestNotificationsPermission();

  if (granted == true) {
    debugPrint("Notification permission granted");
  } else {
    debugPrint("Notification permission denied");
  }
}

Future<void> requestIOSPermissions() async {
  NotificationSettings settings =
  await FirebaseMessaging.instance.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('✅ User granted permission');
  } else if (settings.authorizationStatus == AuthorizationStatus.denied) {
    print('❌ User denied permission');
  } else {
    print('🔶 User granted provisional permission');
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  requestNotificationPermission();
  HttpOverrides.global = MyHttpOverrides();
  await MySharedPreferences.init();
  startTracking();
  try {
    if (Platform.isIOS) {
    await  requestIOSPermissions();
    }else{
      NotificationServices.initialize(flutterLocalNotificationsPlugin);
      FirebaseMessaging.onBackgroundMessage(
          _firebaseMessagingBackgroundHandler);
      await FirebaseMessaging.instance.getInitialMessage();
    }
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BaseUrlViewModel()),
        ChangeNotifierProvider(create: (context) => AuthViewModel()),
        ChangeNotifierProvider(create: (context) => HomePageViewModel()),
        ChangeNotifierProvider(create: (context) => ProfileViewModel()),
        ChangeNotifierProvider(create: (context) => OrderHistoryViewModel()),
        ChangeNotifierProvider(create: (context) => PaymentViewModel()),
        ChangeNotifierProvider(create: (context) => MapViewModel()),
      ],
      child:MaterialApp(
        title: 'Eion',
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
        ),
        home: SplashScreen(),
      ),
    );


  }
}
void startTracking() {
  LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 10,
  );}