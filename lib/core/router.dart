import 'package:flutter/material.dart';
import 'package:note_book/controller/controllers/note_controller.dart';
import 'package:note_book/model/note_model/note_model.dart';
import 'package:note_book/view/home_section/home_screen.dart';
import 'package:note_book/view/login_and_register_section/login_register_screen.dart';
import 'package:note_book/view/note_add_edit_section/note_add_edit_screen.dart';
import 'package:provider/provider.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const LoginAndRegisterScreen(),
        );
      case 'Home Screen':
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case 'NoteAddEdit Screen':
        return MaterialPageRoute(builder: (context) {
         
          NoteAddEditScreen noteAddEditScreen=settings.arguments as NoteAddEditScreen;
          return ChangeNotifierProvider(
              create: (context) => NoteController(),
              child: NoteAddEditScreen(
                addOrEdit:noteAddEditScreen.addOrEdit,
                noteForEdit: noteAddEditScreen.noteForEdit,
              ));
        });
      default:
        return MaterialPageRoute(
          builder: (context) => const SizedBox(child: Center(child: Text('No pages'),),),
        );
    }
  }
}
