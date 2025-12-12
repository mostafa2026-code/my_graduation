import 'package:flutter/material.dart';
import 'package:my_graduation/component/my_main_botton.dart';
import 'package:my_graduation/component/my_text_feild.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController newPasswordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyTextFeild(
              hint: "Enter a new passwrd",
              controller: newPasswordController,
            ),
            MyTextFeild(
              hint: "Confirm the new passwrd",
              controller: confirmPasswordController,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8),
        child: MyMainBotton(title: "Reset password", onTap: () {}),
      ),
    );
  }
}
