import 'package:flutter/material.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 35,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 260,
                height: 320,
                decoration: BoxDecoration(
                    color: Color(0XFF044A73),
                    borderRadius: BorderRadius.circular(25)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Your Score',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Montserrat',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          height: 21 / 16),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      '6/10',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Montserrat',
                          fontSize: 70,
                          fontWeight: FontWeight.w600,
                          height: 26 / 70),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Water quality: Medium',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Montserrat',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          height: 20 / 16),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: -25,
                left: -80,
                child: Image.asset(
                  'assets/ScoreBg.png',
                  width: 300,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 80,
          ),
          Container(
            width: 350,
            height: 50,
            decoration: BoxDecoration(
                color: Color(0XFF8FC123),
                borderRadius: BorderRadius.circular(54)),
            child: Center(
              child: Text(
                'Go to Dashboard',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    height: 20 / 16),
              ),
            ),
          )
        ],
      ),
    );
  }
}
