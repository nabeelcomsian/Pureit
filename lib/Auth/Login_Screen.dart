import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pureit/Notifications/App_Home_Screen.dart';
import 'package:pureit/utils/utils.dart';
import 'package:pureit/view/Component/Bottom_Wave.dart';
import 'package:pureit/view/Component/CustomTextField.dart';
import 'package:pureit/view/Component/Top_Container.dart';

import 'package:pureit/RealTime_DataBase/PostScreen.dart';
import 'package:pureit/Auth/Signup_Screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool loading = false;

  void login() async {
    setState(() {
      loading = true;
    });
    try {
      final value = await _auth.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.toString().trim());

      setState(() {
        loading = false;
      });
      if (mounted) {
        // Use post-frame callback to navigate after the current build phase
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AppHomeScreen()),
          );
        });
      }

      Utils.toastMessage(value.user!.email.toString());
    } catch (error) {
      Utils.toastMessage(error.toString());

      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Check if the user is already logged in
    if (_auth.currentUser != null) {
      // If the user is already logged in, navigate to the Postscreen
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const AppHomeScreen()),
          );
        }
      });
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TopContainer(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(25, 80, 15, 0.0),
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: 350,
                    height: 403,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Login',
                          style: TextStyle(
                            color: Color(0xff262626),
                            fontFamily: 'Montserrat',
                            fontSize: 34,
                            fontWeight: FontWeight.w600,
                            height: 41.45 / 34,
                          ),
                        ),
                        const Text(
                          'Enter your credentials to log in',
                          style: TextStyle(
                            color: Color(0xff8C8C8C),
                            fontFamily: 'Montserrat',
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            height: 18 / 15,
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Column(
                          children: [
                            TextFormField(
                              controller: emailController,
                              decoration: customInputDecoration(
                                  'Enter your Email', Icons.mail),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: passwordController,
                              decoration: customInputDecoration(
                                  'Enter your Password', Icons.lock),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.5,
                          ),
                          child: const Text(
                            'Foregot Password',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 340,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff8FC123),
                              ),
                              onPressed: login,
                              child: loading == true
                                  ? const CircularProgressIndicator(
                                      strokeAlign: 1,
                                    )
                                  : const Text(
                                      'Login',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Montserrat',
                                          fontSize: 16,
                                          height: 19.5 / 16),
                                    )),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(40, 15, 0, 0),
                          child: RichText(
                            text: TextSpan(
                              text: "If you don't have an account, ",
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 16),
                              children: [
                                TextSpan(
                                  text: "signup",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    height: 16 / 13,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SignupScreen()),
                                      );
                                    },
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Padding(
                        //   padding: EdgeInsets.fromLTRB(40, 15, 0, 0),
                        //   child: RichText(
                        //     text: TextSpan(
                        //       text: "login  with, ",
                        //       style: const TextStyle(
                        //           color: Colors.black, fontSize: 16),
                        //       children: [
                        //         TextSpan(
                        //           text: "Phone Number",
                        //           style: const TextStyle(
                        //             color: Colors.black,
                        //             fontSize: 17,
                        //             height: 16 / 13,
                        //             fontWeight: FontWeight.bold,
                        //             decoration: TextDecoration.underline,
                        //           ),
                        //           recognizer: TapGestureRecognizer()
                        //             ..onTap = () {
                        //               Navigator.push(
                        //                 context,
                        //                 MaterialPageRoute(
                        //                     builder: (context) =>
                        //                         const PhoneNumberScreen()),
                        //               );
                        //             },
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const BottomWave(),
          ],
        ),
      ),
    );
  }
}
