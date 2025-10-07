import 'package:flutter/material.dart';

class HeaderDrawer extends StatelessWidget {
  final Color warna;
  final String gambar;
  final String label;

  HeaderDrawer({
    required this.warna,
    required this.gambar,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      height: 83,
      color: warna,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                image: NetworkImage(gambar),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Text(label, style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
