import 'package:flutter/material.dart';

class CardMenuDrawer extends StatelessWidget {
  final Icon custom;
  final String label;
  final VoidCallback fungsi;

  CardMenuDrawer({
    required this.custom,
    required this.label,
    required this.fungsi,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(leading: custom, title: Text(label), onTap: fungsi),
    );
  }
}
