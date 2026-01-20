import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_graduation/features/data/models/patient_model.dart';
import 'package:my_graduation/features/presentation/home/widgets/patient_card.dart';

class PatientsListView extends StatelessWidget {
  const PatientsListView({super.key, required this.patients});
  final List<PatientModel>? patients;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: patients?.length ?? 0,
      separatorBuilder: (BuildContext context, int index) {
        return Gap(8);
      },
      itemBuilder: (BuildContext context, int index) {
        log(patients.toString());
        return PatientCard(model: patients![index]);
      },
    );
  }
}
