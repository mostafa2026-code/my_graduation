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

  late final Gender gender;

  final TextEditingController addressControllor = TextEditingController();

  final TextEditingController occupationController = TextEditingController();

  final TextEditingController childrenNumberController =
      TextEditingController();

  final TextEditingController specailHabitController = TextEditingController();

  SmokingStatus? smokingStatus;

  late final PatientPersonalHistory patientPersonalHistory;

  MartialStatus? martialStatus;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(16),
          MyTextFeild(hint: "Name", controller: nameController),
          Gap(8),
          MyTextFeild(hint: "Age", controller: ageController),
          Gap(8),
          Row(
            children: [
              Text("Gender"),
              Gap(16),
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
          Gap(8),
          MyTextFeild(hint: "Address", controller: addressControllor),
          Gap(8),
          MyTextFeild(hint: "Occupation", controller: occupationController),
          Gap(8),
          Row(
            children: [
              Text("Martial Status"),
              Gap(16),
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
          Row(
            children: [
              Text("Smoking Status"),
              Gap(16),

              Wrap(
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
          Gap(8),
          MyTextFeild(
            hint: "Specail Habits",
            controller: specailHabitController,
          ),

          Gap(8),
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
