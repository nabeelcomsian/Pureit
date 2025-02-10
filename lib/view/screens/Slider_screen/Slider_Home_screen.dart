import 'package:flutter/material.dart';
import 'package:pureit/view/screens/Slider_screen/Slider2.dart';
import 'package:pureit/view/screens/Slider_screen/Slider_1.dart';
import 'package:pureit/view/screens/Slider_screen/slider0.dart';
import 'package:pureit/view/screens/Slider_screen/welcome_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SliderHomeScreen extends StatelessWidget {
  const SliderHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const List<Widget> screens = [
      Slider0(),
      Slider1(),
      Slider2(),
      WelcomeScreen(),
    ];
    return Scaffold(
      body: CarouselSlider(
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 2),
          enlargeCenterPage: true,
          viewportFraction: 1.0,
        ),
        items: screens.map((screen) {
          return Builder(
            builder: (BuildContext context) {
              return screen;
            },
          );
        }).toList(),
      ),
    );
  }
}
