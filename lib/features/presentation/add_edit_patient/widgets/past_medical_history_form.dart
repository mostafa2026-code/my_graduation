import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_graduation/component/my_main_botton.dart';
import 'package:my_graduation/component/my_text_feild.dart';
import 'package:my_graduation/core/services/firebsase/firebase_helper.dart';
import 'package:my_graduation/features/data/models/patient_past_medical_history.dart';

// ignore: must_be_immutable
class PastMedicalHistoryForm extends StatelessWidget {
  PastMedicalHistoryForm({super.key, required this.id, required this.name});
  final String id;
  final String name;

  PatientPastMedicalHistory? patientPastMedicalHistory;

  TextEditingController similarConditionController = TextEditingController();

  TextEditingController previosChronicDiseasesController =
      TextEditingController();

  TextEditingController previousHospitalizationController =
      TextEditingController();

  TextEditingController bloodTransfusionController = TextEditingController();

  TextEditingController foodAllergyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Past Medical History"),
            const Gap(16),
            MyTextFeild(
              hint: "Similar condition",
              controller: similarConditionController,
            ),
            const Gap(8),

            MyTextFeild(
              hint: "Previous hospitalization",
              controller: previousHospitalizationController,
            ),
            const Gap(8),
            MyTextFeild(
              hint: "Previous chronic diseases",
              controller: previosChronicDiseasesController,
            ),
            const Gap(8),

            MyTextFeild(
              hint: "Blood transfusion",
              controller: bloodTransfusionController,
            ),
            const Gap(8),
            MyTextFeild(
              hint: "Food allergy",
              controller: foodAllergyController,
            ),
            const Gap(8),
            MyMainBotton(
              title: "save",
              onTap: () {
                patientPastMedicalHistory = PatientPastMedicalHistory(
                  id: id,
                  doctorId: FirebaseHelper.getUserId(),
                  doctorName: FirebaseHelper.getUserName(),
                  name: name,
                  bloodTransfusion: bloodTransfusionController.text,
                  foodAllergy: foodAllergyController.text,
                  previousChronicDiseases:
                      previosChronicDiseasesController.text,
                  previousHospitalizationCondition:
                      previousHospitalizationController.text,

                  similarCondition: similarConditionController.text,
                );
                log(patientPastMedicalHistory!.toJson().toString());
              },
            ),
          ],
        ),
      ),
    );
  }
}
