import 'package:flutter/cupertino.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_book/core/const/lists.dart';
import 'package:note_book/core/const/widget.dart';
import 'package:note_book/view/home_section/widget/search_container.dart';
import 'package:note_book/view/note_add_edit_section/note_add_edit_screen.dart';

import 'widget/notes_grid.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              spaceForHeight20,
            const  Branding(),
              spaceForHeight20,
              const SearchContainer(),
              spaceForHeight20,
              const NotesGrid()
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child:const Icon(Icons.add,size: 25,),
        onPressed: () {
        Navigator.pushNamed(context, 'NoteAddEdit Screen',arguments: AddOrEdit.addNote);
      },),
    );
  }
}

class Branding extends StatelessWidget {
  const Branding({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(
              style: GoogleFonts.inter(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.5),
              children: [
                const TextSpan(text: 'THI'),
                TextSpan(
                  text: 'N',
                  style: GoogleFonts.inter(
                      color: const Color.fromARGB(255, 84, 222, 84)),
                ),
                const TextSpan(text: 'K.')
              ]),
        ),
      ],
    );
  }
}

