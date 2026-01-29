import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_graduation/core/const/my_images.dart';
import 'package:my_graduation/core/navigation/my_routes.dart';
import 'package:my_graduation/core/navigation/navigation_methods.dart';
import 'package:my_graduation/core/services/shared_prefrences/shared_helper.dart';
import 'package:my_graduation/core/utils/my_colors.dart';
import 'package:my_graduation/core/utils/my_text_styles.dart';
import 'package:my_graduation/features/data/models/onboarding_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingModel> _pages = [
    OnboardingModel(
      image: MyImages.onboarding1,
      title: 'Manage Your Patients',
      description:
          'Easily organize and manage all your patient records in one place.',
    ),
    OnboardingModel(
      image: MyImages.onboarding2,
      title: 'Track Health History',
      description:
          'Keep a detailed record of medical history and treatments for better care.',
    ),
    OnboardingModel(
      image: MyImages.onboarding3,
      title: 'Smart Analysis',
      description:
          'Analyze symptoms and diagnoses with advanced digital tools.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {
                  SharedHelper.saveOnboardingDone();
                  mygo(context, MyRoutes.welcome, null);
                },
                child: Text(
                  'Skip',
                  style: MyTextStyles.textButton.copyWith(
                    color: MyColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return OnboardingItem(model: _pages[index]);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: _pages.length,
                    effect: ExpandingDotsEffect(
                      dotHeight: 8,
                      dotWidth: 8,
                      spacing: 8,
                      activeDotColor: MyColors.primary,
                      dotColor: MyColors.primary.withAlpha(50),
                    ),
                  ),
                  FadeInRight(
                    duration: const Duration(milliseconds: 500),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_currentPage == _pages.length - 1) {
                          SharedHelper.saveOnboardingDone();
                          mygo(context, MyRoutes.welcome, null);
                        } else {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MyColors.primary,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        _currentPage == _pages.length - 1
                            ? 'Get Started'
                            : 'Next',
                        style: MyTextStyles.buttonMedium,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingItem extends StatelessWidget {
  final OnboardingModel model;

  const OnboardingItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeInDown(
            duration: const Duration(milliseconds: 800),
            child: Image.asset(
              model.image,
              height: MediaQuery.of(context).size.height * 0.4,
              fit: BoxFit.contain,
            ),
          ),
          const Gap(40),
          FadeInUp(
            duration: const Duration(milliseconds: 800),
            child: Text(
              model.title,
              textAlign: TextAlign.center,
              style: MyTextStyles.headlineMedium.copyWith(
                color: MyColors.textPrimary,
              ),
            ),
          ),
          const Gap(16),
          FadeInUp(
            duration: const Duration(milliseconds: 1000),
            child: Text(
              model.description,
              textAlign: TextAlign.center,
              style: MyTextStyles.bodyLarge.copyWith(
                color: MyColors.textSecondary.withAlpha(200),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
