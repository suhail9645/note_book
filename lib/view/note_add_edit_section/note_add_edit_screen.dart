import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_book/controller/controllers/note_controller.dart';
import 'package:note_book/core/const/colors.dart';
import 'package:note_book/core/const/widget.dart';
import 'package:note_book/model/note_model/note_model.dart';
import 'package:note_book/view/home_section/home_screen.dart';
import 'package:provider/provider.dart';

enum AddOrEdit { addNote, editNote }

class NoteAddEditScreen extends StatelessWidget {
  NoteAddEditScreen({super.key, required this.addOrEdit});
  final AddOrEdit addOrEdit;

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
                      Text(
                        'Content',
                        style: GoogleFonts.k2d(fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
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
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Consumer<NoteController>(
                                    builder: (context, value, child) {
                                  if (value.isSuccess) {
                                    WidgetsBinding.instance
                                        .addPostFrameCallback((timeStamp) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content:
                                              Text('Note Successfully added'),
                                        ),
                                      );
                                      Navigator.pop(context);
                                    });
                                  }
                                  if (!value.isLoading) {
                                    return InkWell(
                                      onTap: () {
                                        if (formKey.currentState!.validate()) {
                                          Provider.of<NoteController>(context,
                                                  listen: false)
                                              .addNoteToFireBase(note);
                                        }
                                      },
                                      child: Container(
                                        height: 45,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF689FF3),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'ADD NOTE',
                                            style: GoogleFonts.lato(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    );
                                  } else {
                                    return Container(
                                      height: 45,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF689FF3),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Center(
                                        child: Row(
                                          children: [
                                            Text(
                                              'Wait',
                                              style: GoogleFonts.lato(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const CircularProgressIndicator()
                                          ],
                                        ),
                                      ),
                                    );
                                  }
                                }),
                              ],
                            )
                          : Row(
                              children: [
                                Expanded(
                                  flex: 3,
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
                                spaceForWidth10,
                                Expanded(
                                  flex: 5,
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
                                ),
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
