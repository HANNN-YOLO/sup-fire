import 'package:flutter/material.dart';

class Label1barisFull extends StatelessWidget {
  final String label;

  Label1barisFull({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Text(label),
    );
  }
}
