import 'package:chat_app_flutter_firebase/firebase_options.dart';
import 'package:chat_app_flutter_firebase/src/app.dart';
import 'package:chat_app_flutter_firebase/src/utils/providers/shared_preferences_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Get an instance of SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences)
      ],
      child: const MainApp(),
    ),
  );
}
