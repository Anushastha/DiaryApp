import 'dart:async';
import 'package:diary/Screens/Auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  @override
  void initState(){
    super.initState();

    Timer(Duration(seconds:5), () =>
        Navigator.of(context).pushNamed('/login')
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 50),
          Text(
            'Welcome',
            style: GoogleFonts.cookie(
              textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
            ),
          ),

          //picture
          Lottie.asset(
            'assets/animations/girl.json',
            height: 300,
            repeat: true,
          ),

          //message
          Text(
            'A collection of notes from your life.',
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(height: 60),

          //get started button
          // OutlinedButton(
          //   child: Text(
          //     'Get Started',
          //     style: TextStyle(
          //       fontSize: 18,
          //     ),
          //   ),
          //   onPressed: () {
          //     Navigator.of(context).pushNamed('/register');
          //   },
          //   style: OutlinedButton.styleFrom(
          //     padding: EdgeInsets.symmetric(horizontal: 20.0),
          //     fixedSize: Size(180, 60),
          //     backgroundColor: Colors.white,
          //     foregroundColor: Color(0xFF26A69A),
          //     side: BorderSide(color: Color(0xFF26A69A), width: 2),
          //     shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(30)),
          //   ),
          //
          // ),
        ],
      ),
    )
    );
  }
}
