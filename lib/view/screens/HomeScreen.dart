import 'package:flutter/material.dart';
import 'package:pureit/CustomFliterIndicator.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 13, 106, 160),
                borderRadius: BorderRadius.circular(25),
              ),
              width: 350,
              height: 550,
              child: Stack(
                children: [
                  Container(
                      width: 110,
                      height: 200,
                      //alignment: Alignment.center,
                      margin: EdgeInsets.fromLTRB(115, 100, 0, 0),
                      child: Image.asset('assets/filter.png')),
                  Container(
                    margin: EdgeInsets.fromLTRB(90, 60, 0, 0),
                    width: 160,
                    height: 160,
                    child: CustomFliterIndicator(),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(105, 310, 0, 0),
                    child: Text(
                      '21 more days left!\n(233 litters)',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Montserrat',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          height: 18 / 14),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(60, 380, 0, 0),
                    child: Container(
                      width: 230,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Color(0XFF8FC123),
                          borderRadius: BorderRadius.circular(54)),
                      child: Center(
                        child: Text(
                          'I changes the Filter',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              height: 18 / 14),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(60, 450, 0, 0),
                    child: Container(
                      width: 230,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 13, 106, 160),
                        //borderRadius: BorderRadius.circular(54),
                        borderRadius:
                            BorderRadius.circular(54), // Set the border radius
                        border: Border.all(
                          // Add the border
                          color: Colors.white, // Border color
                          width: 1.0, // Border width
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Buy Spare Parts',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              height: 18 / 14),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 350,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  // Add the border
                  color: Color(0xFFE7E7E7), // Border color
                  width: 1.0, // Border width
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Text(
                      'Your Information',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0XFF1E1E1E),
                          fontFamily: 'Montserrat',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          height: 26 / 20),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 155,
                        height: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                              // Add the border
                              color: Color(0xFF8FC123), // Border color
                              width: 1.5 // Border width
                              ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.opacity,
                              color: Color(0xFF96C531),
                              size: 55, // Adjust the size as needed
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Edit or view your\n water info',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color(0XFF1E1E1E),
                                  fontFamily: 'Montserrat',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  height: 25 / 14),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 155,
                        height: 140,
                        decoration: BoxDecoration(
                          color: Color(0XFFF6F6F6),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '12',
                              style: TextStyle(
                                  color: Color(0XFF044A73),
                                  fontFamily: 'Montserrat',
                                  fontSize: 40,
                                  fontWeight: FontWeight.w600,
                                  height: 26 / 40),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Filters Changed',
                              style: TextStyle(
                                  color: Color(0XFF1E1E1E),
                                  fontFamily: 'Montserrat',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  height: 25 / 14),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
