import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_graduation/features/data/models/patient_model.dart';
import 'package:my_graduation/features/presentation/home/widgets/patient_card.dart';

import 'package:skeletonizer/skeletonizer.dart';

class PatientsListView extends StatelessWidget {
  const PatientsListView({
    super.key,
    required this.patients,
    this.isLoading = false,
  });
  final List<PatientModel>? patients;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: isLoading ? 5 : (patients?.length ?? 0),
        separatorBuilder: (BuildContext context, int index) {
          return Gap(8);
        },
        itemBuilder: (BuildContext context, int index) {
          return PatientCard(
            model: isLoading ? PatientModel.dummy() : patients![index],
          );
        },
      ),
    );
  }
}
