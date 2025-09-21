import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const UserTile({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20), // Thêm padding để tạo khoảng cách bên trong
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12),
        ),
        margin:   const EdgeInsets.symmetric(vertical: 5, horizontal: 25),

        child: Row(
          children: [
            // Icon
            const Icon(Icons.person, size: 24),
            const SizedBox(width: 20), // Thêm khoảng cách giữa icon và text

            // User name
            Text(
              text,
              style: Theme.of(context).textTheme.bodyLarge, // Áp dụng style từ theme
            ),
          ],
        ),
      ),
    );
  }
}
