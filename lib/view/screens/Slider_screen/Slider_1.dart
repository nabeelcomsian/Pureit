import 'package:flutter/material.dart';

class Slider1 extends StatelessWidget {
  const Slider1({super.key});

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
                Colors.white,
                Color.fromARGB(255, 173, 212, 87),
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            ),
          ),
          Positioned(
            top: 0,
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height,
              child: const Opacity(
                opacity: 0.20,
                child: Image(
                  image: AssetImage('assets/background.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(70, 500, 0, 0),
            child: Text(
              'Welcome to the\n Purit app!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromARGB(255, 238, 255, 224),
                  fontFamily: 'Montserrat',
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  height: 32 / 32),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(38, 570, 0, 0),
            child: Text(
              'Calculate and track your filter life easily.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromARGB(255, 238, 255, 224),
                  fontFamily: 'Montserrat',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  height: 32 / 16),
            ),
          ),
        ],
      ),
    ));
  }
}
