import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_graduation/core/const/my_images.dart';
import 'package:my_graduation/core/utils/my_colors.dart';
import 'package:my_graduation/core/utils/my_text_styles.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About Dr. Record'), elevation: 0),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
                    child: Image.asset(MyImages.logo, height: 120),
                  ),
                ),
              ),
              const Gap(32),
              FadeInUp(
                duration: const Duration(milliseconds: 800),
                child: Text(
                  'Dr. Record',
                  style: MyTextStyles.headlineLarge.copyWith(
                    color: MyColors.textPrimary,
                  ),
                ),
              ),
              const Gap(8),
              FadeInUp(
                duration: const Duration(milliseconds: 900),
                child: Text(
                  'Version 1.0.0',
                  style: MyTextStyles.bodyMedium.copyWith(
                    color: MyColors.textSecondary,
                  ),
                ),
              ),
              const Gap(32),
              FadeInUp(
                duration: const Duration(milliseconds: 1000),
                child: Text(
                  'Dr. Record is a professional digital medical assistant designed to help healthcare providers manage patient records efficiently. Our mission is to streamline medical documentation and improve patient care through modern technology.',
                  textAlign: TextAlign.center,
                  style: MyTextStyles.bodyLarge.copyWith(height: 1.6),
                ),
              ),
              const Gap(40),
              FadeInUp(
                duration: const Duration(milliseconds: 1100),
                child: _buildInfoSection(
                  title: 'Key Features',
                  items: [
                    'Comprehensive Patient Profiles',
                    'Medical History Tracking',
                    'Digital Examination Records',
                    'Smart Analysis Tools',
                    'Secure Clinical Data Management',
                  ],
                ),
              ),
              const Gap(40),
              FadeInUp(
                duration: const Duration(milliseconds: 1200),
                child: Text(
                  '© 2026 Mustafa Abdelrahim Ibrahim.',
                  style: MyTextStyles.bodySmall,
                ),
              ),
              const Gap(24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoSection({
    required String title,
    required List<String> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: MyTextStyles.titleLarge.copyWith(color: MyColors.primary),
        ),
        const Gap(16),
        ...items.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.check_circle_outline,
                  color: MyColors.primary,
                  size: 20,
                ),
                const Gap(12),
                Expanded(child: Text(item, style: MyTextStyles.bodyMedium)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
