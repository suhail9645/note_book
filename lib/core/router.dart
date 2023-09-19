import 'package:flutter/material.dart';
import 'package:note_book/view/login_and_register_section/login_register_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const LoginAndRegisterScreen(),
        );
         default:
         return  MaterialPageRoute(builder: (context) => const SizedBox(),);
    }
  }
}
