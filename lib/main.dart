<<<<<<< HEAD
=======
import 'package:diary/Screens/Auth/main_page.dart';
import 'package:firebase_core/firebase_core.dart';
>>>>>>> master
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Screens/Dashboard/home_screen.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
<<<<<<< HEAD
      home: HomePage(),
=======
      theme: ThemeData(
        textTheme: GoogleFonts.quicksandTextTheme(),
      ),
      home: MainPage(),
>>>>>>> master
    );
  }
}
