import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_graduation/component/my_chip.dart';
import 'package:my_graduation/component/my_main_botton.dart';
import 'package:my_graduation/component/my_text_feild.dart';
import 'package:my_graduation/core/enums/my_enums.dart';
import 'package:my_graduation/core/services/firebsase/firebase_helper.dart';
import 'package:my_graduation/features/data/models/patientcomplain_analysis.dart';

class ComplainAnalysisForm extends StatefulWidget {
  const ComplainAnalysisForm({super.key, required this.id, required this.name});
  final String id;
  final String name;

  @override
  State<ComplainAnalysisForm> createState() => _ComplainAnalysisFormState();
}

class _ComplainAnalysisFormState extends State<ComplainAnalysisForm> {
  late final Onset onset;
  late final Course course;
  final TextEditingController durationController = TextEditingController();
  final TextEditingController releivingFactorController =
      TextEditingController();
  final TextEditingController exaeratingFactorController =
      TextEditingController();
  final TextEditingController complaintController = TextEditingController();
  final TextEditingController specialCharacter = TextEditingController();
  final TextEditingController associatedSymptomsController =
      TextEditingController();
  late final PatientcomplainAnalysis patientcomplainAnalysis;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Complain Analysis"),
        const Gap(16),
        MyTextFeild(hint: "Complain", controller: complaintController),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Onset"),
            Gap(16),
            Wrap(
              children: [
                MyChip(
                  label: "Acute",
                  onselected: () {
                    onset = Onset.sudden_onset;
                  },
                ),
                MyChip(
                  label: "Gradual",
                  onselected: () {
                    onset = Onset.gradual_onset;
                  },
                ),
              ],
            ),
          ],
        ),
        const Gap(8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Course"),
            MyChip(
              label: "Progressive",
              onselected: () {
                course = Course.progressive;
              },
            ),
            MyChip(
              label: "Regressive",
              onselected: () {
                course = Course.regressive;
              },
            ),
            MyChip(
              label: "Intermetent",
              onselected: () {
                course = Course.intermetent;
              },
            ),
            MyChip(
              label: "Stationary",
              onselected: () {
                course = Course.stationary;
              },
            ),
          ],
        ),

        const Gap(8),
        MyTextFeild(hint: "Duration", controller: durationController),
        const Gap(8),
        MyTextFeild(
          hint: "Special Character",
          maxline: 3,
          controller: specialCharacter,
        ),
        const Gap(8),

        MyTextFeild(
          hint: "Reliveing Factors",
          controller: releivingFactorController,
        ),
        const Gap(8),
        MyTextFeild(
          hint: "Exagreting Factor ",
          controller: exaeratingFactorController,
        ),
        const Gap(8),
        MyTextFeild(
          hint: "Associated Symptoms",
          controller: associatedSymptomsController,
        ),
        const Gap(16),
        MyMainBotton(
          title: "save",
          onTap: () {
            patientcomplainAnalysis = PatientcomplainAnalysis(
              id: widget.id,
              name: widget.name,
              doctorId: FirebaseHelper.getUserId(),
              doctorName: FirebaseHelper.getUserName(),
              onset: onset,
              course: course,
              duration: durationController.text,
              complain: complaintController.text,
              reliefFactors: releivingFactorController.text,
              aggravatingFactors: exaeratingFactorController.text,
              specialCharacteristics: specialCharacter.text,
              associatedSymptoms: associatedSymptomsController.text,
            );
            log(patientcomplainAnalysis.toJson().toString());
          },
        ),
      ],
    );
  }
}
