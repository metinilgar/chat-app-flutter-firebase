import 'package:flutter/material.dart';

class KTextButtonTheme {
  KTextButtonTheme._();

  // Light TextButtonTheme
  static TextButtonThemeData kLightTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      // Foreground color
      foregroundColor: const Color(0xFF111111),
    ),
  );

  // Dark TextButtonTheme
  static TextButtonThemeData kDarkTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      // Foreground color
      foregroundColor: const Color(0xFFFAFAFA),
    ),
  );
}
