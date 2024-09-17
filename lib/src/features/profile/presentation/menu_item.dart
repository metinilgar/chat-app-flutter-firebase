import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  const MenuItem(
      {super.key,
      required this.icon,
      required this.color,
      required this.label,
      required this.onTap});

  final IconData icon;
  final Color color;
  final String label;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        splashColor: Colors.grey.withOpacity(0.1),
        highlightColor: Colors.grey.withOpacity(0.1),
        onTap: onTap,
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                size: 30,
                icon,
                color: color,
              ),
            ),
            const SizedBox(width: 20),
            Text(
              label,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                size: 16,
                Icons.arrow_forward_ios,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
