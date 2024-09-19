import 'package:chat_app_flutter_firebase/src/features/profile/presentation/widgets/textfield_modal_bottom_sheet.dart';
import 'package:chat_app_flutter_firebase/src/features/profile/presentation/controllers/user_information_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends ConsumerStatefulWidget {
  const EditProfile({super.key});

  @override
  ConsumerState<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends ConsumerState<EditProfile> {
  // Show Image Options
  Future<void> showImageOptions() async {
    switch (await showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            children: <Widget>[
              // Camera Option
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, "camera");
                },
                child: const Text('Camera'),
              ),

              // Gallery Option
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, "gallery");
                },
                child: const Text('Gallery'),
              ),
            ],
          );
        })) {
      case "camera":
        getImage(ImageSource.camera);
        break;
      case "gallery":
        getImage(ImageSource.gallery);
        break;
      case null:
        // dialog dismissed ;
        break;
    }
  }

  void getImage(ImageSource source) async {
    final pickedImage = await ImagePicker()
        .pickImage(source: source, imageQuality: 50, maxWidth: 200);

    if (pickedImage == null) return;

    ref
        .read(userInformationControllerProvider.notifier)
        .uploadProfileImage(pickedImage.path);
  }

  @override
  Widget build(BuildContext context) {
    final appUserAsyncValue = ref.watch(userInformationControllerProvider);
    final appUser = appUserAsyncValue.requireValue;
    final isLoading = appUserAsyncValue.isLoading;

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
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      child:
                          isLoading ? const CircularProgressIndicator() : null,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: IconButton.filled(
                        onPressed: showImageOptions,
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
