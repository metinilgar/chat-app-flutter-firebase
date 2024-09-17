import 'package:flutter/material.dart';

class UserListItem extends StatelessWidget {
  const UserListItem({
    super.key,
    required this.name,
    required this.photoUrl,
  });

  final String name;
  final String? photoUrl;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      leading: CircleAvatar(
        radius: 28,
        backgroundImage: NetworkImage(
          photoUrl ??
              "https://github.com/user-attachments/assets/66b1b7dd-1b25-4772-9096-148cebc21eaf",
        ),
      ),
      title: Text(name,
          style:
              Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 18)),
      onTap: () {},
    );
  }
}
