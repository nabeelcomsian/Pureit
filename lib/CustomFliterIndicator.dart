import 'dart:ui';

import 'package:flutter/material.dart';

class CustomFliterIndicator extends StatelessWidget {
  const CustomFliterIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Outer Circle (Transparent top half, white bottom half)
          CustomPaint(
            size: const Size(200, 200),
            painter: HalfCirclePainter(),
          ),
          // Inner Circle (Same as background)
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              // color: Colors.blue.shade900, // Same as background color
            ),
          ),
          // Text in center
          const Positioned(
            child: Text(
              '50%',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom Painter to create the bottom half white ring
class HalfCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint transparentPaint = Paint()
      ..color = Colors.white.withOpacity(0.2) // Transparent for top half
      ..style = PaintingStyle.stroke
      ..strokeWidth = 40; // Width of the ring

    Paint whitePaint = Paint()
      ..color = Colors.white // White for bottom half
      ..style = PaintingStyle.stroke
      ..strokeWidth = 40;

    Rect rect = Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width / 2);

    // Draw top half transparent
    canvas.drawArc(rect, -3.14, 3.14, false, transparentPaint);

    // Draw bottom half white
    canvas.drawArc(rect, 0, 3.14, false, whitePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
