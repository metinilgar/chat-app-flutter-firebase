import 'package:chat_app_flutter_firebase/src/features/chat/data/chat_repository.dart';
import 'package:chat_app_flutter_firebase/src/features/stories/presentation/story_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StoryList extends ConsumerWidget {
  const StoryList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(getAllUserProvider);

    return SizedBox(
        height: 120,
        child: users.when(
          data: (data) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return StoryCircle(
                  name: data[index].name,
                  imageUrl: data[index].photourl,
                );
              },
            );
          },
          error: (error, stackTrace) {
            return Center(
              child: Text('Error: $error'),
            );
          },
          loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
