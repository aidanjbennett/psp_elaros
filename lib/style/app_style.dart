import 'package:flutter/material.dart';


class AppColors {
  // Main background
  static const Color background = Color(0xFF857461);

  // Card surface
  static const Color surface = Color(0xFFFFF5E6);

  // Primary text
  static const Color textPrimary = Color(0xFF2F2F2F);

  // Muted text
  static const Color textGreyed = Color(0xFF6E6E6E);

  // Status colors
  static const Color positive = Color(0xFF5FBF73);
  static const Color negative = Color(0xFFE46A61);

  // Bottom nav highlight
  static const Color navHighlight = Color(0xFFFFF5E6);

  static const Color border = Color(0xFFD9D2C3);
}

class AppTheme {
  static ThemeData light() {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.background,

      colorScheme: const ColorScheme.light(
        surface: AppColors.surface,
      ),

      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: AppColors.textPrimary,
        ),
      ).apply(fontFamily: 'Source Sans 3',),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
      ),
    );
  }
}



