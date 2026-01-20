import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_graduation/core/lists/diseases_list.dart';
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
        return DiseaseCategoryContainer(title: diseasesList[index]);
      },
      separatorBuilder: (context, index) {
        return Gap(8);
      },
      itemCount:diseasesList.length,
    );
  }
}
