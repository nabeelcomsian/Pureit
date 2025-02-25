import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Row(
        children: [
          /// Circular Avatar (Profile Picture)
          CircleAvatar(
            backgroundImage:
                AssetImage("assets/profile.png"), // Replace with your image
          ),

          SizedBox(width: 10), // Spacing

          /// Text Section (Main Heading & Subheading)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Hello, Nabeel!",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Color(0Xff1E1E1E),
                  height: 24 / 14,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "Welcome back!",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Color(0Xff044A73),
                  height: 28 / 16,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          Spacer(), // Pushes logo to the right

          /// App Logo at the right-most corner
          Image.asset(
            "assets/icon.png", // Replace with your app logo
            height: 50,
            width: 45, // Adjust as needed
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
