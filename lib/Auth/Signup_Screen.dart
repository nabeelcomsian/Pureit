import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:pureit/utils/utils.dart';
import 'package:pureit/view/Component/Bottom_Wave.dart';
import 'package:pureit/view/Component/CustomTextField.dart';
import 'package:pureit/view/Component/Top_Container.dart';
import 'package:pureit/Auth/Login_Screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool loading = false;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void signup() {
    setState(() {
      loading = true;
    });
    _auth
        .createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.toString().trim())
        .then((value) {
      setState(() {
        loading = false;
      });
    }).onError((error, stackTrace) {
      setState(() {
        loading = false;
      });
      Utils.toastMessage(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    // Check if the keyboard is visible
    bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      resizeToAvoidBottomInset: true, // Allow the screen to resize for keyboard
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TopContainer(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 50, 15, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'SignUp',
                            style: TextStyle(
                              color: Color(0xff262626),
                              fontFamily: 'Montserrat',
                              fontSize: 34,
                              fontWeight: FontWeight.w600,
                              height: 41.45 / 34,
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'Enter your credentials to SignUp',
                            style: TextStyle(
                              color: Color(0xff8C8C8C),
                              fontFamily: 'Montserrat',
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              height: 18 / 15,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Column(
                            children: [
                              TextFormField(
                                controller: nameController,
                                decoration: customInputDecoration(
                                    'Enter your Name', Icons.person),
                              ),
                              const SizedBox(height: 8),
                              TextFormField(
                                controller: emailController,
                                decoration: customInputDecoration(
                                    'Enter Email', Icons.mail),
                              ),
                              const SizedBox(height: 8),
                              TextFormField(
                                controller: phoneNumberController,
                                decoration: customInputDecoration(
                                    'Enter your Phone Number', Icons.call),
                              ),
                              const SizedBox(height: 8),
                              TextFormField(
                                controller: passwordController,
                                decoration: customInputDecoration(
                                    'Enter Password', Icons.lock),
                              ),
                              const SizedBox(height: 8),
                              TextFormField(
                                controller: confirmPasswordController,
                                decoration: customInputDecoration(
                                    'Confirm Password', Icons.lock),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: 340,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff8FC123),
                              ),
                              onPressed: signup,
                              child: loading == true
                                  ? const CircularProgressIndicator(
                                      strokeAlign: 1,
                                    )
                                  : const Text(
                                      'Signup',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Montserrat',
                                        fontSize: 16,
                                        height: 19.5 / 16,
                                      ),
                                    ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(40, 5, 0, 0),
                            child: RichText(
                              text: TextSpan(
                                text: "Already  have an account, ",
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 16),
                                children: [
                                  TextSpan(
                                    text: "signin",
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
                                                  const LoginScreen()),
                                        );
                                      },
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Conditionally render the BottomWave
            if (!isKeyboardVisible) const BottomWave(),
          ],
        ),
      ),
    );
  }
}
