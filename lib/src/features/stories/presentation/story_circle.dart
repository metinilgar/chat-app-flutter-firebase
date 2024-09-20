import 'package:flutter/material.dart';

class StoryCircle extends StatelessWidget {
  const StoryCircle(
      {super.key,
      required this.name,
      required this.imageUrl,
      this.isMe = false,
      this.onTap});

  final String name;
  final String imageUrl;
  final bool isMe;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                    width: 4,
                  ),
                ),
                child: CircleAvatar(
                  radius: 32,
                  backgroundImage:
                      imageUrl.isNotEmpty ? NetworkImage(imageUrl) : null,
                ),
              ),

              // Add icon
              if (isMe)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          width: 3,
                          color: Theme.of(context).scaffoldBackgroundColor),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              Positioned.fill(
                  child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.white.withOpacity(0.2),
                  highlightColor: Colors.white.withOpacity(0.1),
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  onTap: onTap,
                ),
              ))
            ],
          ),
          Text(name),
        ],
      ),
    );
  }
}
