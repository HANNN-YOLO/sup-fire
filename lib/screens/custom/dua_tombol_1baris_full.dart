import 'package:flutter/material.dart';

class Duatombol1barisFull extends StatelessWidget {
  final Color warna1;
  final VoidCallback fungsi1;
  final String label1;
  final Color warna2;
  final VoidCallback fungsi2;
  final String label2;

  Duatombol1barisFull({
    required this.warna1,
    required this.fungsi1,
    required this.label1,
    required this.warna2,
    required this.fungsi2,
    required this.label2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          tombol(warna: warna1, fungsi: fungsi1, label: label1),
          tombol(warna: warna2, fungsi: fungsi2, label: label2),
        ],
      ),
    );
  }
}

class tombol extends StatelessWidget {
  final Color warna;
  final VoidCallback fungsi;
  final String label;

  const tombol({
    super.key,
    required this.warna,
    required this.fungsi,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: warna,
      ),
      onPressed: fungsi,
      child: Text(label, style: TextStyle(color: Colors.white)),
    );
  }
}
