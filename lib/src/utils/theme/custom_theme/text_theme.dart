import 'package:flutter/material.dart';

class KTextTheme {
  KTextTheme._();

  static TextTheme kLightTextTheme = ThemeData.light().textTheme.apply(
        bodyColor: const Color(0xFF111111),
        displayColor: const Color(0xFF111111),
      );

  static TextTheme kDarkTextTheme = ThemeData.dark().textTheme.apply(
        bodyColor: const Color(0xFFFAFAFA),
        displayColor: const Color(0xFFFAFAFA),
      );
}
