import 'package:flutter/material.dart';

class custom_iconbutton extends StatelessWidget {
  const custom_iconbutton({
    super.key,
    required this.fungsi,
    required this.customicon,
  });

  final VoidCallback? fungsi;
  final Icon? customicon;

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: fungsi, icon: customicon!);
  }
}
