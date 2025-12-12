import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_graduation/component/my_main_botton.dart';
import 'package:my_graduation/component/my_text_feild.dart';
import 'package:my_graduation/core/navigation/my_routes.dart';
import 'package:my_graduation/core/navigation/navigation_methods.dart';

class VerifyEmailForResetPassword extends StatelessWidget {
  const VerifyEmailForResetPassword({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController resetpasswordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text("Reset Password"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Enter your email to reset your password",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const Gap(20),
            MyTextFeild(
              hint: "Enter Your Email",
              controller: resetpasswordController,
            ),

            const Gap(20),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8),
        child: MyMainBotton(title: "Verify", onTap: () {
          mypush(context, MyRoutes.resetPassword, null);
        }),
      ),
    );
  }
}
