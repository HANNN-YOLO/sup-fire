import 'package:flutter/material.dart';

class CustomListtile extends StatelessWidget {
  final Icon? custom;
  final String label;
  final String? label2;
  final VoidCallback? fungsi;

  CustomListtile({this.custom, required this.label, this.label2, this.fungsi});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        child: ListTile(
          leading: custom,
          title: Text(label),
          subtitle: Text(label2!),
          onTap: fungsi,
        ),
      ),
    );
  }
}
