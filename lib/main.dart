import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_book/controller/controllers/auth_controller.dart';
import 'package:note_book/controller/controllers/note_controller.dart';
import 'package:note_book/controller/controllers/search_controller.dart';
import 'package:note_book/core/router.dart';
import 'package:provider/provider.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppRouter appRouter=AppRouter();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthController(),),
        ChangeNotifierProvider(create: (context) => NoteController(),),
        ChangeNotifierProvider(create: (context) => SearchResultController(),)
      ],
      child: MaterialApp(
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
        
      ),
    );
  }
}
