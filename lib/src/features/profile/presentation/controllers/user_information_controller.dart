import 'package:chat_app_flutter_firebase/src/features/authentication/data/auth_repository.dart';
import 'package:chat_app_flutter_firebase/src/features/chat/models/app_user.dart';
import 'package:chat_app_flutter_firebase/src/features/profile/data/user_information_repository.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_information_controller.g.dart';

@riverpod
class UserInformationController extends _$UserInformationController {
  @override
  FutureOr<AppUser> build() async {
    final currentUser = ref.read(authRepositoryProvider).currentUser;

    return await ref
        .read(userInformationRepositoryProvider)
        .getUserInformation(currentUser!.uid);
  }

  // Update user information
  Future<void> updateUserInformation({
    String? name,
    String? username,
    String? photourl,
  }) async {
    final currentUser = ref.read(authRepositoryProvider).currentUser;

    state = const AsyncLoading();

    try {
      await ref.read(userInformationRepositoryProvider).updateUserInformation(
            uid: currentUser!.uid,
            name: name ?? state.value!.name,
            username: username ?? state.value!.username,
            photourl: photourl ?? state.value!.photourl,
          );

      state = AsyncData(
        state.value!.copyWith(
          name: name ?? state.value!.name,
          username: username ?? state.value!.username,
          photourl: photourl ?? state.value!.photourl,
        ),
      );
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }

  // Upload profile image
  Future<void> uploadProfileImage(String imageFilePath) async {
    final currentUser = ref.read(authRepositoryProvider).currentUser;

    state = const AsyncLoading();

    try {
      final photourl = await ref
          .read(userInformationRepositoryProvider)
          .uploadProfileImage(currentUser!.uid, imageFilePath);

      state = AsyncData(
        state.value!.copyWith(photourl: photourl),
      );
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }
}
