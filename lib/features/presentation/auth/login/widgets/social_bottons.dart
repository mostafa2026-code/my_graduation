import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';

import 'package:my_graduation/core/const/my_images.dart';

class SocialBottons extends StatelessWidget {
  final VoidCallback onGoogleTap;

  const SocialBottons({super.key, required this.onGoogleTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(MyImages.socialImages.length, (index) {
        return GestureDetector(
          onTap: () {
            onGoogleTap();
          },
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
