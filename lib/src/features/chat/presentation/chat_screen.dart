import 'package:chat_app_flutter_firebase/src/features/authentication/data/auth_repository.dart';
import 'package:chat_app_flutter_firebase/src/features/chat/data/chat_repository.dart';
import 'package:chat_app_flutter_firebase/src/features/chat/models/app_user.dart';
import 'package:chat_app_flutter_firebase/src/features/chat/models/message.dart';
import 'package:chat_app_flutter_firebase/src/features/chat/presentation/widgets/message_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({super.key, required this.receiverUser});

  // Receiver user
  final AppUser receiverUser;

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final message = _textEditingController.text;
    if (message.isNotEmpty) {
      ref
          .read(chatRepositoryProvider)
          .sendMessage(message, widget.receiverUser.id);
      _textEditingController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final messages = ref.watch(getMessageProvider(widget.receiverUser.id));

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(widget.receiverUser.photourl),
            ),
            const SizedBox(width: 10),
            Text(widget.receiverUser.name),
          ],
        ),
      ),
      body: Column(
        children: [
          // Chat messages
          Expanded(
            child: messages.when(
              data: _buildMessageWidget,
              error: _buildErrorWidget,
              loading: _buildLoadingWidget,
            ),
          ),

          // Chat input
          Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    decoration: const InputDecoration(
                      hintText: 'Type a message',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.send,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageWidget(List<Message> data) {
    return ListView.builder(
      reverse: true,
      itemCount: data.length,
      itemBuilder: (context, index) {
        // Get the current and next chat message
        final chatMessage = data[index];
        final nextChatMessage =
            (index + 1) < data.length ? data[index + 1] : null;

        // Get the current and next message user id
        final currentMessageUserId = chatMessage.senderId;
        final nextMessageUserId =
            (nextChatMessage != null) ? nextChatMessage.senderId : null;

        // Check if the message is from the current user
        final isMe = chatMessage.senderId ==
            ref.read(authRepositoryProvider).currentUser!.uid;

        if (currentMessageUserId != nextMessageUserId) {
          return MessageBubble.first(
            userImage: null,
            username: null,
            message: chatMessage.message,
            isMe: isMe,
          );
        } else {
          return MessageBubble.next(
            message: chatMessage.message,
            isMe: isMe,
          );
        }
      },
    );
  }

  // Error widget
  Widget _buildErrorWidget(Object error, StackTrace stackTrace) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Error: $error"),
          ElevatedButton(
            onPressed: () =>
                ref.invalidate(getMessageProvider(widget.receiverUser.id)),
            child: const Text("Retry"),
          ),
        ],
      ),
    );
  }

  // Loading widget
  Widget _buildLoadingWidget() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
