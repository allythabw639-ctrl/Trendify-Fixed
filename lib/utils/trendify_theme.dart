import 'package:flutter/material.dart';

class TrendifyBrand {
  static const String appName = 'Trendify';

  static ThemeData get theme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.pinkAccent,
      scaffoldBackgroundColor: Colors.black,
      colorScheme: ColorScheme.dark(
        primary: Colors.pinkAccent,
        secondary: Colors.cyanAccent,
        surface: Colors.grey[900]!,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      textTheme: const TextTheme(
        headlineMedium: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.white70),
      ),
    );
  }

  static LinearGradient get logoGradient {
    return const LinearGradient(
      colors: [Colors.pinkAccent, Colors.cyanAccent],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }
}
