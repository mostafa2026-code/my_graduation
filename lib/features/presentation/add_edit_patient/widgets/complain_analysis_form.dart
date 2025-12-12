import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:my_graduation/component/my_chip.dart';
import 'package:my_graduation/component/my_main_botton.dart';
import 'package:my_graduation/component/my_text_feild.dart';
import 'package:my_graduation/core/dialogs/error_dialog.dart';
import 'package:my_graduation/core/dialogs/loading_dialog.dart';
import 'package:my_graduation/core/dialogs/massage_dialog.dart';
import 'package:my_graduation/core/enums/my_enums.dart';
import 'package:my_graduation/core/navigation/navigation_methods.dart';
import 'package:my_graduation/core/services/firebsase/firebase_helper.dart';
import 'package:my_graduation/features/data/models/patient_model.dart';
import 'package:my_graduation/features/data/models/patientcomplain_analysis.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/cubit/add_edit_patient_cubit.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/cubit/add_edit_patient_state.dart';

class ComplainAnalysisForm extends StatefulWidget {
  const ComplainAnalysisForm({
    super.key,
    required this.id,

    required this.cubit,
  });
  final String id;

  final AddEditPatientCubit cubit;

  @override
  State<ComplainAnalysisForm> createState() => _ComplainAnalysisFormState();
}

class _ComplainAnalysisFormState extends State<ComplainAnalysisForm> {
  Onset? onset;
  Course? course;
  final TextEditingController durationController = TextEditingController();
  final TextEditingController releivingFactorController =
      TextEditingController();
  final TextEditingController exaeratingFactorController =
      TextEditingController();
  final TextEditingController complaintController = TextEditingController();
  final TextEditingController specialCharacter = TextEditingController();
  final TextEditingController associatedSymptomsController =
      TextEditingController();
  PatientcomplainAnalysis? patientcomplainAnalysis;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.cubit,
      child: BlocListener<AddEditPatientCubit, AddEditPatientState>(
        listener: (context, state) {
          if (state is AddEditPatientLoading) {
            mypop(context);
            loadingDialog(context);
          }
          if (state is AddEditPatientSuccess) {
            mypop(context);
            massageDialog(context, "Personal History saved successfully");
          }
          if (state is AddEditPatientFailure) {
            mypop(context);
            errorDialog(context, state.error);
          }
        },

        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Complain Analysis"),
                const Gap(16),
                MyTextFeild(hint: "Complain", controller: complaintController),
                const Text("Onset"),
                const Gap(16),
                Wrap(
                  spacing: 8,
                  alignment: WrapAlignment.start,

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
                const Gap(8),
                const Text("Course"),
                const Gap(16),
                Wrap(
                  spacing: 8,
                  children: [
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
                    PatientModel patientModel = PatientModel(id: widget.id);
                    patientcomplainAnalysis = PatientcomplainAnalysis(
                      id: widget.id,

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
                    log(patientcomplainAnalysis!.toJson().toString());
                    widget.cubit.savePresentIlnessHistory(
                      patientcomplainAnalysis!,
                      patientModel,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
