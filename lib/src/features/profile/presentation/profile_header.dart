import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader(
      {super.key,
      required this.name,
      required this.username,
      required this.imageUrl});

  final String name;
  final String username;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 0,
                blurRadius: 8,
                offset: const Offset(3, 6),
              ),
            ],
          ),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 60,
            backgroundImage: NetworkImage(
              imageUrl,
            ),
          ),
        ),
        const SizedBox(height: 20),

        // Display user's name
        Text(
          name,
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          "@$username",
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: Colors.grey),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
