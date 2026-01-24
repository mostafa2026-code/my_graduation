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
import 'package:my_graduation/features/presentation/add_edit_patient/cubit/add_edit_patient_cubit.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/cubit/add_edit_patient_state.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/cubit/theraputic_history_form_cubit.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/widgets/past_medical_history_form.dart';

class TnerapeuticHistoryForm extends StatelessWidget {
 const  TnerapeuticHistoryForm({super.key, required this.cubit, required this.theraputicHistoryFormCubit});
  final AddEditPatientCubit cubit;

  final TheraputicHistoryFormCubit theraputicHistoryFormCubit;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: cubit),
        BlocProvider.value(value: theraputicHistoryFormCubit),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Therapeutic History"),
              const Gap(16),
              MyTextFeild(
                hint: "Drug therapy taken by the patient",
                controller: theraputicHistoryFormCubit.drugs,
              ),
              const Gap(8),
              MyTextFeild(
                hint: "Allergy to some drugs.",
                controller: theraputicHistoryFormCubit.drugsAllergy,
              ),
              const Gap(8),
              MyTextFeild(
                hint: "Recent prescribed drugs",
                controller: theraputicHistoryFormCubit.recentPrescribedDrugs,
              ),
              const Gap(8),

              MyMainBotton(
                title: "save",
                onTap: () {
                  PatientModel? patient = cubit.currentPatient.copyWith(
                    theraputicHistory: theraputicHistoryFormCubit
                        .saveTheraputicHistoryModel(),
                  );
                  log(theraputicHistoryFormCubit.drugs.toString());
                  log(theraputicHistoryFormCubit.drugsAllergy.toString());
                  log(
                    theraputicHistoryFormCubit.recentPrescribedDrugs.toString(),
                  );
                  cubit.currentPatient = patient;
                  cubit.updatePatient();
                  logMyData(patient);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
