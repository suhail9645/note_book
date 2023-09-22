
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/const/colors.dart';
import '../../core/const/widget.dart';

class PrimaryForm extends StatelessWidget {
  const PrimaryForm({
    super.key,
    required this.hint,
    required this.title,
  });
  final String hint;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: GoogleFonts.k2d(fontWeight: FontWeight.bold),
            )
          ],
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17), color: kFormColor),
          child: TextFormField(
            style: const TextStyle(
                fontSize: 16.0, height: 2.0, color: Colors.black),
            decoration: InputDecoration(
              contentPadding:const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
              hintText: hint,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
          ),
        ),
        spaceForHeight20,
      ],
    );
  }
}
