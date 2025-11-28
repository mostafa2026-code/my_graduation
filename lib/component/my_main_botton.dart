import 'package:flutter/material.dart';
import 'package:my_graduation/core/utils/my_colors.dart';

class MyMainBotton extends StatelessWidget {
  final String title;
  final Function() onTap;
  const MyMainBotton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,

      style: ElevatedButton.styleFrom(
        backgroundColor: MyColors.button,
        minimumSize: Size(double.infinity, 50),
      ),
      child: Text(title, style: TextStyle(color: Colors.white)),
    );
  }
}
