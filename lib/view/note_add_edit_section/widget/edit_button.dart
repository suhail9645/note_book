
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../controller/controllers/note_controller.dart';
import '../../../model/note_model/note_model.dart';
import 'loading_container.dart';

class EditButton extends StatelessWidget {
  const EditButton({
    super.key,
    required this.note,
    required this.noteForEdit,
  });

  final Note note;
  final Note? noteForEdit;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Consumer<NoteController>(
        builder: (context, value, child) {
          
        if(!value.isLoading){
        return InkWell(
          onTap: () {
           if(note.content==''){
            note.content=noteForEdit!.content;
           }
           if(note.heading==''){
            note.heading=noteForEdit!.heading;
           }
            Provider.of<NoteController>(context,listen: false).updateNote(noteForEdit!.docId!, note);
           int count = 0;
                    Navigator.popUntil(context,
                        (route) {
                      return count++ == 2;
                    });
          },
          child: Container(
            height: 45,
            decoration: BoxDecoration(
              color: const Color(0xFF689FF3),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text(
                'EDIT NOTE',
                style: GoogleFonts.lato(
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
        }else{
          return const LoadingContainer();
        }
        }
      ),
    );
  }
}
