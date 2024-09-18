import 'package:chat_app_flutter_firebase/src/features/authentication/data/auth_repository.dart';
import 'package:chat_app_flutter_firebase/src/features/chat/models/app_user.dart';
import 'package:chat_app_flutter_firebase/src/features/chat/models/message.dart';
import 'package:chat_app_flutter_firebase/src/utils/providers/firebase_firestore_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_repository.g.dart';

class ChatRepository {
  ChatRepository(this._firestore, this._firebaseAuth);

  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  // Get All Users
  Stream<List<AppUser>> getAllUsers() {
    return _firestore.collection('users').snapshots().map(
          (snapshot) =>
              snapshot.docs.map((doc) => AppUser.fromMap(doc.data())).toList(),
        );
  }

  // Send Message
  Future<void> sendMessage(String message, String receiverId) async {
    // get current user id
    final senderId = _firebaseAuth.currentUser!.uid;
    final senderEmail = _firebaseAuth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();

    // create message
    final newMessage = Message(
      senderId: senderId,
      senderEmail: senderEmail,
      receiverId: receiverId,
      message: message,
      timestamp: timestamp,
    );

    // construct chat room id for the current user and the receiver
    final ids = [receiverId, senderId];
    ids.sort();
    final chatRoomId = ids.join('_');

    // save message to the chat room
    await _firestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .add(newMessage.toMap());
  }

  // Get Messages
  Stream<List<Message>> getMessages(String receiverId) {
    // get current user id
    final senderId = _firebaseAuth.currentUser!.uid;

    // construct chat room id for the current user and the receiver
    final ids = [receiverId, senderId];
    ids.sort();
    final chatRoomId = ids.join('_');

    return _firestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Message.fromMap(doc.data())).toList());
  }
}

@riverpod
ChatRepository chatRepository(ChatRepositoryRef ref) {
  return ChatRepository(
      ref.watch(firebaseFirestoreProvider), ref.watch(firebaseAuthProvider));
}

@riverpod
Stream<List<AppUser>> getAllUser(GetAllUserRef ref) {
  return ref.read(chatRepositoryProvider).getAllUsers();
}

@riverpod
Stream<List<Message>> getMessage(GetMessageRef ref, String receiverId) {
  return ref.read(chatRepositoryProvider).getMessages(receiverId);
}
