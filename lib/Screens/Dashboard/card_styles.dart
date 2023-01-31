import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardStyles{
  static Color bgColor = Colors.black;
  static Color mainColor = Color(0xffF2F5F9);
  static Color accentColor = Colors.teal.shade400;

  //giving cards different colors
  static List<Color> CardColor = [
    Colors.white,
    Colors.purple.shade100,
    Colors.pink.shade100,
    Colors.orange.shade100,
    Colors.yellow.shade100,
    Colors.greenAccent.shade100,
    Colors.blue.shade100,
    Colors.blueGrey.shade100,
  ];

  //textStyles for card
  static TextStyle mainTitle =
      GoogleFonts.roboto(fontSize: 18.0, fontWeight: FontWeight.bold);

  static TextStyle mainContent =
  GoogleFonts.quicksand(fontSize: 16.0, fontWeight: FontWeight.normal);

  static TextStyle date =
  GoogleFonts.roboto(fontSize: 13.0, fontWeight: FontWeight.w500);

}