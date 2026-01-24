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
import 'package:my_graduation/features/data/models/patient_personal_history.dart';
import 'package:my_graduation/features/data/models/patient_therapuetic_history.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/cubit/add_edit_patient_cubit.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/cubit/add_edit_patient_state.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/cubit/past_medical_history_cubit.dart';

// ignore: must_be_immutable
class PastMedicalHistoryForm extends StatelessWidget {
  const PastMedicalHistoryForm({
    super.key,
    required this.cubit,
    required this.model,
    required this.pastMedicalHistoryCubit,
  });
  final PatientModel model;

  final AddEditPatientCubit cubit;

  final PastMedicalHistoryCubit pastMedicalHistoryCubit;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: cubit),
        BlocProvider.value(value: pastMedicalHistoryCubit),
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
                      pastMedicalHistoryCubit.similarConditionController,
                ),
                const Gap(8),

                MyTextFeild(
                  hint: "Previous hospitalization",
                  controller:
                      pastMedicalHistoryCubit.previousHospitalizationController,
                ),
                const Gap(8),
                MyTextFeild(
                  hint: "Previous chronic diseases",
                  controller:
                      pastMedicalHistoryCubit.previosChronicDiseasesController,
                ),
                const Gap(8),

                MyTextFeild(
                  hint: "Blood transfusion",
                  controller:
                      pastMedicalHistoryCubit.bloodTransfusionController,
                ),
                const Gap(8),
                MyTextFeild(
                  hint: "Food allergy",
                  controller: pastMedicalHistoryCubit.foodAllergyController,
                  textInputAction: TextInputAction.done,
                ),
                const Gap(8),
                MyMainBotton(
                  title: "save",
                  onTap: () {
                    PatientModel? patientModel = pastMedicalHistoryCubit
                        .savePastMedicalHistoryModel(model);

                    log(
                      pastMedicalHistoryCubit.similarConditionController
                          .toString(),
                    );
                    log(
                      pastMedicalHistoryCubit.previousHospitalizationController
                          .toString(),
                    );
                    log(
                      pastMedicalHistoryCubit.previosChronicDiseasesController
                          .toString(),
                    );
                    log(
                      pastMedicalHistoryCubit.bloodTransfusionController
                          .toString(),
                    );
                    log(
                      pastMedicalHistoryCubit.foodAllergyController.toString(),
                    );

                    if (patientModel != null) {
                      cubit.updatePatient(patientModel);
                      logMyData(patientModel);
                    }
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
