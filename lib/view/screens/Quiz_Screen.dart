import 'package:flutter/material.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 50),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '5/10',
            style: TextStyle(
                color: Color(0XFF1E1E1E),
                fontFamily: 'Montserrat',
                fontSize: 22,
                fontWeight: FontWeight.w500,
                height: 25 / 22),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            width: 350,
            height: 65,
            decoration: BoxDecoration(
                color: Color(0XFF044A73),
                borderRadius: BorderRadius.circular(25)),
            child: Center(
              child: Text(
                'Q: Do you have other filtration systems?',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0XFFFFFFFF),
                    fontFamily: 'Montserrat',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 20 / 16),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: 350,
            height: 60,
            decoration: BoxDecoration(
                color: Color(0XFFF6F6F6),
                borderRadius: BorderRadius.circular(54)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text(
                'a) Water softener',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color(0XFF1E1E1E),
                    fontFamily: 'Montserrat',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 20 / 16),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 350,
            height: 60,
            decoration: BoxDecoration(
                color: Color(0XFFF6F6F6),
                borderRadius: BorderRadius.circular(54)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text(
                'b) Reverse osmosis purifier',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color(0XFF1E1E1E),
                    fontFamily: 'Montserrat',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 20 / 16),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 350,
            height: 60,
            decoration: BoxDecoration(
                color: Color(0XFFF6F6F6),
                borderRadius: BorderRadius.circular(54)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text(
                'c) Under-sink filter',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color(0XFF1E1E1E),
                    fontFamily: 'Montserrat',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 20 / 16),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 350,
            height: 60,
            decoration: BoxDecoration(
                color: Color(0XFFF6F6F6),
                borderRadius: BorderRadius.circular(54)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text(
                'd) None of the above',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color(0XFF1E1E1E),
                    fontFamily: 'Montserrat',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 20 / 16),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 160,
                height: 58,
                decoration: BoxDecoration(
                    color: Color(0XFFF6F6F6),
                    borderRadius: BorderRadius.circular(54),
                    border: Border.all(color: Color(0XFF044A73), width: 1)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Text(
                    'Back',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0XFF044A73),
                        fontFamily: 'Montserrat',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 20 / 16),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: 160,
                height: 58,
                decoration: BoxDecoration(
                    color: Color(0XFF8FC123),
                    borderRadius: BorderRadius.circular(54),
                    border: Border.all(color: Color(0XFF044A73), width: 1)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Text(
                    'Next',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0XFFFFFFFF),
                        fontFamily: 'Montserrat',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 20 / 16),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
