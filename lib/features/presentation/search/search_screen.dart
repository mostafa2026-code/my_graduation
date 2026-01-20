import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_graduation/core/const/my_images.dart';
import 'package:my_graduation/core/utils/my_colors.dart';


class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
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
                  Image.asset(MyImages.sickness, height: 70, fit: BoxFit.cover),
                  Gap(8),
                  Text("Heart Failure"),
                  Gap(8),
                  Text("number"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
