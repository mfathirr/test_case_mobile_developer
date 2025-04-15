import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static TextTheme jakartaSansTextTheme = TextTheme(
    displayLarge:
        GoogleFonts.plusJakartaSans(fontSize: 57, fontWeight: FontWeight.bold),
    displayMedium:
        GoogleFonts.plusJakartaSans(fontSize: 45, fontWeight: FontWeight.bold),
    displaySmall:
        GoogleFonts.plusJakartaSans(fontSize: 36, fontWeight: FontWeight.bold),
    headlineLarge:
        GoogleFonts.plusJakartaSans(fontSize: 32, fontWeight: FontWeight.w700),
    headlineMedium:
        GoogleFonts.plusJakartaSans(fontSize: 28, fontWeight: FontWeight.w600),
    headlineSmall:
        GoogleFonts.plusJakartaSans(fontSize: 24, fontWeight: FontWeight.w600),
    titleLarge:
        GoogleFonts.plusJakartaSans(fontSize: 22, fontWeight: FontWeight.w500),
    titleMedium:
        GoogleFonts.plusJakartaSans(fontSize: 16, fontWeight: FontWeight.w500),
    titleSmall:
        GoogleFonts.plusJakartaSans(fontSize: 14, fontWeight: FontWeight.w500),
    bodyLarge: GoogleFonts.plusJakartaSans(
        fontSize: 16, fontWeight: FontWeight.normal),
    bodyMedium: GoogleFonts.plusJakartaSans(
        fontSize: 14, fontWeight: FontWeight.normal),
    bodySmall: GoogleFonts.plusJakartaSans(
        fontSize: 12, fontWeight: FontWeight.normal),
    labelLarge:
        GoogleFonts.plusJakartaSans(fontSize: 14, fontWeight: FontWeight.w500),
    labelMedium:
        GoogleFonts.plusJakartaSans(fontSize: 12, fontWeight: FontWeight.w500),
    labelSmall:
        GoogleFonts.plusJakartaSans(fontSize: 11, fontWeight: FontWeight.w500),
  );
}
