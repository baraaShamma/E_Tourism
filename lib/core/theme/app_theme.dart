import 'package:e_tourism/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum AppTheme {
  light("Light"),
  dark("Dark");

  const AppTheme(this.name);

  final String name;
}

final appThemeData = {
  AppTheme.light: ThemeData(
    textTheme: TextTheme(
      titleSmall: GoogleFonts.amiri(
        fontSize: 20,
        fontStyle: FontStyle.italic,
      ),
      titleMedium: GoogleFonts.amiri(
        fontSize: 25,
        fontStyle: FontStyle.italic,
      ),
      bodyMedium: GoogleFonts.amiri(
        fontSize: 18,
        fontStyle: FontStyle.italic,
      ),
      headlineSmall: GoogleFonts.amiri(
        fontSize: 12,
        fontStyle: FontStyle.normal,
      ),
      labelSmall: GoogleFonts.amiri(
        fontSize: 12,
        fontStyle: FontStyle.normal,
      ),
    ),
    bottomNavigationBarTheme:
        BottomNavigationBarThemeData(backgroundColor: Colors.white),
    primaryColor: AppColor.primaryColorLight,
    brightness: Brightness.light,
  ),
  AppTheme.dark: ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColor.primaryColorDark,
    ),
    primaryColor: AppColor.primaryColorLight,
    cardColor: AppColor.white,
  ),
};
