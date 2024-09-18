import 'package:flutter/material.dart';

class KColorScheme {
  KColorScheme._();

  static ColorScheme kLightColorScheme = ColorScheme.fromSeed(
    seedColor: const Color(0xFF223843),
  );

  static ColorScheme kDarkColorScheme = ColorScheme.fromSeed(
    seedColor: const Color(0xFF223843),
    brightness: Brightness.dark,
  );
}
