import 'package:flutter/material.dart';

class KElevatedButtonTheme {
  KElevatedButtonTheme._();

  // Light ElevatedButtonTheme
  static ElevatedButtonThemeData kLightElevatedButtonTheme =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      // Shape
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),

      // Elevation
      elevation: 0,

      // Colors
      backgroundColor: const Color(0xFF111111),
      foregroundColor: const Color(0xFFFAFAFA),
    ),
  );

  // Dark ElevatedButtonTheme
  static ElevatedButtonThemeData kDarkElevatedButtonTheme =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      // Shape
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),

      // Elevation
      elevation: 0,

      // Colors
      backgroundColor: const Color(0xFFFAFAFA),
      foregroundColor: const Color(0xFF111111),
    ),
  );
}
