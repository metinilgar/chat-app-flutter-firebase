import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:riverpod_annotation/riverpod_annotation.dart";

part 'app_startup.g.dart';

// App Startup State
@Riverpod(keepAlive: true)
Future<void> appStartup(AppStartupRef ref) async {
  ref.onDispose(() {
    // ensure we invalidate all the providers we depend on
    //ref.invalidate(sharedPreferencesProvider);
  });

  // all asynchronous app initialization code should belong here:
  // await ref.watch(sharedPreferencesProvider.future);
}

// Widget class to manage asynchronous app initialization
class AppStartupWidget extends ConsumerWidget {
  const AppStartupWidget({
    super.key,
    required this.onLoaded,
  });
  final WidgetBuilder onLoaded;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appStartupState = ref.watch(appStartupProvider);
    return appStartupState.when(
      data: (_) => onLoaded(context),
      error: (e, _) => AppStartupErrorWidget(
        message: e.toString(),
        onRetry: () => ref.invalidate(appStartupProvider),
      ),
      loading: () => const AppStartupLoadingWidget(),
    );
  }
}

// Loading Widget
class AppStartupLoadingWidget extends StatelessWidget {
  const AppStartupLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

// Error Widget
class AppStartupErrorWidget extends StatelessWidget {
  const AppStartupErrorWidget(
      {super.key, required this.message, required this.onRetry});
  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: onRetry,
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
