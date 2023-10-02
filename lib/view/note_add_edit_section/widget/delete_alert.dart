
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../controller/controllers/note_controller.dart';
import '../../../model/note_model/note_model.dart';

class DeleteAlert extends StatelessWidget {
  const DeleteAlert({
    super.key,
    required this.noteForEdit,
  });

  final Note? noteForEdit;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Are You Sure',
          style: GoogleFonts.ubuntu(
              fontWeight: FontWeight.bold)),
      content: Text(
          'Delete ${noteForEdit?.heading}',
          style: GoogleFonts.ubuntu(
              fontWeight: FontWeight.w600,
              fontSize: 17)),
      actions: [
        InkWell(
          onTap: () {},
          child: Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(
                          17),
                  color:
                      const Color.fromARGB(
                          255,
                          124,
                          244,
                          54)),
              child: Center(
                  child: Text(
                'NO',
                style: GoogleFonts.inter(
                    fontWeight:
                        FontWeight.w600),
              ))),
        ),
        InkWell(
          onTap: () {
            Provider.of<NoteController>(
                    context,
                    listen: false)
                .deleteNote(
                    noteForEdit!.docId!);
            int count = 0;
            Navigator.popUntil(context,
                (route) {
              return count++ == 3;
            });
           
          },
          child: Container(
            height: 40,
            width: 100,
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(
                        17),
                color: const Color.fromARGB(
                    255, 244, 95, 54)),
            child: Center(
              child: Text(
                'YES',
                style: GoogleFonts.inter(
                    fontWeight:
                        FontWeight.w600),
              ),
            ),
          ),
        )
      ],
    );
  }
}
