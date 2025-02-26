import 'package:flutter/material.dart';
import 'package:pureit/Notifications/notification_services.dart';
import 'package:pureit/view/Component/Custom_Appbar.dart';
import 'package:pureit/view/screens/HomeScreen.dart';
import 'package:pureit/view/screens/Quiz_Screen.dart';
import 'package:pureit/view/screens/Score_Screen.dart';
import 'package:pureit/view/screens/Stripe_Screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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

  List<Widget> ScreenList = [
    ScoreScreen(),
    StripeScreen(),
    Homescreen(),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildNavItem(IconData icon, int index) {
      return GestureDetector(
        onTap: () => _onItemTapped(index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 80,
              height: 30,
              decoration: BoxDecoration(
                color: _selectedIndex == index
                    ? Color(0XFF044A73)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(54),
              ),
              child: Icon(
                icon,
                color: _selectedIndex == index ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 4), // Space between icon and small container
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color(0XFF8FC123), // Background color of the bottom app bar
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: BottomAppBar(
          color: Colors.transparent, // Keep transparent to show Container color
          shape: const CircularNotchedRectangle(),
          notchMargin: 5.0,
          clipBehavior: Clip.antiAlias,
          child: SizedBox(
            height: kBottomNavigationBarHeight,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildNavItem(Icons.home, 0),
                _buildNavItem(Icons.notifications, 1),
                _buildNavItem(Icons.account_circle, 2),
              ],
            ),
          ),
        ),
      ),
      body: ScreenList[_selectedIndex],
    );
  }
}
