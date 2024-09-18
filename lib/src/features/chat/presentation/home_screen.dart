import 'package:chat_app_flutter_firebase/src/features/chat/presentation/widgets/user_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            // User Stories
            Placeholder(fallbackHeight: 80),

            // User list
            UserList(),
          ],
        ),
      ),
    );
  }
}
