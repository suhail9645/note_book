
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_book/view/note_add_edit_section/note_add_edit_screen.dart';

class NoteViewAlert extends StatelessWidget {
  const NoteViewAlert({
    super.key,
    required this.color,
    required this.screenHight,
  });

  final Color color;
  final double screenHight;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: color,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Product design'),
        ],
      ),
      content: Container(
        constraints: BoxConstraints(maxHeight: screenHight * 0.50),
        child: const SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Reply to emails'
                'Prepare presentation slides for the marketing meeting'
                'Conduct research on competitor products'
                'Schedule and plan customer interviews',
              ),
            ],
          ),
        ),
      ),
      actions: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, 'NoteAddEdit Screen',arguments: AddOrEdit.editNote);
          },
          child: Container(
            height: 44,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 103, 103, 224),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text(
                'Edit',
                style:
                    GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
