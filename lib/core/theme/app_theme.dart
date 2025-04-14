import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static TextTheme interTextTheme = TextTheme(
    displayLarge: GoogleFonts.inter(fontSize: 57, fontWeight: FontWeight.bold),
    displayMedium: GoogleFonts.inter(fontSize: 45, fontWeight: FontWeight.bold),
    displaySmall: GoogleFonts.inter(fontSize: 36, fontWeight: FontWeight.bold),
    headlineLarge: GoogleFonts.inter(fontSize: 32, fontWeight: FontWeight.w700),
    headlineMedium:
        GoogleFonts.inter(fontSize: 28, fontWeight: FontWeight.w600),
    headlineSmall: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.w600),
    titleLarge: GoogleFonts.inter(fontSize: 22, fontWeight: FontWeight.w500),
    titleMedium: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500),
    titleSmall: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500),
    bodyLarge: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.normal),
    bodyMedium: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.normal),
    bodySmall: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.normal),
    labelLarge: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500),
    labelMedium: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w500),
    labelSmall: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w500),
  );
}
