
import 'package:flutter/material.dart';

class CustomTraiangle extends CustomPainter {
 late Paint painter;
 final Color color;
  CustomTraiangle(this.color){
painter = Paint()
    ..color =color
    ..style = PaintingStyle.fill;
  }
  
  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();

    path.moveTo(size.width / 2, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.height, size.width);
    path.close();
    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
