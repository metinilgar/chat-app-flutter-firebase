import 'package:chat_app_flutter_firebase/src/features/profile/presentation/widgets/menu_item.dart';
import 'package:flutter/material.dart';

class MenuList extends StatelessWidget {
  const MenuList({super.key, required this.title, required this.items});

  final String title;
  final List<MenuItem> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
        ),
        ...items,
        const SizedBox(height: 30),
      ],
    );
  }
}
