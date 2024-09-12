import 'package:flutter/material.dart';

class KTextTheme {
  KTextTheme._();

  static TextTheme kLightTextTheme = const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Color(0xFF111111),
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      color: Color(0xFF111111),
    ),
  );

  static TextTheme kDarkTextTheme = const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Color(0xFFFAFAFA),
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      color: Color(0xFFFAFAFA),
    ),
  );
}
