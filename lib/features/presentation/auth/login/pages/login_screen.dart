import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_graduation/component/my_main_botton.dart';
import 'package:my_graduation/component/my_text_feild.dart';
import 'package:my_graduation/core/const/my_images.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_graduation/core/utils/my_colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  // final TextEditingController emailLogin = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: SvgPicture.asset(MyImages.doctor, height: 150)),
            Gap(20),
            Text("Welcome Back"),
            Gap(10),
            MyTextFeild(hint: 'Enter your email', controller: null),
            Gap(10),

            MyTextFeild(hint: 'Enter your password', controller: null),

            Text.rich(
              TextSpan(
                text: "Forgot your password?",

                children: [
                  TextSpan(
                    text: " Reset",
                    style: TextStyle(
                      color: MyColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Gap(20),
            MyMainBotton(title: "Login", onTap: () {}),
            Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(child: Divider()),
                Gap(5),
                Text("or continue with"),
                Gap(5),
                Expanded(child: Divider()),
              ],
            ),
            Gap(20),

            SocialBottons(),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: "Don't have an account? "),
                    TextSpan(
                      text: " Register",
                      style: TextStyle(
                        color: MyColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
