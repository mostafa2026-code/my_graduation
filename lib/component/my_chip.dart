import 'package:flutter/material.dart';
import 'package:my_graduation/core/utils/my_text_styles.dart';

class MyChip extends StatefulWidget {
  final String label;
  final void Function(bool) onselected;
  final bool isSelected;

  const MyChip({
    super.key,
    required this.label,
    required this.onselected,
    required this.isSelected,
  });

  @override
  State<MyChip> createState() => _MyChipState();
}

class _MyChipState extends State<MyChip> {
  @override
  Widget build(BuildContext context) {
    return FilterChip(
      onSelected: widget.onselected,
      selected: widget.isSelected,
      selectedColor: Theme.of(context).primaryColor,
      checkmarkColor: Colors.white,
      label: Text(widget.label, style: MyTextStyles.chipText),
      labelStyle: widget.isSelected
          ? MyTextStyles.chipText.copyWith(color: Colors.white)
          : null,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );
  }
}
