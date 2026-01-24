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
import 'package:my_graduation/features/data/models/patient_model.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/cubit/add_edit_patient_cubit.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/cubit/add_edit_patient_state.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/cubit/complain_analysis_cubit.dart';

class ComplainAnalysisForm extends StatelessWidget {
  const ComplainAnalysisForm({
    super.key,

    required this.cubit,
    required this.patientModel,
    required this.complainAnalysisCubit,
  });

  final PatientModel patientModel;
  final ComplainAnalysisCubit complainAnalysisCubit;
  final AddEditPatientCubit cubit;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: cubit),
        BlocProvider.value(value: complainAnalysisCubit),
      ],
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
                MyTextFeild(
                  hint: "Complain",
                  controller: complainAnalysisCubit.complaintController,
                ),
                const Text("Onset"),
                const Gap(16),
                Wrap(
                  spacing: 8,
                  alignment: WrapAlignment.start,

                  children: [
                    MyChip(
                      isSelected:
                          complainAnalysisCubit.onset == Onset.sudden_onset,
                      label: "Acute",
                      onselected: (_) {
                        complainAnalysisCubit.selectOnset(Onset.sudden_onset);
                      },
                    ),
                    MyChip(
                      isSelected:
                          complainAnalysisCubit.onset == Onset.gradual_onset,
                      label: "Gradual",
                      onselected: (_) {
                        complainAnalysisCubit.selectOnset(Onset.gradual_onset);
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
                      isSelected:
                          complainAnalysisCubit.course == Course.progressive,
                      label: "Progressive",
                      onselected: (_) {
                        complainAnalysisCubit.selectCourse(Course.progressive);
                      },
                    ),
                    MyChip(
                      isSelected:
                          complainAnalysisCubit.course == Course.regressive,
                      label: "Regressive",
                      onselected: (_) {
                        complainAnalysisCubit.selectCourse(Course.regressive);
                      },
                    ),
                    MyChip(
                      isSelected:
                          complainAnalysisCubit.course == Course.intermetent,
                      label: "Intermetent",
                      onselected: (_) {
                        complainAnalysisCubit.selectCourse(Course.intermetent);
                      },
                    ),
                    MyChip(
                      isSelected:
                          complainAnalysisCubit.course == Course.stationary,
                      label: "Stationary",
                      onselected: (_) {
                        complainAnalysisCubit.selectCourse(Course.stationary);
                      },
                    ),
                  ],
                ),

                const Gap(8),
                MyTextFeild(
                  hint: "Duration",
                  controller: complainAnalysisCubit.durationController,
                ),
                const Gap(8),
                MyTextFeild(
                  hint: "Special Character",
                  maxline: 3,
                  controller: complainAnalysisCubit.specialCharacter,
                ),
                const Gap(8),

                MyTextFeild(
                  hint: "Reliveing Factors",
                  controller: complainAnalysisCubit.releivingFactorController,
                ),
                const Gap(8),
                MyTextFeild(
                  hint: "Exagreting Factor ",
                  controller: complainAnalysisCubit.exaeratingFactorController,
                ),
                const Gap(8),
                MyTextFeild(
                  hint: "Associated Symptoms",
                  controller:
                      complainAnalysisCubit.associatedSymptomsController,
                  textInputAction: TextInputAction.done,
                ),
                const Gap(16),
                MyMainBotton(
                  title: "save",
                  onTap: () {
                    PatientModel pateint = patientModel.copyWith(
                      analysisofcomplains: complainAnalysisCubit
                          .saveComplainAnalysisModel(),
                    );

                    log("personal: ${pateint.personalHistory}");

                    log(
                      " associatedSymptomsController: ${complainAnalysisCubit.associatedSymptomsController.text}",
                    );
                    log(
                      " complin: ${complainAnalysisCubit.complaintController.text}",
                    );
                    log(" course: ${complainAnalysisCubit.course}");
                    log(
                      " exaeratingFactorController: ${complainAnalysisCubit.exaeratingFactorController.text}",
                    );
                    log(
                      " releivingFactorController: ${complainAnalysisCubit.releivingFactorController.text}",
                    );

                    cubit.updatePatient(pateint);
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
