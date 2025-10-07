import 'package:flutter/material.dart';

class CaptionInputan extends StatelessWidget {
  final String label;

  CaptionInputan({required this.label});
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
    );
  }
}
