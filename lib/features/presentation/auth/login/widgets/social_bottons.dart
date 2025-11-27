import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_graduation/core/const/my_images.dart';

class SocialBottons extends StatelessWidget {
  const SocialBottons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return GestureDetector(
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(MyImages.socialImages[index]),
            ),
          ),
        );
      }),
    );
  }
}
