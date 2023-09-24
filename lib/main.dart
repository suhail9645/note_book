import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_book/core/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppRouter appRouter=AppRouter();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: TextTheme(
          titleMedium: GoogleFonts.roboto(fontSize: 15,fontWeight: FontWeight.bold),
          titleSmall: GoogleFonts.roboto(fontSize: 13,fontWeight: FontWeight.w400)
        ).apply(
              bodyColor: Colors.black,
              displayColor: Colors.black,
            ),
        useMaterial3: true,
      ),
      onGenerateRoute: appRouter.onGenerateRoute,
      
    );
  }
}
