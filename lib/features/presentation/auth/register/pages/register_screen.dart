import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_graduation/component/my_main_botton.dart';
import 'package:my_graduation/component/my_text_feild.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Welcome to Dr.record"),
          Gap(10),
          MyTextFeild(hint: "Enter your name", controller: null),
          Gap(10),
          MyTextFeild(hint: "Enter your email", controller: null),
          Gap(10),
          MyTextFeild(hint: "Enter your password", controller: null),
          Gap(20),
          MyMainBotton(title: "Register", onTap: () {}),
        ],
      ),
    );
  }
}
