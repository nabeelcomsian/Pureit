import 'package:flutter/material.dart';

class Slider0 extends StatelessWidget {
  const Slider0({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height,
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 46, 68, 3),
                  Color.fromARGB(255, 76, 104, 17),
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              ),
            ),
            Positioned(
              top: 0.0,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.sizeOf(context).width / 2 - 233 / 2,
                    vertical: MediaQuery.sizeOf(context).height / 2 - 233 / 2),
                child: const SizedBox(
                  width: 233,
                  height: 233,
                  child: Image(
                    image: AssetImage('assets/App_logo.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  MediaQuery.sizeOf(context).width / 3.3, 750, 0, 0),
              child: const Text(
                'Purit App',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromARGB(255, 238, 255, 224),
                    fontFamily: 'Montserrat',
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    height: 30 / 32),
              ),
            )
          ],
        ),
      ),
    );
  }
}
