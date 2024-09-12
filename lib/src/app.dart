import 'package:chat_app_flutter_firebase/src/features/authentication/presentation/sign_in_screen.dart';
import 'package:chat_app_flutter_firebase/src/utils/theme/theme.dart';
import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // Theme Mode
      themeMode: ThemeMode.system,

      // Light Theme
      theme: KAppTheme.kLightTheme,

      // Dark Theme
      darkTheme: KAppTheme.kDarkTheme,

      home: const SignInScreen(),
    );
  }
}
