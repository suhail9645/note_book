

import 'dart:math';

import 'package:flutter/material.dart';

class StarPainter extends CustomPainter {
  late Paint painter;
  final Color color;
  StarPainter(this.color) {
    painter = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
  }
  @override
  void paint(Canvas canvas, Size size) {
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final double radius = size.width / 4;

    final double rotation = -pi / 10.0;

    Path path = Path();

    for (int i = 0; i < 5; i++) {
      double x = centerX + cos(2 * pi * i / 5 + rotation) * radius;
      double y = centerY + sin(2 * pi * i / 5 + rotation) * radius;

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    path.close();

    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
