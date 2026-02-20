import 'package:flutter/material.dart';

class AppColors {

  static const Color background = Color(0xFF857461); //primary background colour
  static const Color surface = Color(0xFFFFF5E6); //secondary colour (blocks)

//text colours
  static const Color onBackground = Color(0xFFFFFFFF);
  static const Color onSurface = Color(0xFF2F2F2F);
  static const Color muted = Color(0xFF6E6E6E);


  static const Color positive = Color(0xFF5FBF73);
  static const Color negative = Color(0xFFE46A61);


  static const Color navHighlight = Color(0xFFFFF5E6);
  static const Color border = Color(0xFFD9D2C3);
}

class AppTheme {
  static ThemeData light() {
    final scheme = ColorScheme.fromSeed(
      seedColor: AppColors.navHighlight,
      brightness: Brightness.light,
      surface: AppColors.surface,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: AppColors.background,
      fontFamily: 'Source Sans 3',
      textTheme: const TextTheme(
        headlineLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      ).apply(
        bodyColor: AppColors.onBackground,
        displayColor: AppColors.onSurface,
      ),

      cardTheme: CardThemeData(
        color: AppColors.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: AppColors.border, width: 1),
        ),
      ),


      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: false,
        foregroundColor: AppColors.onBackground,
        titleTextStyle: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: AppColors.onBackground,
        ),
        iconTheme: IconThemeData(color: AppColors.onBackground),
      ),
    );
  }
}

