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
import 'package:my_graduation/core/services/firebsase/firebase_helper.dart';
import 'package:my_graduation/features/data/models/patient_model.dart';
import 'package:my_graduation/features/data/models/patient_past_medical_history.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/cubit/add_edit_patient_cubit.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/cubit/add_edit_patient_state.dart';

// ignore: must_be_immutable
class PastMedicalHistoryForm extends StatelessWidget {
  PastMedicalHistoryForm({super.key, required this.cubit, required this.model});
  final PatientModel model;

  final AddEditPatientCubit cubit;

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
    return BlocProvider.value(
      value: cubit,

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
                      id: model.id,
                      doctorId: FirebaseHelper.getUserId(),
                      doctorName: FirebaseHelper.getUserName(),

                      bloodTransfusion: bloodTransfusionController.text,
                      foodAllergy: foodAllergyController.text,
                      previousChronicDiseases:
                          previosChronicDiseasesController.text,
                      previousHospitalizationCondition:
                          previousHospitalizationController.text,

                      similarCondition: similarConditionController.text,
                    );
                   
                    cubit.updatePastMedicalHistory(patientPastMedicalHistory!.toJson());
    cubit.updatePatient();
                    log(patientPastMedicalHistory!.toJson().toString());
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
