import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/const/lists.dart';
import '../../../core/const/widget.dart';
import '../../widget/primary_form.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 23),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Register\nNow',
                style: GoogleFonts.inika(
                    letterSpacing: 2,
                    fontSize: 45,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          spaceForHeight30,
          ...List.generate(
            2,
            (index) => PrimaryForm(
              title: loginFormTitles[index],
              hint: loginFormHints[index],
            ),
          ),
          spaceForHeight30,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 47,
                width: screenWidth * 0.50,
                decoration: BoxDecoration(
                  color: const Color(0xFF6885EB),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    'Register',
                    style: GoogleFonts.lato(
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}