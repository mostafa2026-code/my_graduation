import 'package:flutter/material.dart';
import 'package:my_graduation/core/utils/my_colors.dart';

class MyChip extends StatefulWidget {
  final String label;
  final Function() onselected;

  const MyChip({super.key, required this.label, required this.onselected});

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
        widget.onselected;
      },
      selected: isSelected,
      selectedColor: MyColors.primary,
      checkmarkColor: Colors.white,

      backgroundColor: Color(0xFFF5F5F5),
      label: Text(widget.label),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );
  }
}
