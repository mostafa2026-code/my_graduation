import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PageView.builder(
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Image.asset(
                    'assets/images/onboarding_image_$index.png',
                    height: MediaQuery.of(context).size.height * .6,
                    width: MediaQuery.of(context).size.width * .8,
                    fit: BoxFit.contain,
                  ),
                  Gap(20),
                  Text(
                    "Onboarding Title $index",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
