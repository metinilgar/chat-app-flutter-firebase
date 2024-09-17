import 'package:chat_app_flutter_firebase/src/features/authentication/data/auth_repository.dart';
import 'package:chat_app_flutter_firebase/src/features/chat/data/chat_repository.dart';
import 'package:chat_app_flutter_firebase/src/features/chat/presentation/user_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserList extends ConsumerWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(getAllUserProvider);

    return users.when(
      // Data loaded
      data: (data) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Chats title
              Row(
                children: [
                  Text("Chats", style: Theme.of(context).textTheme.titleLarge),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.more_horiz),
                    onPressed: () {},
                  ),
                ],
              ),

              // List of users
              for (final user in data)
                if (user.id !=
                    ref.read(authRepositoryProvider).currentUser!.uid)
                  UserListItem(
                    name: user.name,
                    photoUrl: user.photoUrl,
                  ),
            ],
          ),
        );
      },

      // Error handling
      error: (error, _) => Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Error: $error"),
              ElevatedButton(
                onPressed: () => ref.invalidate(getAllUserProvider),
                child: const Text("Retry"),
              ),
            ],
          ),
        ),
      ),

      // Loading state
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
