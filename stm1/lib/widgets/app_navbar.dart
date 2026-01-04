import 'package:flutter/material.dart';

class AppNavbar extends StatelessWidget implements PreferredSizeWidget {
  const AppNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 2,
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.blue),
      title: Row(
        children: [
          Image.asset(
            'assets/images/logo1.jpg',
            height: 36,
          ),
          const SizedBox(width: 12),
          const Text(
            'Smart Traffic - Bandung',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
