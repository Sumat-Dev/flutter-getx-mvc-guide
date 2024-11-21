import 'package:flutter/material.dart';

import '../../core/constants/app_constants.dart';

class AppTheme {
  static ThemeMode system = ThemeMode.light;

  static ThemeData get lightTheme => ThemeData(
    fontFamily: Font.poppins,
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: Color(0xFFFFFFFF),
      secondary: Color(0xFFEFF0F6),
    ),
    scaffoldBackgroundColor: const Color(0xFFF6F7FC),
  );

  static ThemeData get darkTheme => ThemeData(
    fontFamily: Font.poppins,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF1C243F),
      secondary: Color(0xFF262F4B),
    ),
    scaffoldBackgroundColor: const Color(0xFF0F172F),
  );
}