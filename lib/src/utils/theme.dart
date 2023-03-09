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
    primarySwatch: MaterialColor(
      0xFFFFB74D,
      <int, Color>{
        50: Color(0xFFFFF3E0),
        100: Color(0xFFFFE0B2),
        200: Color(0xFFFFCC80),
        300: Color(0xFFFFB74D),
        400: Color(0xFFFFA726),
        500: Color(0xFFFF9800),
        600: Color(0xFFFB8C00),
        700: Color(0xFFF57C00),
        800: Color(0xFFEF6C00),
        900: Color(0xFFE65100),
      },
    ),


  );
}