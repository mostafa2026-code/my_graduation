import 'package:flutter/material.dart';
import 'package:my_graduation/core/utils/my_text_styles.dart';

class MyTextBottn extends StatelessWidget {
  final String text;
  final Function()? onTap;
  const MyTextBottn({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(text, style: MyTextStyles.textButton),
    );
  }
}
