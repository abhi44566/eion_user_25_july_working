import 'dart:convert';
import 'dart:io';
import 'package:driver_suvidha_user/import.dart';
import 'package:driver_suvidha_user/screen/payment/payment_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import '../screen/setting/provider/view_model/order_history_view_model.dart';
import 'notification_body.dart';

class NotificationServices {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  static Future<void> initialize(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var androidInitialize =
        const AndroidInitializationSettings('@drawable/ic_launcher');
    var iOSInitialize = const DarwinInitializationSettings();
    var initializationsSettings =
        InitializationSettings(android: androidInitialize, iOS: iOSInitialize);
    flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    flutterLocalNotificationsPlugin.initialize(initializationsSettings,
        onDidReceiveNotificationResponse: (NotificationResponse load) async {
      try {
        if (load.payload != null) {
          // Decode JSON payload to a Map
          Map<String, dynamic> payloadData = jsonDecode(load.payload!);
          List<String> extraParts = (payloadData['extra'] as String).split('#');
          // if (extraParts.isNotEmpty && extraParts[0] == "OrderU") {
          //  // Get.to(() => MyBookingScreen(bookingType: 'Upcoming',));
          // }else if((extraParts.isNotEmpty && extraParts[0] == "OrderC")){
          //  // Get.to(() => MyBookingScreen(bookingType: 'Upcoming',));
          // }else{
          //  // Get.to(() => HomeScreen());
          // }
        } else {}
      } catch (e) {
        debugPrint("Error handling notification tap: $e");
      }
      return;
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      debugPrint("Notification opened from background. Stopping tone...");
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      List<String> extraParts = (message.data['extra'] as String).split('#');
      print("extraParts-------------------------------${extraParts[0]}");
      final context = navigatorKey.currentContext;
      if (extraParts[0] == 'OrderEnd') {
        Navigator.push(
            context!,
            MaterialPageRoute(
                builder: (context) => PaymentScreen(bookingId: extraParts[1])));
        Provider.of<OrderHistoryViewModel>(context, listen: false)
            .getOrderHistoryDetail(context, bookingId: extraParts[1]);
        Provider.of<OrderHistoryViewModel>(context, listen: false)
            .getOrderHistory(context, type: "Upcoming");
      } else if (extraParts[0] == 'Order') {
        Provider.of<OrderHistoryViewModel>(context!, listen: false)
            .getOrderHistory(context, type: "Upcoming");
        Provider.of<OrderHistoryViewModel>(context, listen: false)
            .getOrderHistoryDetail(context, bookingId: extraParts[1]);
      }

      NotificationServices.showNotification(
        message,
        flutterLocalNotificationsPlugin,
        false,
      );
    });
  }

  static Future<void> showNotification(RemoteMessage message,
      FlutterLocalNotificationsPlugin fln, bool data) async {
    if (!Platform.isIOS) {
      String? title;
      String? body;
      String? orderID;
      String? image;
      String? date;
      String? type;
      NotificationBody notificationBody = convertNotification(message.data);
      if (message.data.isNotEmpty) {
        title = message.data['title'];
        body = message.data['message'];
        orderID = message.data['noturl'];
        date = message.data['timestamp'];
        type = message.data['extra'];

        image = (message.data['image'] != null &&
                message.data['image'].isNotEmpty)
            ? message.data['image'].startsWith('http')
                ? message.data['image']
                : 'AppConstants.baseUrl/storage/app/public/notification/${message.data['image']}'
            : null;
      } else {
        title = message.data['title'];
        body = message.data['message'];
        orderID = message.data['noturl'];
        date = message.data['timestamp'];
        type = message.data['extra'];

        if (Platform.isAndroid) {
          image = (message.data['image'] != null &&
                  message.data['image'].isNotEmpty)
              ? message.data['image'].startsWith('http')
                  ? message.data['image']
                  : 'AppConstants.baseUrl/storage/app/public/notification/${message.data['image']}'
              : null;
        } else if (Platform.isIOS) {
          image = (message.data['image'] != null &&
                  message.data['image'].isNotEmpty)
              ? message.data['image'].startsWith('http')
                  ? message.data['image']
                  : 'AppConstants.baseUrl/storage/app/public/notification/${message.data['image']}'
              : null;
        }
      }

      if (image != null && image.isNotEmpty) {
        try {} catch (e) {
          await showBigTextNotification(
              title, body!, orderID, notificationBody, fln);
        }
      } else {
        await showBigTextNotification(
            title, body!, orderID, notificationBody, fln);
      }
    }
  }

  static Future<void> showBigTextNotification(
      String? title,
      String body,
      String? orderID,
      NotificationBody? notificationBody,
      FlutterLocalNotificationsPlugin fln) async {
    BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
      body,
      htmlFormatBigText: true,
      contentTitle: title,
      htmlFormatContentTitle: true,
    );

    AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'default_channel_10567',
      'Default Sound Channel',
      importance: Importance.max,
      styleInformation: bigTextStyleInformation,
      priority: Priority.max,
      playSound: true,
      icon: '@drawable/ic_launcher',
    );
    NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await fln.show(0, title, body, platformChannelSpecifics,
        payload: notificationBody != null
            ? jsonEncode(notificationBody.toJson())
            : null);
  }

  void requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      if (kDebugMode) {
        print('user granted permission');
      }
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      if (kDebugMode) {
        print('user granted provisional permission');
      }
    } else {
      if (kDebugMode) {
        print('user denied permission');
      }
    }
  }

  static NotificationBody convertNotification(Map<String, dynamic> data) {
    return NotificationBody(
      message: NotificationType.message.toString(),
      title: data['title'],
      noturl: data['noturl'],
      isBackground: data['is_background'],
      extra: data['extra'],
    );
  }
}

Future<void> myBackgroundMessageHandler(RemoteMessage message) async {
  if (message.data.isNotEmpty) {
    try {
      const androidInitialize =
          AndroidInitializationSettings('@drawable/ic_launcher');
      const iOSInitialize = DarwinInitializationSettings();
      const initializationsSettings = InitializationSettings(
        android: androidInitialize,
        iOS: iOSInitialize,
      );

      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
          FlutterLocalNotificationsPlugin();
      flutterLocalNotificationsPlugin.initialize(initializationsSettings);

      // Show a local notification when the app is in the background
      await NotificationServices.showNotification(
        message,
        flutterLocalNotificationsPlugin,
        true,
      );
    } catch (e) {
      debugPrint("Error in background message handler: $e");
    }
  }
}
