import 'package:flutter/material.dart';

class CustomTextbutton extends StatelessWidget {
  final VoidCallback fungsi;
  final String label;
  final Color warna;

  CustomTextbutton({
    required this.fungsi,
    required this.label,
    required this.warna,
  });
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: fungsi,
      child: Text(label, style: TextStyle(color: warna)),
    );
  }
}
