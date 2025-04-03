// In app_theme.dart
import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: Color(0xFF2962FF),
      secondary: Color(0xFF00B0FF),
      tertiary: Color(0xFF00BFA5),
      background: Colors.white,
      surface: Colors.white,
    ),
    scaffoldBackgroundColor: Color(0xFFF5F7FA),
    cardTheme: CardTheme(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,
    ),
    fontFamily: 'Poppins',
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: Color(0xFF448AFF),
      secondary: Color(0xFF40C4FF),
      tertiary: Color(0xFF1DE9B6),
      background: Color(0xFF1A1A2E),
      surface: Color(0xFF252A34),
    ),
    scaffoldBackgroundColor: Color(0xFF0F0F1A),
    cardTheme: CardTheme(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFF252A34),
      elevation: 0,
      centerTitle: false,
    ),
    fontFamily: 'Poppins',
  );
}