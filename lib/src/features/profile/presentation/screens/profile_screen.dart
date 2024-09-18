import 'package:chat_app_flutter_firebase/src/features/authentication/data/auth_repository.dart';
import 'package:chat_app_flutter_firebase/src/features/profile/presentation/widgets/menu_item.dart';
import 'package:chat_app_flutter_firebase/src/features/profile/presentation/widgets/menu_list.dart';
import 'package:chat_app_flutter_firebase/src/features/profile/presentation/controllers/user_information_controller.dart';
import 'package:chat_app_flutter_firebase/src/features/profile/presentation/widgets/profile_header.dart';
import 'package:chat_app_flutter_firebase/src/features/settings/dark_mode/presentation/dark_mode_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appUser = ref.watch(userInformationControllerProvider);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // Add logout logic here
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: appUser.when(
                data: (data) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Profile header
                      ProfileHeader(
                        name: data.name,
                        username: data.username,
                        imageUrl: data.photourl,
                      ),

                      // Menu list profile
                      MenuList(
                        title: "Profile",
                        items: [
                          MenuItem(
                            icon: Icons.donut_large,
                            color: Colors.orange,
                            label: "Manage user",
                            onTap: () => context.go('/profile/manageUser'),
                          ),
                        ],
                      ),

                      // Menu list settings
                      MenuList(
                        title: "Settings",
                        items: [
                          MenuItem(
                            icon: Icons.notifications_outlined,
                            color: Colors.purple,
                            label: "Notifications",
                            onTap: () {},
                          ),
                          MenuItem(
                            icon: Icons.dark_mode_outlined,
                            color: Colors.lightBlue,
                            label: "Dark Mode",
                            onTap: () => showModalBottomSheet(
                                context: context,
                                builder: (context) => const DarkModeMenu()),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Sign out button
                      OutlinedButton(
                        onPressed: () =>
                            ref.read(authRepositoryProvider).signOut(),
                        child: const Text('Sign Out'),
                      ),
                    ],
                  );
                },
                error: (error, stack) => Center(
                      child: Text('Error: $error'),
                    ),
                loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ))),
      ),
    );
  }
}
