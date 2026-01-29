import 'package:flutter/material.dart';
import 'package:my_graduation/core/utils/my_colors.dart';
import 'package:my_graduation/core/utils/my_text_styles.dart';

class MyMainBotton extends StatelessWidget {
  final String title;
  final Function() onTap;
  final double? width;
  final double? height;
  const MyMainBotton({
    super.key,
    required this.title,
    required this.onTap,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,

      style: ElevatedButton.styleFrom(
        backgroundColor: MyColors.button,
        minimumSize: Size(width ?? double.infinity, height ?? 50),
      ),
      child: Text(title, style: MyTextStyles.buttonLarge),
    );
  }
}
