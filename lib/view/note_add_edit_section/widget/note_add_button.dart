
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../controller/controllers/note_controller.dart';
import '../../../model/note_model/note_model.dart';
import 'loading_container.dart';

class NoteAddButton extends StatelessWidget {
  const NoteAddButton({
    super.key,
    required this.formKey,
    required this.note,
  });

  final GlobalKey<FormState> formKey;
  final Note note;

  @override
  Widget build(BuildContext context) {
    return Row(
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
              return const LoadingContainer();
            }
          }),
        ],
      );
  }
}
