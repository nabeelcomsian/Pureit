import 'package:flutter/material.dart';
import 'package:pureit/CustomFliterIndicator.dart';
import 'package:pureit/utils/Stripe_Const.dart';
import 'package:pureit/view/screens/HomeScreen.dart';
import 'package:pureit/view/screens/Main_Screen.dart';
import 'package:pureit/view/screens/Slider_screen/Slider_Home_screen.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';
import 'package:pureit/Auth/Login_Screen.dart';
import 'package:pureit/testing.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() async {
  await _setup();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

Future<void> _setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = stripePublishableKey;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
