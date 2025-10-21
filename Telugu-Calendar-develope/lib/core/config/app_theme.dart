import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color primary = Color(0xFF6A1B9A); // Deep Purple
  static const Color primaryLight = Color(0xFF9C4DCC);
  static const Color blueColor = Color(0xFF002BFF);
  static const Color accent = Color(0xFFFFAB40); // Warm Amber/Gold
  static const Color background = Color(0xFFF5F5F5); // Off-white
  static const Color cardColor = Colors.white;
  static const Color primaryText = Color(0xFF212121);
  static const Color secondaryText = Color(0xFF757575);
  static const Color holidayRed = Color(0xFFD32F2F);
  static const Color pinkColor = Color(0xffF423ED);
}

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.accent,
      onPrimary: Colors.white,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.white),
      titleTextStyle: GoogleFonts.notoSansTelugu(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    cardTheme: CardThemeData(
      elevation: 2,
      color: AppColors.cardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.notoSansTelugu(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.primaryText),
      bodyLarge: GoogleFonts.notoSansTelugu(fontSize: 16, color: AppColors.primaryText),
      bodyMedium: GoogleFonts.notoSansTelugu(fontSize: 14, color: AppColors.secondaryText),
      labelLarge: GoogleFonts.notoSansTelugu(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.secondaryText,
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      elevation: 8,
    ),
    iconTheme: const IconThemeData(color: AppColors.primary),
  );
}