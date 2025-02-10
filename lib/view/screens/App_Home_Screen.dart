import 'package:flutter/material.dart';
import 'package:pureit/Notifications/notification_services.dart';

class AppHomeScreen extends StatefulWidget {
  const AppHomeScreen({super.key});

  @override
  State<AppHomeScreen> createState() => _AppHomeScreenState();
}

class _AppHomeScreenState extends State<AppHomeScreen> {
  NotificationServices notificationServices = NotificationServices();
  @override
  initState() {
    super.initState();
    notificationServices.firebaeInit();
    notificationServices.requestNotificationPermission();
    notificationServices.getToken().then((value) {
      debugPrint("Device Token");
      debugPrint(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HOME SCREEN"),
      ),
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
      ),
    );
  }
}
