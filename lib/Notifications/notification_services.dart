import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServices {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  void initLocalNotification() {}

  void firebaeInit() {
    FirebaseMessaging.onMessage.listen((message) {
      // var androidInitializationSettings =
      //     AndroidInitializationSettings(defaultIcon);
      debugPrint(message.notification!.title);
      debugPrint(message.notification!.body);
    });
  }

  void requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
      providesAppNotificationSettings: false,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      debugPrint("User Granted the permission ");
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      debugPrint("User Granted the permission ");
    } else {
      debugPrint("User Denied the Permission");
    }
  }

  Future<String> getToken() async {
    String? token = await messaging.getToken();
    return token!;
  }

  void isTokenRefresh() {
    messaging.onTokenRefresh.listen((event) {
      event.toString();
      debugPrint("TOKEN REFRESH");
    });
  }
}
