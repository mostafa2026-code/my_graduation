import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_graduation/features/data/models/patient_model.dart';
import 'package:my_graduation/features/presentation/home/widgets/patient_card.dart';

class ComplicatedCasesListView extends StatelessWidget {
  const ComplicatedCasesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return PatientCard(model:PatientModel());
      },
      separatorBuilder: (context, index) {
        return Gap(8);
      },
      itemCount: 10,
    );
  }
}
