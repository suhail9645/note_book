
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_book/core/const/colors.dart';
import 'package:note_book/core/const/widget.dart';
import 'package:note_book/model/note_model/note_model.dart';
import 'package:note_book/view/home_section/home_screen.dart';
import 'widget/delete_button.dart';
import 'widget/edit_button.dart';
import 'widget/note_add_button.dart';

enum AddOrEdit { addNote, editNote }

class NoteAddEditScreen extends StatelessWidget {
  NoteAddEditScreen({super.key, required this.addOrEdit, this.noteForEdit});
  final AddOrEdit addOrEdit;
  final Note? noteForEdit;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Note note = Note(heading: '', content: '');
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenWidth = size.width;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: const Alignment(1.2, -0.78),
              child: Container(
                height: screenWidth * 0.25,
                width: screenWidth * 0.25,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 230, 216, 64)),
              ),
            ),
            Align(
              alignment: const Alignment(-1.20, 0.78),
              child: Container(
                height: screenWidth * 0.28,
                width: screenWidth * 0.28,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 110, 194, 217),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      spaceForHeight30,
                      const Branding(),
                      spaceForHeight20,
                      Text(
                        'Title',
                        style: GoogleFonts.k2d(fontWeight: FontWeight.bold),
                      ),
                      Center(
                        child: TextFormField(
                          initialValue: noteForEdit?.heading,
                          style: GoogleFonts.inter(
                              fontSize: 18, fontWeight: FontWeight.w600),
                          onChanged: (value) {
                            note.heading = value;
                          },
                          maxLines: 3,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: kFormColor,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 0),
                              hintText: 'Heading',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: const BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              )),
                          validator: (value) {
                            if (value == null || value == '') {
                              return 'Heading required';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      spaceForHeight10,
                      Row(
                        children: [
                          Text(
                            'Content',
                            style: GoogleFonts.k2d(fontWeight: FontWeight.bold),
                          ),const Spacer(),
                          
                        ],
                      ),
                      TextFormField(
                          initialValue: noteForEdit?.content,
                          onChanged: (value) {
                            note.content = value;
                          },
                          maxLines: 15,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: kFormColor,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 0),
                              hintText: 'Content',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: const BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              )),
                          validator: (value) {
                            if (value == null || value == '') {
                              return 'Content required';
                            } else {
                              return null;
                            }
                          }),
                      spaceForHeight20,
                      addOrEdit == AddOrEdit.addNote
                          ? NoteAddButton(formKey: formKey, note: note)
                          : Row(
                              children: [
                                DeletButton(noteForEdit: noteForEdit),
                                spaceForWidth10,
                                EditButton(note: note, noteForEdit: noteForEdit),
                              ],
                            ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
