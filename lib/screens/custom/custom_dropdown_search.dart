import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

class CustomDropdownSearch extends StatelessWidget {
  final List<String> manalistnya;
  final String label;
  final String pilihan;
  final ValueChanged? fungsi;

  CustomDropdownSearch({
    required this.manalistnya,
    required this.label,
    required this.pilihan,
    this.fungsi,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: DropdownSearch<String>(
        items: (f, cs) => manalistnya,
        selectedItem: pilihan,
        popupProps: PopupProps.menu(fit: FlexFit.loose),
        onChanged: fungsi,
        decoratorProps: DropDownDecoratorProps(
          decoration: InputDecoration(
            hintText: label,
            hintStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ),
    );
  }
}
