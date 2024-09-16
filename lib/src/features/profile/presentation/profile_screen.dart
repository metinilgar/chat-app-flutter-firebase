import 'package:chat_app_flutter_firebase/src/features/authentication/data/auth_repository.dart';
import 'package:chat_app_flutter_firebase/src/features/profile/presentation/menu_item.dart';
import 'package:chat_app_flutter_firebase/src/features/profile/presentation/menu_list.dart';
import 'package:chat_app_flutter_firebase/src/features/profile/presentation/profile_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile header
              const ProfileHeader(
                name: "Metin Ilgar",
                username: "ilgar",
                imageUrl:
                    "https://github.com/user-attachments/assets/66b1b7dd-1b25-4772-9096-148cebc21eaf",
              ),

              // Menu list profile
              const MenuList(
                title: "Profile",
                items: [
                  MenuItem(
                    icon: Icons.donut_large,
                    color: Colors.orange,
                    label: "Manage user",
                  ),
                ],
              ),

              // Menu list settings
              const MenuList(
                title: "Settings",
                items: [
                  MenuItem(
                    icon: Icons.notifications_outlined,
                    color: Colors.purple,
                    label: "Notifications",
                  ),
                  MenuItem(
                    icon: Icons.dark_mode_outlined,
                    color: Colors.lightBlue,
                    label: "Dark Mode",
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Sign out button
              OutlinedButton(
                onPressed: () => ref.read(authRepositoryProvider).signOut(),
                child: const Text('Sign Out'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
