import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:my_graduation/component/my_main_botton.dart';
import 'package:my_graduation/component/my_text_feild.dart';
import 'package:my_graduation/core/dialogs/error_dialog.dart';
import 'package:my_graduation/core/dialogs/loading_dialog.dart';
import 'package:my_graduation/core/dialogs/massage_dialog.dart';
import 'package:my_graduation/core/navigation/navigation_methods.dart';
import 'package:my_graduation/features/data/models/patient_model.dart';
import 'package:my_graduation/features/data/models/patient_past_medical_history.dart';
import 'package:my_graduation/features/data/models/patient_personal_history.dart';
import 'package:my_graduation/features/data/models/patient_therapuetic_history.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/cubit/add_edit_patient_cubit.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/cubit/add_edit_patient_state.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/cubit/past_medical_history_cubit.dart';

// ignore: must_be_immutable
class PastMedicalHistoryForm extends StatefulWidget {
  const PastMedicalHistoryForm({
    super.key,
    required this.cubit,
    required this.pastMedicalHistoryCubit,
    this.patientModelToEdit,
    required this.isEdit,
  });

  final AddEditPatientCubit cubit;

  final PastMedicalHistoryCubit pastMedicalHistoryCubit;
  final PatientModel? patientModelToEdit;
  final bool isEdit;

  @override
  State<PastMedicalHistoryForm> createState() => _PastMedicalHistoryFormState();
}

class _PastMedicalHistoryFormState extends State<PastMedicalHistoryForm> {
  @override
  void initState() {
    super.initState();
    if (widget.patientModelToEdit != null) {
      PatientPastMedicalHistory pastMedicalHistory =
          PatientPastMedicalHistory.fromJson(
            widget.patientModelToEdit!.pastMedicalHistory ?? {},
          );

      widget.pastMedicalHistoryCubit.similarConditionController.text =
          pastMedicalHistory.similarCondition ?? "";
      widget.pastMedicalHistoryCubit.previousHospitalizationController.text =
          pastMedicalHistory.previousHospitalizationCondition ?? "";
      widget.pastMedicalHistoryCubit.previosChronicDiseasesController.text =
          pastMedicalHistory.previousChronicDiseases ?? "";
      widget.pastMedicalHistoryCubit.bloodTransfusionController.text =
          pastMedicalHistory.bloodTransfusion ?? "";
      widget.pastMedicalHistoryCubit.foodAllergyController.text =
          pastMedicalHistory.foodAllergy ?? "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: widget.cubit),
        BlocProvider.value(value: widget.pastMedicalHistoryCubit),
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
              "Past Medical History saved successfully",
            ).then((value) => mypop(context));
          }
          if (state is AddEditPatientFailure) {
            mypop(context);
            errorDialog(context, state.error);
          }
        },
        child: SingleChildScrollView(
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
                  controller:
                      widget.pastMedicalHistoryCubit.similarConditionController,
                ),
                const Gap(8),

                MyTextFeild(
                  hint: "Previous hospitalization",
                  controller: widget
                      .pastMedicalHistoryCubit
                      .previousHospitalizationController,
                ),
                const Gap(8),
                MyTextFeild(
                  hint: "Previous chronic diseases",
                  controller: widget
                      .pastMedicalHistoryCubit
                      .previosChronicDiseasesController,
                ),
                const Gap(8),

                MyTextFeild(
                  hint: "Blood transfusion",
                  controller:
                      widget.pastMedicalHistoryCubit.bloodTransfusionController,
                ),
                const Gap(8),
                MyTextFeild(
                  hint: "Food allergy",
                  controller:
                      widget.pastMedicalHistoryCubit.foodAllergyController,
                  textInputAction: TextInputAction.done,
                ),
                const Gap(8),
                MyMainBotton(
                  title: "save",
                  onTap: () {
                    PatientModel patient = widget.cubit.currentPatient.copyWith(
                      pastMedicalHistory: widget.pastMedicalHistoryCubit
                          .setPastMedicalHistoryModel(),
                    );
                    log(
                      widget.pastMedicalHistoryCubit.similarConditionController
                          .toString(),
                    );
                    log(
                      widget
                          .pastMedicalHistoryCubit
                          .previousHospitalizationController
                          .toString(),
                    );
                    log(
                      widget
                          .pastMedicalHistoryCubit
                          .previosChronicDiseasesController
                          .toString(),
                    );
                    log(
                      widget.pastMedicalHistoryCubit.bloodTransfusionController
                          .toString(),
                    );
                    log(
                      widget.pastMedicalHistoryCubit.foodAllergyController
                          .toString(),
                    );

                    widget.cubit.currentPatient = patient;
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

logMyData(PatientModel model) {
  log(model.toString());
  log(model.id.toString());
  log(model.doctorId.toString());
  log(model.doctorName.toString());
  log(model.diagnosis.toString());
  log(model.personalHistory.toString());
  log(model.analysisofcomplains.toString());
  log(model.pastMedicalHistory.toString());
  log(model.phone.toString());
  PatientPersonalHistory personalHistory = PatientPersonalHistory.fromJson(
    model.personalHistory ?? {},
  );

  log(personalHistory.toString());

  log(personalHistory.address.toString());

  log(personalHistory.age.toString());

  log(personalHistory.martialStatus.toString());

  log(personalHistory.childrenNumber.toString());

  log(personalHistory.occupation.toString());

  log(personalHistory.occupation.toString());

  PatientTherapueticHistory therapeutic = PatientTherapueticHistory.fromJson(
    model.personalHistory ?? {},
  );
  log(therapeutic.toString());

  log(therapeutic.allergyToDrugs.toString());

  log(therapeutic.drugTherapy.toString());

  log(therapeutic.recentPrescribedDrugs.toString());
}
