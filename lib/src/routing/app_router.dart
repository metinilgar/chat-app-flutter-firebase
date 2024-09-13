import 'package:chat_app_flutter_firebase/src/features/authentication/presentation/sign_in_screen.dart';
import 'package:chat_app_flutter_firebase/src/features/authentication/presentation/sign_up_screen.dart';
import 'package:chat_app_flutter_firebase/src/routing/app_startup.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  // rebuild GoRouter when app startup state changes
  final appStartupState = ref.watch(appStartupProvider);

  return GoRouter(
    initialLocation: "/signIn",
    redirect: (context, state) {
      if (appStartupState.isLoading || appStartupState.hasError) {
        return "/startup";
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/startup',
        builder: (context, state) => AppStartupWidget(
          onLoaded: (_) => const SizedBox.shrink(),
        ),
      ),
      GoRoute(
          path: '/signIn', builder: (context, state) => const SignInScreen()),
      GoRoute(
          path: '/signUp', builder: (context, state) => const SignUpScreen()),
    ],
  );
}
