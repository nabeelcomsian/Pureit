
import 'package:flutter/material.dart';

class TopContainer extends StatelessWidget {
  const TopContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width * 0.3, 120, 0, 0),
      child: const SizedBox(
        //color: Colors.black,
        width: 160,
        height: 40,
        child:  Image(image: AssetImage('assets/logo.png')),
      ),
    );
  }
}
