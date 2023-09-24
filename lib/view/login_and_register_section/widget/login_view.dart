import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_book/core/const/widget.dart';

import '../../../core/const/lists.dart';
import '../../widget/primary_form.dart';

class LogiView extends StatelessWidget {
   LogiView({
    super.key,
  });
final TextEditingController _emailAddress=TextEditingController();
   final TextEditingController _password=TextEditingController();
  @override
  Widget build(BuildContext context) {
    List<TextEditingController>controllers=[_emailAddress,_password];
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 23),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Welcome\nBack',
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
              hint: loginFormHints[index], controller:controllers[index] ,
            ),
          ),
          spaceForHeight30,
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: 47,
                  decoration: BoxDecoration(
                    color: const Color(0xFFA9AEAF),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      'G',
                      style: GoogleFonts.lato(
                          fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              const Expanded(flex: 1, child: SizedBox()),
              Expanded(
                flex: 3,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'Home Screen');
                  },
                  child: Container(
                    height: 47,
                    decoration: BoxDecoration(
                      color: const Color(0xFF68D4EB),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        'Sign In',
                        style: GoogleFonts.lato(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
