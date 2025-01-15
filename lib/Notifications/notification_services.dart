import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationServices {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

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
    } else if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      debugPrint("User Granted the permission ");
    } else {
      debugPrint("User Denied the Permission");
    }
  }
}
