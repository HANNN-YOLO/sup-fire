import 'package:flutter/material.dart';

class AppbarBack extends StatelessWidget implements PreferredSizeWidget {
  final Color warna;
  final String label;
  final VoidCallback fungsi;

  AppbarBack({required this.warna, required this.label, required this.fungsi});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: warna,
      title: Text(label, style: TextStyle(color: Colors.white)),
      actions: [
        Builder(
          builder: (context) {
            return IconButton(
              onPressed: fungsi,
              icon: Icon(Icons.arrow_back, color: Colors.white),
            );
          },
        ),
      ],
    );
  }

  // ini yang wajib ada kalau implements PreferredSizeWidget
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
