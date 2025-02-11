import 'package:flutter/material.dart';
import 'package:pureit/Notifications/notification_services.dart';
import 'package:pureit/Services/Stripe_Services.dart';

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
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.green,
              onPressed: () {
                StripeServices.instance.makePayment(20, 'USD');
              },
              child: Text('purchase'),
            )
          ],
        ),
      ),
    );
  }
}
