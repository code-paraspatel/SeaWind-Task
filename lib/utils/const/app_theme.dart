

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemeClass{

  static ThemeData appTheme = ThemeData(
    appBarTheme:  const AppBarTheme(
      centerTitle: true,
      titleTextStyle: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: Colors.black
      ),
    ),
    textTheme: GoogleFonts.robotoTextTheme(),
    useMaterial3: true,
  );

}