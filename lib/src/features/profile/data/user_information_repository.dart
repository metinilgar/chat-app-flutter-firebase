import 'package:chat_app_flutter_firebase/src/features/chat/models/app_user.dart';
import 'package:chat_app_flutter_firebase/src/utils/providers/firebase_firestore_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_information_repository.g.dart';

class UserInformationRepository {
  UserInformationRepository({required this.firestore});

  final FirebaseFirestore firestore;

  // Get user information
  Future<AppUser> getUserInformation(String uid) async {
    try {
      final userDoc = await firestore.collection('users').doc(uid).get();
      return AppUser.fromMap(userDoc.data()!);
    } catch (e) {
      rethrow;
    }
  }

  // Update user information
  Future<void> updateUserInformation({
    required String uid,
    required String name,
    required String username,
    required String photourl,
  }) async {
    try {
      await firestore.collection('users').doc(uid).update({
        'name': name,
        'username': username.toLowerCase(),
        'photourl': photourl,
      });
    } catch (e) {
      rethrow;
    }
  }
}

@riverpod
UserInformationRepository userInformationRepository(
    UserInformationRepositoryRef ref) {
  return UserInformationRepository(
      firestore: ref.read(firebaseFirestoreProvider));
}
