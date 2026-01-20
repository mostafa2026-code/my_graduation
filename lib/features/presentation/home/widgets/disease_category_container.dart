import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_graduation/core/const/my_images.dart';
import 'package:my_graduation/core/navigation/my_routes.dart';
import 'package:my_graduation/core/navigation/navigation_methods.dart';
import 'package:my_graduation/core/utils/my_colors.dart';

class DiseaseCategoryContainer extends StatelessWidget {
  const DiseaseCategoryContainer({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        mypush(context, MyRoutes.patientsByDisease, title);
      },
      child: Container(
        width: 135,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: MyColors.primaryLight,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(20),
            Image.asset(MyImages.sickness, height: 100, fit: BoxFit.cover),
            Gap(8),
            Expanded(child: Text(title, textAlign: TextAlign.center)),
            Gap(20),
          ],
        ),
      ),
    );
  }
}
