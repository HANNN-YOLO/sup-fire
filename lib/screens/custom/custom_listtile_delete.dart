import 'package:flutter/material.dart';

class CustomListtileDelete extends StatelessWidget {
  final String label;
  final String label1;
  final VoidCallback? fungsi;
  final Icon? customicon;
  final Icon? customicon2;
  final VoidCallback? fungsitap;
  final String? link;

  CustomListtileDelete({
    required this.label,
    required this.label1,
    this.fungsi,
    this.customicon,
    this.customicon2,
    this.fungsitap,
    this.link,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Card(
        child: ListTile(
          leading: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(
                  link != null
                      ? "${link}"
                      : "https://i.pinimg.com/474x/56/2e/be/562ebed9cd49b9a09baa35eddfe86b00.jpg",
                ),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          title: Text(label),
          subtitle: Text(label1),
          trailing: IconButton(
            onPressed: fungsi,
            icon: Icon(Icons.delete, color: Colors.red),
          ),
          onTap: fungsitap,
        ),
      ),
    );
  }
}
