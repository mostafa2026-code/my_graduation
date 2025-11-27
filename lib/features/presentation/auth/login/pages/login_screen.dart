import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:my_graduation/core/const/my_images.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Text('Login Screen'),

          // SvgPicture.asset(
          //   MyImages.logo,
          //   height: 150,
          //   width: 150,
          // ),
        ],
      ),
    );
  }
}
