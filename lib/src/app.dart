import 'package:chat_app_flutter_firebase/src/routing/app_router.dart';
import 'package:chat_app_flutter_firebase/src/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,

      // Theme Mode
      themeMode: ThemeMode.system,

      // Light Theme
      theme: KAppTheme.kLightTheme,

      // Dark Theme
      darkTheme: KAppTheme.kDarkTheme,

      routerConfig: goRouter,
    );
  }
}
