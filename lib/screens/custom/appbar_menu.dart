import 'package:flutter/material.dart';

class AppbarMenu extends StatelessWidget implements PreferredSizeWidget {
  final Color bgwarna;
  final String label;

  AppbarMenu({required this.bgwarna, required this.label});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: Container(),
      backgroundColor: bgwarna,
      title: Text(label, style: TextStyle(color: Colors.white)),
      actions: [
        Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.menu, color: Colors.white),
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
