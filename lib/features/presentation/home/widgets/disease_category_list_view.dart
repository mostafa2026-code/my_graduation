import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_graduation/features/presentation/home/widgets/disease_category_container.dart';

class DiseaseCategoryListView extends StatelessWidget {
  const DiseaseCategoryListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return DiseaseCategoryContainer();
      },
      separatorBuilder: (context, index) {
        return Gap(8);
      },
      itemCount: 10,
    );
  }
}
