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
import 'package:my_graduation/features/data/models/patientcomplain_analysis.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/cubit/add_edit_patient_cubit.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/cubit/add_edit_patient_state.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/cubit/complain_analysis_cubit.dart';

class ComplainAnalysisForm extends StatefulWidget {
  const ComplainAnalysisForm({
    super.key,

    required this.cubit,

    required this.complainAnalysisCubit,
    this.patientModelToEdit,
    required this.isEdit,
  });

  final ComplainAnalysisCubit complainAnalysisCubit;
  final AddEditPatientCubit cubit;
  final PatientModel? patientModelToEdit;
  final bool isEdit;

  @override
  State<ComplainAnalysisForm> createState() => _ComplainAnalysisFormState();
}

class _ComplainAnalysisFormState extends State<ComplainAnalysisForm> {
  @override
  void initState() {
    super.initState();
    if (widget.patientModelToEdit != null) {
      PatientcomplainAnalysis patientcomplainAnalysis =
          PatientcomplainAnalysis.fromJson(
            widget.patientModelToEdit!.analysisofcomplains ?? {},
          );
      widget.complainAnalysisCubit.complaintController.text =
          patientcomplainAnalysis.complain ?? "";
      widget.complainAnalysisCubit.associatedSymptomsController.text =
          patientcomplainAnalysis.associatedSymptoms ?? "";
      widget.complainAnalysisCubit.durationController.text =
          patientcomplainAnalysis.duration ?? "";
      widget.complainAnalysisCubit.exaeratingFactorController.text =
          patientcomplainAnalysis.aggravatingFactors ?? "";
      widget.complainAnalysisCubit.releivingFactorController.text =
          patientcomplainAnalysis.reliefFactors ?? "";
      widget.complainAnalysisCubit.specialCharacter.text =
          patientcomplainAnalysis.specialCharacteristics ?? "";
      widget.complainAnalysisCubit.onset = patientcomplainAnalysis.onset ?? "";
      widget.complainAnalysisCubit.course =
          patientcomplainAnalysis.course ?? "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: widget.cubit),
        BlocProvider.value(value: widget.complainAnalysisCubit),
      ],
      child: BlocListener<AddEditPatientCubit, AddEditPatientState>(
        listener: (context, state) {
          if (state is AddEditPatientLoading) {
            mypop(context);
            loadingDialog(context);
          }
          if (state is AddEditPatientSuccess) {
            mypop(context);
            massageDialog(
              context,
              "Complain Analysis saved successfully",
            // ignore: use_build_context_synchronously
            ).then((value) => mypop(context));
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
                  controller: widget.complainAnalysisCubit.complaintController,
                ),
                const Text("Onset"),
                const Gap(16),

                BlocBuilder<ComplainAnalysisCubit, ComplainAnalysisState>(
                  builder: (context, state) {
                    return Wrap(
                      spacing: 8,
                      alignment: WrapAlignment.start,

                      children: [
                        MyChip(
                          isSelected:
                              widget.complainAnalysisCubit.onset ==
                              Onset.sudden_onset.name,
                          label: "Acute",
                          onselected: (_) {
                            widget.complainAnalysisCubit.selectOnset(
                              Onset.sudden_onset,
                            );
                          },
                        ),
                        MyChip(
                          isSelected:
                              widget.complainAnalysisCubit.onset ==
                              Onset.gradual_onset.name,
                          label: "Gradual",
                          onselected: (_) {
                            widget.complainAnalysisCubit.selectOnset(
                              Onset.gradual_onset,
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
                const Gap(8),
                const Text("Course"),
                const Gap(16),
                BlocBuilder<ComplainAnalysisCubit, ComplainAnalysisState>(
                  builder: (context, state) {
                    return Wrap(
                      spacing: 8,
                      children: [
                        MyChip(
                          isSelected:
                              widget.complainAnalysisCubit.course ==
                              Course.progressive.name,
                          label: "Progressive",
                          onselected: (_) {
                            widget.complainAnalysisCubit.selectCourse(
                              Course.progressive,
                            );
                          },
                        ),
                        MyChip(
                          isSelected:
                              widget.complainAnalysisCubit.course ==
                              Course.regressive.name,
                          label: "Regressive",
                          onselected: (_) {
                            widget.complainAnalysisCubit.selectCourse(
                              Course.regressive,
                            );
                          },
                        ),
                        MyChip(
                          isSelected:
                              widget.complainAnalysisCubit.course ==
                              Course.intermetent.name,
                          label: "Intermetent",
                          onselected: (_) {
                            widget.complainAnalysisCubit.selectCourse(
                              Course.intermetent,
                            );
                          },
                        ),
                        MyChip(
                          isSelected:
                              widget.complainAnalysisCubit.course ==
                              Course.stationary.name,
                          label: "Stationary",
                          onselected: (_) {
                            widget.complainAnalysisCubit.selectCourse(
                              Course.stationary,
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),

                const Gap(8),
                MyTextFeild(
                  hint: "Duration",
                  controller: widget.complainAnalysisCubit.durationController,
                ),
                const Gap(8),
                MyTextFeild(
                  hint: "Special Character",
                  maxline: 3,
                  controller: widget.complainAnalysisCubit.specialCharacter,
                ),
                const Gap(8),

                MyTextFeild(
                  hint: "Reliveing Factors",
                  controller:
                      widget.complainAnalysisCubit.releivingFactorController,
                ),
                const Gap(8),
                MyTextFeild(
                  hint: "Exagreting Factor ",
                  controller:
                      widget.complainAnalysisCubit.exaeratingFactorController,
                ),
                const Gap(8),
                MyTextFeild(
                  hint: "Associated Symptoms",
                  controller:
                      widget.complainAnalysisCubit.associatedSymptomsController,
                  textInputAction: TextInputAction.done,
                ),
                const Gap(16),
                MyMainBotton(
                  title: "save",
                  onTap: () {
                    PatientModel pateint = widget.cubit.currentPatient.copyWith(
                      analysisofcomplains: widget.complainAnalysisCubit
                          .saveComplainAnalysisModel(),
                    );

                    log("personal: ${pateint.personalHistory}");

                    log(
                      " associatedSymptomsController: ${widget.complainAnalysisCubit.associatedSymptomsController.text}",
                    );
                    log(
                      " complin: ${widget.complainAnalysisCubit.complaintController.text}",
                    );
                    log(" course: ${widget.complainAnalysisCubit.course}");
                    log(
                      " exaeratingFactorController: ${widget.complainAnalysisCubit.exaeratingFactorController.text}",
                    );
                    log(
                      " releivingFactorController: ${widget.complainAnalysisCubit.releivingFactorController.text}",
                    );

                    widget.cubit.currentPatient = pateint;
                    widget.cubit.updatePatient();
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
