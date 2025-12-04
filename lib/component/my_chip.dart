import 'package:flutter/material.dart';
import 'package:my_graduation/core/utils/my_colors.dart';

class MyChip extends StatefulWidget {
  final String label;

  const MyChip({super.key, required this.label});

  @override
  State<MyChip> createState() => _MyChipState();
}

class _MyChipState extends State<MyChip> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      onSelected: (value) {
        setState(() {
          isSelected = !isSelected;
        });
      },

      backgroundColor: MyColors.primary,
      label: Text(widget.label),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );
  }
}
