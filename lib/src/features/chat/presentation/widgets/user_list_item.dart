import 'package:flutter/material.dart';

class UserListItem extends StatelessWidget {
  const UserListItem({
    super.key,
    required this.name,
    required this.photourl, required this.onTap,
  });

  final String name;
  final String photourl;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      leading: CircleAvatar(
        radius: 28,
        backgroundColor: Colors.white,
        backgroundImage: NetworkImage(photourl),
      ),
      title: Text(name,
          style:
              Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 18)),
      onTap: onTap,
    );
  }
}
