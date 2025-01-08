// lib/temp_icon_generator.dart
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Container(
        color: const Color(0xFF039944),
        child: CustomPaint(
          painter: FoodgoIconPainter(),
          size: const Size(512, 512),
        ),
      ),
    ),
  );
}

class FoodgoIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    // Draw stylized 'F' with food elements
    final Path path = Path();

    // Main F stem
    path.moveTo(size.width * 0.3, size.height * 0.2);
    path.lineTo(size.width * 0.3, size.height * 0.8);
    path.lineTo(size.width * 0.4, size.height * 0.8);
    path.lineTo(size.width * 0.4, size.height * 0.2);

    // Top bar
    path.moveTo(size.width * 0.3, size.height * 0.2);
    path.lineTo(size.width * 0.7, size.height * 0.2);
    path.lineTo(size.width * 0.7, size.height * 0.3);
    path.lineTo(size.width * 0.3, size.height * 0.3);

    // Middle bar
    path.moveTo(size.width * 0.3, size.height * 0.45);
    path.lineTo(size.width * 0.6, size.height * 0.45);
    path.lineTo(size.width * 0.6, size.height * 0.55);
    path.lineTo(size.width * 0.3, size.height * 0.55);

    canvas.drawPath(path, paint);

    // Add a leaf element
    final Path leaf = Path();
    leaf.moveTo(size.width * 0.7, size.height * 0.3);
    leaf.quadraticBezierTo(
      size.width * 0.8,
      size.height * 0.25,
      size.width * 0.75,
      size.height * 0.2,
    );
    leaf.quadraticBezierTo(
      size.width * 0.7,
      size.height * 0.15,
      size.width * 0.65,
      size.height * 0.2,
    );

    canvas.drawPath(leaf, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
