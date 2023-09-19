import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_book/core/const/widget.dart';
import 'dart:math' as math;
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widget/custom_traingle.dart';

class LoginAndRegisterScreen extends StatefulWidget {
  const LoginAndRegisterScreen({super.key});

  @override
  State<LoginAndRegisterScreen> createState() => _LoginAndRegisterScreenState();
}

class _LoginAndRegisterScreenState extends State<LoginAndRegisterScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController aController =
      AnimationController(vsync: this, duration:const Duration(seconds: 5))
        ..repeat();
  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();
    Size size = MediaQuery.of(context).size;
    double screenHight = size.height;
    double screenWidth = size.width;
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Stack(
              children: [
                Align(
                  alignment: const Alignment(0, -0.95),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 30,
                      ),
                      Text(
                        'Log In',
                        style: GoogleFonts.inter(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Text(
                        'Register',
                        style: GoogleFonts.inter(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment(-0.80, -0.89),
                  child: SmoothPageIndicator(
                    controller: controller,
                    count: 2,
                    effect: const WormEffect(
                        spacing: 30,
                        activeDotColor: Colors.red,
                        radius: 10,
                        dotHeight: 3,
                        dotWidth: 45,
                        dotColor: Colors.transparent),
                  ),
                ),
                Align(
                  alignment: const Alignment(-0.77, -0.87),
                  child: AnimatedBuilder(
                      animation: aController,
                      builder: (_, child) {
                        return Transform.rotate(
                          angle: aController.value * 2 * math.pi,
                          child: child,
                        );
                      },
                      child: CustomPaint(
                        painter: StarPainter(Color(0xFF63C2B7)),
                        size: const Size(150, 150),
                      )),
                ),
                Align(
                  alignment: const Alignment(1.3, -0.90),
                  child: Container(
                    height: screenWidth * 0.25,
                    width: screenWidth * 0.25,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xFF8DF48B)),
                  ),
                ),
                Align(
                  alignment: const Alignment(-1.25, 1.1),
                  child: Container(
                    height: screenWidth * 0.35,
                    width: screenWidth * 0.35,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xFFF49696)),
                  ),
                ),
                Align(
                  alignment: const Alignment(0.40, 0.67),
                  child: AnimatedBuilder(
                      animation: aController,
                      builder: (_, child) {
                        return Transform.rotate(
                          angle: aController.value * 2 * math.pi,
                          child: child,
                        );
                      },
                      child: CustomPaint(
                        painter: StarPainter(Color(0xFFF497EB)),
                        size: const Size(150, 150),
                      )),
                ),
                Align(
                  alignment: const Alignment(0, -0.30),
                  child: Container(
                    height: screenHight * 0.70,
                    width: double.infinity,
                    // color: const Color.fromARGB(107, 255, 193, 7),
                    child: PageView(
                      controller: controller,
                      children: [
                        Container(
                          color: Color.fromARGB(86, 43, 203, 48),
                        ),
                        Container(
                          color: Color.fromARGB(86, 219, 139, 46),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}

class StarPainter extends CustomPainter {
  late Paint painter;
  final Color color;
  StarPainter(this.color){
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
class StarPainter2 extends CustomPainter {
  final Color fillColor;
  final double cornerRadius;

  StarPainter2({
    required this.fillColor,
    required this.cornerRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = fillColor
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(size.width * 0.7, size.height * 0.3)
      ..lineTo(size.width, size.height * 0.4)
      ..lineTo(size.width * 0.8, size.height * 0.7)
      ..lineTo(size.width * 0.9, size.height)
      ..lineTo(size.width / 2, size.height * 0.8)
      ..lineTo(size.width * 0.1, size.height)
      ..lineTo(size.width * 0.2, size.height * 0.7)
      ..lineTo(0, size.height * 0.4)
      ..lineTo(size.width * 0.3, size.height * 0.3)
      ..close();

    canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width, size.height),
          Radius.circular(cornerRadius),
        ),
        paint);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}