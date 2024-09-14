import 'package:chat_app_flutter_firebase/src/features/authentication/data/auth_repository.dart';
import 'package:chat_app_flutter_firebase/src/features/authentication/presentation/sign_in_screen.dart';
import 'package:chat_app_flutter_firebase/src/features/authentication/presentation/sign_up_screen.dart';
import 'package:chat_app_flutter_firebase/src/features/chat/presentation/chat_list_screen.dart';
import 'package:chat_app_flutter_firebase/src/routing/app_startup.dart';
import 'package:chat_app_flutter_firebase/src/routing/go_router_refresh_stream.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  // rebuild GoRouter when app startup state changes
  final appStartupState = ref.watch(appStartupProvider);
  final authRepository = ref.watch(authRepositoryProvider);

  return GoRouter(
    initialLocation: "/signIn",
    redirect: (context, state) {
      final path = state.uri.path; // get current path

      // Redirect to startup screen if app is loading or has error
      if (appStartupState.isLoading || appStartupState.hasError) {
        return "/startup";
      }

      // Check if user is logged in
      final isLoggedIn = authRepository.currentUser != null;

      // Redirect based on user's login status
      if (isLoggedIn) {
        if (path.startsWith("/signIn") ||
            path.startsWith("/signUp") ||
            path.startsWith("/startup")) {
          return "/home";
        }
      } else {
        if (path.startsWith("/home")) {
          return "/signIn";
        }
      }

      return null;
    },

    // Refresh listenable
    refreshListenable: GoRouterRefreshStream(authRepository.authStateChanges()),

    // Routes
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
      GoRoute(
          path: '/home', builder: (context, state) => const ChatListScreen()),
    ],
  );
}
