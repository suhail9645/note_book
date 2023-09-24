import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_book/core/const/widget.dart';
import 'package:note_book/view/home_section/home_screen.dart';
enum AddOrEdit{
  addNote,
  editNote
}

class NoteAddEditScreen extends StatelessWidget {
  const NoteAddEditScreen({super.key, required this.addOrEdit});
  final AddOrEdit  addOrEdit;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHight = size.height;
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
                    Container(
                      height: 90,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFFB0E9CA),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Center(
                        child: TextFormField(
                          maxLines: 3,
                          decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                            hintText: 'Heading',
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    spaceForHeight10,
                    Text(
                      'Content',
                      style: GoogleFonts.k2d(fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: screenHight * 0.50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextFormField(
                          maxLines: 17,
                          decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                            hintText: 'Content',
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                        ),
                    ),
                    spaceForHeight20,
                addOrEdit==AddOrEdit.addNote? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 45,
                        width: 150,
                        decoration: BoxDecoration(
                          color: const Color(0xFF689FF3),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            'ADD NOTE',
                            style: GoogleFonts.lato(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ):Row(
                  
                    children: [
                       Expanded(
                        flex: 3,
                         child: Container(
                          height: 45,
                         
                          decoration: BoxDecoration(
                            color:const Color.fromARGB(255, 240, 80, 48),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Text(
                              'DELETE',
                              style: GoogleFonts.lato(
                                  fontSize: 20, fontWeight: FontWeight.bold),
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
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],),
                
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
