import 'package:chat_app_flutter_firebase/src/features/profile/presentation/user_information_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ManageUser extends ConsumerWidget {
  const ManageUser({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appUser = ref.watch(userInformationControllerProvider).requireValue;
    const double iconSize = 30;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Manage User'),
        ),
        body: ListView(
          children: [
            // Edit user profile
            ListTile(
              leading: Hero(
                tag: 'profileAvatar',
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(appUser.photourl),
                ),
              ),
              title: Text(appUser.name),
              subtitle: Text('@${appUser.username}'),
              trailing: const Icon(Icons.edit_outlined),
              onTap: () => context.go('/profile/manageUser/edit'),
            ),
            const Divider(),

            // Change email
            ListTile(
              leading: const Icon(
                Icons.email_outlined,
                size: iconSize,
              ),
              title: const Text('Change email'),
              onTap: () {
                // Add change email logic here
              },
            ),

            // Change password
            ListTile(
              leading: const Icon(
                Icons.lock_outline,
                size: iconSize,
              ),
              title: const Text('Change password'),
              onTap: () {
                // Add change password logic here
              },
            ),

            // Delete account
            ListTile(
              leading: const Icon(
                Icons.delete_outline,
                size: iconSize,
              ),
              title: const Text('Delete account'),
              onTap: () {
                // Add delete account logic here
              },
            ),

            // Refer a friend
            ListTile(
              leading: const Icon(
                Icons.share,
                size: iconSize,
              ),
              title: const Text('Refer a friend'),
              onTap: () {
                // Add refer a friend logic here
              },
            ),

            // Help
            ListTile(
              leading: const Icon(
                Icons.help_outline,
                size: iconSize,
              ),
              title: const Text('Help'),
              onTap: () {
                // Add help logic here
              },
            ),

            // About
            ListTile(
              leading: const Icon(
                Icons.info_outline,
                size: iconSize,
              ),
              title: const Text('About'),
              onTap: () {
                // Add about logic here
              },
            ),

            // Privacy policy
            ListTile(
              leading: const Icon(
                Icons.privacy_tip_outlined,
                size: iconSize,
              ),
              title: const Text('Privacy policy'),
              onTap: () {
                // Add privacy policy logic here
              },
            ),

            // Terms of service
            ListTile(
              leading: const Icon(
                Icons.article_outlined,
                size: iconSize,
              ),
              title: const Text('Terms of service'),
              onTap: () {
                // Add terms of service logic here
              },
            ),

            // Sign out
            ListTile(
              leading: const Icon(
                Icons.logout,
                size: iconSize,
              ),
              title: const Text('Sign out'),
              onTap: () {
                // Add sign out logic here
              },
            ),
          ],
        ));
  }
}
