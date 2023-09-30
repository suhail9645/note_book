import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_book/model/user/user_model.dart';

import '../../core/const/colors.dart';
import '../../core/const/widget.dart';

class PrimaryForm extends StatelessWidget {
  const PrimaryForm({
    super.key,
    required this.hint,
    required this.title,
    required this.controller,
    required this.userMOdel,
  });
  final String hint;
  final String title;
  final TextEditingController controller;
  final UserMOdel userMOdel;
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
        TextFormField(
          onChanged: (value) {
            if(title=='Email'){
              userMOdel.email=value;
            }else{
              userMOdel.password=value;
            }
          },
          controller: controller,
          style: const TextStyle(
              fontSize: 16.0, height: 2.0, color: Colors.black),
          decoration: InputDecoration(
            filled: true,
            fillColor: kFormColor,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
               borderSide:const BorderSide(
                width: 0, 
                style: BorderStyle.none,
            ),
            ),
            // focusedBorder: InputBorder.none,
            // enabledBorder: InputBorder.none,
            // errorBorder: InputBorder.none,
            // disabledBorder: InputBorder.none,
          ),
          validator: (_) => title == 'Email'
              ? userMOdel.validateEmail()
              : userMOdel.validatePassword(),
        ),
        spaceForHeight20,
      ],
    );
  }
}
