import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_graduation/core/const/my_images.dart';
import 'package:my_graduation/core/navigation/my_routes.dart';
import 'package:my_graduation/core/utils/my_colors.dart';
import 'package:my_graduation/core/utils/my_text_styles.dart';

import 'package:my_graduation/core/navigation/navigation_methods.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background pattern or soft gradient could be added here
          Positioned(
            top: -100,
            right: -100,
            child: FadeInDown(
              duration: const Duration(milliseconds: 1000),
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  color: MyColors.primary.withAlpha(20),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -50,
            left: -50,
            child: FadeInUp(
              duration: const Duration(milliseconds: 1000),
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: MyColors.accent.withAlpha(20),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  FadeInDown(
                    duration: const Duration(milliseconds: 800),
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: MyColors.primary.withAlpha(30),
                              blurRadius: 30,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Image.asset(
                          MyImages.logo, // Using the app logo
                          height: 120,
                        ),
                      ),
                    ),
                  ),
                  const Gap(40),
                  FadeInUp(
                    duration: const Duration(milliseconds: 800),
                    child: Text(
                      'Welcome to Dr. Record',
                      textAlign: TextAlign.center,
                      style: MyTextStyles.displaySmall.copyWith(
                        color: MyColors.textPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Gap(16),
                  FadeInUp(
                    duration: const Duration(milliseconds: 1000),
                    child: Text(
                      'Your professional digital medical assistant for efficient patient record management.',
                      textAlign: TextAlign.center,
                      style: MyTextStyles.bodyLarge.copyWith(
                        color: MyColors.textSecondary.withAlpha(200),
                      ),
                    ),
                  ),
                  const Spacer(),
                  FadeInUp(
                    duration: const Duration(milliseconds: 1200),
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () =>
                                mygo(context, MyRoutes.login, null),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: MyColors.primary,
                              padding: const EdgeInsets.symmetric(vertical: 18),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              elevation: 4,
                              shadowColor: MyColors.primary.withAlpha(100),
                            ),
                            child: const Text(
                              'Login',
                              style: MyTextStyles.buttonLarge,
                            ),
                          ),
                        ),
                        const Gap(20),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: () =>
                                mygo(context, MyRoutes.register, null),
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 18),
                              side: BorderSide(
                                color: MyColors.primary,
                                width: 2,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: Text(
                              'Create Account',
                              style: MyTextStyles.buttonLarge.copyWith(
                                color: MyColors.primary,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
