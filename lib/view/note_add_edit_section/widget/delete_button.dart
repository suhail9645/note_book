


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../model/note_model/note_model.dart';
import 'delete_alert.dart';

class DeletButton extends StatelessWidget {
  const DeletButton({
    super.key,
    required this.noteForEdit,
  });

  final Note? noteForEdit;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => DeleteAlert(noteForEdit: noteForEdit),
          );
        },
        child: Container(
          height: 45,
          decoration: BoxDecoration(
            color: const Color.fromARGB(
                255, 240, 80, 48),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text(
              'DELETE',
              style: GoogleFonts.lato(
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
