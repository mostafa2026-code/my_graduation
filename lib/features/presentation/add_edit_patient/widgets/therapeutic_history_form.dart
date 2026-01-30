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
import 'package:my_graduation/features/data/models/patient_therapuetic_history.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/cubit/add_edit_patient_cubit.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/cubit/add_edit_patient_state.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/cubit/theraputic_history_form_cubit.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/widgets/past_medical_history_form.dart';

class TnerapeuticHistoryForm extends StatefulWidget {
  const TnerapeuticHistoryForm({
    super.key,
    required this.cubit,
    required this.theraputicHistoryFormCubit,
    this.patientModelToEdit,
    required this.isEdit,
  });
  final AddEditPatientCubit cubit;

  final TheraputicHistoryFormCubit theraputicHistoryFormCubit;
  final PatientModel? patientModelToEdit;
  final bool isEdit;

  @override
  State<TnerapeuticHistoryForm> createState() => _TnerapeuticHistoryFormState();
}

class _TnerapeuticHistoryFormState extends State<TnerapeuticHistoryForm> {
  @override
  void initState() {
    super.initState();
    if (widget.patientModelToEdit != null) {
      PatientTherapueticHistory therapueticHistory =
          PatientTherapueticHistory.fromJson(
            widget.patientModelToEdit!.theraputicHistory ?? {},
          );

      widget.theraputicHistoryFormCubit.drugs.text =
          therapueticHistory.drugTherapy ?? "";
      widget.theraputicHistoryFormCubit.drugsAllergy.text =
          therapueticHistory.allergyToDrugs ?? "";
      widget.theraputicHistoryFormCubit.recentPrescribedDrugs.text =
          therapueticHistory.recentPrescribedDrugs ?? "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: widget.cubit),
        BlocProvider.value(value: widget.theraputicHistoryFormCubit),
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
              "Therapeutic History saved successfully",
            // ignore: use_build_context_synchronously
            ).then((value) => mypop(context));
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
                controller: widget.theraputicHistoryFormCubit.drugs,
              ),
              const Gap(8),
              MyTextFeild(
                hint: "Allergy to some drugs.",
                controller: widget.theraputicHistoryFormCubit.drugsAllergy,
              ),
              const Gap(8),
              MyTextFeild(
                hint: "Recent prescribed drugs",
                controller:
                    widget.theraputicHistoryFormCubit.recentPrescribedDrugs,
              ),
              const Gap(8),

              MyMainBotton(
                title: "save",
                onTap: () {
                  PatientModel? patient = widget.cubit.currentPatient.copyWith(
                    theraputicHistory: widget.theraputicHistoryFormCubit
                        .saveTheraputicHistoryModel(),
                  );
                  log(widget.theraputicHistoryFormCubit.drugs.toString());
                  log(
                    widget.theraputicHistoryFormCubit.drugsAllergy.toString(),
                  );
                  log(
                    widget.theraputicHistoryFormCubit.recentPrescribedDrugs
                        .toString(),
                  );
                  widget.cubit.currentPatient = patient;
                  widget.cubit.updatePatient();
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
