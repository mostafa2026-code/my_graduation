import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_graduation/features/presentation/home/widgets/patient_card.dart';

class ComplicatedCasesListView extends StatelessWidget {
  const ComplicatedCasesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return PatientCard();
        },
        separatorBuilder: (context, index) {
          return Gap(8);
        },
        itemCount: 10,
      ),
    );
  }
}
