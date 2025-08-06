import 'package:doclink/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // ✅ Import

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.surface,
    primaryColor: AppColors.primary,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primary,
      onPrimary: AppColors.onPrimary,
      secondary: AppColors.secondary,
      onSecondary: AppColors.onSecondary,
      surface: AppColors.surface,
      onSurface: AppColors.onSurface,
      error: AppColors.error,
      onError: AppColors.onError,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.surface,
      foregroundColor: AppColors.primary,
      elevation: 0,
    ),
    textTheme: GoogleFonts.openSansTextTheme().copyWith(
      headlineLarge: const TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        color: AppColors.primary,
      ),
      bodyLarge: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        color: AppColors.headingTextColor,
      ),
      bodyMedium: const TextStyle(
        fontSize: 18,
        color: AppColors.bodyTextColor,
        fontWeight: FontWeight.normal,
      ),
      bodySmall: const TextStyle(
        fontSize: 13,
        color: AppColors.bodyTextColor,
        fontWeight: FontWeight.normal,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primary),
      ),
    ),
  );
}
