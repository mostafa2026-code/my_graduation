import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_graduation/component/my_chip.dart';
import 'package:my_graduation/component/my_main_botton.dart';
import 'package:my_graduation/component/my_text_feild.dart';
import 'package:my_graduation/core/enums/my_enums.dart';
import 'package:my_graduation/core/services/firebsase/firebase_helper.dart';
import 'package:my_graduation/features/data/models/patient_personal_history.dart';

class PersonalHistoryForm extends StatefulWidget {
  const PersonalHistoryForm({super.key, required this.id});
  final String id;

  @override
  State<PersonalHistoryForm> createState() => _PersonalHistoryFormState();
}

class _PersonalHistoryFormState extends State<PersonalHistoryForm> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController ageController = TextEditingController();

  Gender? gender;

  final TextEditingController addressControllor = TextEditingController();

  final TextEditingController occupationController = TextEditingController();

  final TextEditingController childrenNumberController =
      TextEditingController();

  final TextEditingController specailHabitController = TextEditingController();

  SmokingStatus? smokingStatus;

  PatientPersonalHistory? patientPersonalHistory;

  MartialStatus? martialStatus;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(16),
          MyTextFeild(hint: "Name", controller: nameController),
          const Gap(8),
          MyTextFeild(hint: "Age", controller: ageController),
          const Gap(8),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text("Gender"),
              const Gap(16),
              Wrap(
                spacing: 5,
                children: [
                  MyChip(
                    label: "Male",
                    onselected: () {
                      gender = Gender.male;
                    },
                  ),
                  MyChip(
                    label: "Female",
                    onselected: () {
                      gender = Gender.female;
                    },
                  ),
                ],
              ),
            ],
          ),
          const Gap(8),
          MyTextFeild(hint: "Address", controller: addressControllor),
          const Gap(8),
          MyTextFeild(hint: "Occupation", controller: occupationController),
          const Gap(8),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text("Martial Status"),
              const Gap(16),
              Wrap(
                children: [
                  MyChip(
                    label: "Single ",
                    onselected: () {
                      martialStatus = MartialStatus.single;
                    },
                  ),
                  MyChip(
                    label: "Married",
                    onselected: () {
                      martialStatus = MartialStatus.married;
                    },
                  ),
                ],
              ),
            ],
          ),
          if (martialStatus == MartialStatus.married)
            MyTextFeild(
              hint: "Number of Childern",
              controller: childrenNumberController,
            ),
          const Gap(8),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text("Smoking Status"),
              const Gap(16),

              Wrap(
                spacing: 8,
                children: [
                  MyChip(
                    label: "Non Smoker",
                    onselected: () {
                      smokingStatus = SmokingStatus.nonSmoker;
                    },
                  ),

                  MyChip(
                    label: "Ex Smoker",
                    onselected: () {
                      smokingStatus = SmokingStatus.exSmoker;
                    },
                  ),

                  MyChip(
                    label: "Heavy Smoker",
                    onselected: () {
                      smokingStatus = SmokingStatus.heavySmoker;
                    },
                  ),

                  MyChip(
                    label: "light Smoker",
                    onselected: () {
                      smokingStatus = SmokingStatus.lightSmoker;
                    },
                  ),
                ],
              ),
            ],
          ),
          const Gap(8),
          MyTextFeild(
            hint: "Specail Habits",
            controller: specailHabitController,
          ),

          const Gap(8),
          MyMainBotton(
            title: "Save",
            onTap: () {
              patientPersonalHistory = PatientPersonalHistory(
                id: widget.id,
                name: nameController.text,
                age: ageController.text,
                address: addressControllor.text,
                occupation: occupationController.text,
                gender: gender,
                doctorId: FirebaseHelper.getUserId(),
                doctorName: FirebaseHelper.getUserName(),
                martialStatus: martialStatus,
                childrenNumber: int.tryParse(childrenNumberController.text),
                specialHabits: specailHabitController.text,
              );
              log(patientPersonalHistory.toString());
            },
          ),
        ],
      ),
    );
  }
}
