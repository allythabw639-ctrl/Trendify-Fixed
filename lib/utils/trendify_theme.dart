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
