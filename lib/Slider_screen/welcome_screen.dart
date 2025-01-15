import 'package:flutter/material.dart';
import 'package:pureit/Auth/Login_Screen.dart';
import 'package:pureit/Auth/Signup_Screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    // print('screen width $screenwidth');
    // print('screen height $screenheight');
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: screenwidth,
          height: screenheight,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(children: [
                  Container(
                    width: screenwidth * 0.3,
                    height: screenwidth * 0.3,
                    decoration: BoxDecoration(
                      color: const Color(0xAA8FC123),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(
                          screenwidth * 0.5,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: screenwidth * 0.03,
                    ),
                    child: const Text(
                      "Welcome!",
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                          height: 36.57 / 30,
                          color: Color(0xAA003955)),
                    ),
                  ),
                ]),
                Container(
                  width: screenwidth,
                  height: screenwidth,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/p1.png'), fit: BoxFit.cover),
                  ),
                  // foregroundDecoration: BoxDecoration(
                  //     // color: Colors.black,
                  //     ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          0, 0, screenwidth * 0.55, screenwidth * 0.65),
                      child: const Text(
                        'Calculate and\n track your Purit\n filter life esily.!',
                        style: TextStyle(
                            color: Color(0xAA003955),
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            height: 21 / 18),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: screenwidth * 0.9,
                  height: screenheight / 16,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: const BorderSide(color: Color(0xff003955)),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ));
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 16,
                        height: 19.5 / 16,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: screenwidth * 0.9,
                  height: screenheight / 16,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xAA8FC123),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: const BorderSide(color: Color(0xff003955)),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignupScreen()),
                      );
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 16,
                        height: 19.5 / 16,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.grey, // Line color
                          thickness: 1, // Line thickness
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.0), // Space around "OR"
                        child: Text(
                          'OR',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.grey, // Line color
                          thickness: 1, // Line thickness
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: screenwidth * 0.13,
                        height: screenwidth * 0.13,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: const Color(0xff003955),
                            width: 1,
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'f',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: 1,
                                fontSize: 40,
                                color: Color(0xff003955),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        width: screenwidth * 0.13,
                        height: screenwidth * 0.13,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: const Color(0xff003955),
                            width: 1,
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'G',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: 1,
                                fontSize: 38,
                                color: Color(0xff003955),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        width: screenwidth * 0.13,
                        height: screenwidth * 0.13,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: const Color(0xff003955),
                            width: 1,
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'X',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: 1,
                                fontSize: 40,
                                color: Color(0xff003955),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
