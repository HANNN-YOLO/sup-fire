import 'package:flutter/material.dart';

class custom_photo_1barisfull extends StatelessWidget {
  final String path;
  const custom_photo_1barisfull({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(image: NetworkImage(path), fit: BoxFit.cover),
      ),
    );
  }
}
