import 'package:chat_app_flutter_firebase/src/features/profile/presentation/widgets/textfield_modal_bottom_sheet.dart';
import 'package:chat_app_flutter_firebase/src/features/profile/presentation/controllers/user_information_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditProfile extends ConsumerWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appUser = ref.watch(userInformationControllerProvider).requireValue;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Profile'),
        ),
        body: Center(
          child: Column(
            children: [
              Hero(
                tag: 'profileAvatar',
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 80,
                      backgroundImage: NetworkImage(appUser.photourl),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: IconButton.filled(
                        onPressed: () {},
                        icon: const Icon(Icons.camera_alt_outlined, size: 30),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Name
              ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                leading: const Icon(Icons.person_outline),
                title: const Text('Name'),
                subtitle: Text(
                  appUser.name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                trailing: Icon(
                  Icons.edit,
                  color: Theme.of(context).colorScheme.primary,
                ),
                onTap: () => showModalBottomSheet(
                  context: context,
                  builder: (context) => TextfieldModalBottomSheet(
                    title: 'Enter Your Name',
                    initialValue: appUser.name,
                    onSave: (name) => {
                      ref
                          .read(userInformationControllerProvider.notifier)
                          .updateUserInformation(name: name)
                    },
                  ),
                ),
              ),

              // Username
              ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                leading: const Icon(Icons.person_outline),
                title: const Text('Username'),
                subtitle: Text(
                  appUser.username,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                trailing: Icon(
                  Icons.edit,
                  color: Theme.of(context).colorScheme.primary,
                ),
                onTap: () => showModalBottomSheet(
                  context: context,
                  builder: (context) => TextfieldModalBottomSheet(
                    title: 'Enter Your Username',
                    initialValue: appUser.username,
                    onSave: (username) => {
                      ref
                          .read(userInformationControllerProvider.notifier)
                          .updateUserInformation(username: username)
                    },
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
