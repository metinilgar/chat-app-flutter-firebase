import 'package:chat_app_flutter_firebase/src/utils/theme/custom_theme/app_bar_theme.dart';
import 'package:chat_app_flutter_firebase/src/utils/theme/custom_theme/elevated_button_theme.dart';
import 'package:chat_app_flutter_firebase/src/utils/theme/custom_theme/input_decoration_theme.dart';
import 'package:chat_app_flutter_firebase/src/utils/theme/custom_theme/text_button_theme.dart';
import 'package:chat_app_flutter_firebase/src/utils/theme/custom_theme/text_theme.dart';
import 'package:flutter/material.dart';

class KAppTheme {
  KAppTheme._();

  // Light theme
  static ThemeData kLightTheme = ThemeData.light(useMaterial3: true).copyWith(
    // Scaffold background color
    scaffoldBackgroundColor: const Color(0xFFFAFAFA),

    appBarTheme: KAppBarTheme.kAppBarTheme,

    // ElevatedButton theme
    elevatedButtonTheme: KElevatedButtonTheme.kLightElevatedButtonTheme,

    // TextButton theme
    textButtonTheme: KTextButtonTheme.kLightTextButtonTheme,

    // Text theme
    textTheme: KTextTheme.kLightTextTheme,

    // Input decoration theme
    inputDecorationTheme: KInputDecorationTheme.kInputDecorationTheme,
  );

  static ThemeData kDarkTheme = ThemeData.dark(useMaterial3: true).copyWith(
    // Scaffold background color
    scaffoldBackgroundColor: const Color(0xFF111111),

    // ElevatedButton theme
    elevatedButtonTheme: KElevatedButtonTheme.kDarkElevatedButtonTheme,

    // TextButton theme
    textButtonTheme: KTextButtonTheme.kDarkTextButtonTheme,

    // Text theme
    textTheme: KTextTheme.kDarkTextTheme,

    // Input decoration theme
    inputDecorationTheme: KInputDecorationTheme.kInputDecorationTheme,
  );
}
