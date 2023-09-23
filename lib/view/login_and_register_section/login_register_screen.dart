
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../widget/custom_triangle.dart';
import 'widget/login_view.dart';
import 'widget/register_view.dart';

class LoginAndRegisterScreen extends StatefulWidget {
  const LoginAndRegisterScreen({super.key});

  @override
  State<LoginAndRegisterScreen> createState() => _LoginAndRegisterScreenState();
}

class _LoginAndRegisterScreenState extends State<LoginAndRegisterScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController aController =
      AnimationController(vsync: this, duration: const Duration(seconds: 5))
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
                  alignment: const Alignment(-0.80, -0.89),
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
                    height: screenHight * 0.65,
                    width: double.infinity,
                    // color: const Color.fromARGB(107, 255, 193, 7),
                    child: PageView(
                      controller: controller,
                      children: [
                        const LogiView(),
                        RegisterView(screenWidth: screenWidth)
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

