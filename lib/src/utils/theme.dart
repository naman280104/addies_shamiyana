import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme{
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: TextTheme(
      displayLarge: GoogleFonts.notoSans(
          color:Colors.black87,
          fontWeight: FontWeight.w500,
          fontSize: 40
      ),
      displayMedium: GoogleFonts.notoSans(
        color:Colors.black87,
        fontSize: 40
      ),
      displaySmall: GoogleFonts.montserrat(
        color: Colors.black54,
        fontSize: 20
      ),
      titleSmall: GoogleFonts.poppins(
        color: Colors.black54,
        fontSize: 24,
      ),
      titleLarge: GoogleFonts.poppins(
        color: Colors.black87,
        fontWeight: FontWeight.w500,
        fontSize: 24,
      ),
      bodySmall: GoogleFonts.poppins(
        color: Colors.black87,
        fontWeight: FontWeight.w500,
        fontSize: 15,
      ),
    ),
    //
    primarySwatch: Colors.orange,



  );
}