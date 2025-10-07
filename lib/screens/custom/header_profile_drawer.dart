import 'package:flutter/material.dart';

class HeaderProfileDrawer extends StatelessWidget {
  final Color warna;
  final String gambar;
  final String nama;
  final String email;

  HeaderProfileDrawer({
    required this.warna,
    required this.gambar,
    required this.nama,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      height: 150,
      color: warna,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: EdgeInsets.only(left: 20),
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(gambar),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          Container(
            height: 100,
            padding: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  padding: EdgeInsets.only(top: 30),
                  child: Text(nama, style: TextStyle(color: Colors.white)),
                ),
                Container(
                  child: Text(email, style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
