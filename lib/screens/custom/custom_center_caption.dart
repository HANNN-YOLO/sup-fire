import 'package:flutter/material.dart';

class CustomCenterCaption extends StatelessWidget {
  final String label;

  CustomCenterCaption({required this.label});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        label,
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }
}
