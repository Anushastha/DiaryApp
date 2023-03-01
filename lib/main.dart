import 'package:diary/Screens/Auth/forgot_pass_page.dart';
import 'package:diary/Screens/Auth/login_page.dart';
import 'package:diary/Screens/Auth/register_page.dart';
import 'package:diary/Screens/Dashboard/entry.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Screens/Dashboard/calender.dart';
import 'Screens/Dashboard/landing.dart';
import 'Screens/Dashboard/signOut.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        textTheme: GoogleFonts.quicksandTextTheme(),
      ),
      home: LandingPage(),
      // home:  FirebaseAuth.instance.currentUser == null ? LoginPage() : HomePage(),
      // initialRoute: "/landing",
      routes: {
        "/landing" :(BuildContext context) => LandingPage(),
        "/login" :(BuildContext context) => LoginPage(),
        "/register" :(BuildContext context) => RegisterPage(),
        "/forgot_pass" :(BuildContext context) => ForgotPasswordPage(),
        "/sign_out" :(BuildContext context) => SignOut(),
        "/entry" :(BuildContext context) => Entry(),
        "/calender" :(BuildContext context) => Calender(),
      },
    );
  }
}