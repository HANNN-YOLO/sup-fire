import 'package:flutter/material.dart';
import 'custom_textbutton.dart';

class AppbarLandingpage extends StatelessWidget implements PreferredSizeWidget {
  final Color warna;
  final String label;
  final VoidCallback fungsi1;
  final String label1;
  final VoidCallback fungsi2;
  final String label2;
  final Color warna1;
  final Color warna2;

  AppbarLandingpage({
    required this.warna,
    required this.label,
    required this.fungsi1,
    required this.label1,
    required this.fungsi2,
    required this.label2,
    required this.warna1,
    required this.warna2,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: warna,
      title: Text(label, style: TextStyle(color: Colors.white)),
      actions: [
        Container(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextbutton(fungsi: fungsi1, label: label1, warna: warna1),
              CustomTextbutton(fungsi: fungsi2, label: label2, warna: warna2),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
