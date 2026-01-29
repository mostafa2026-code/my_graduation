import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:my_graduation/component/my_main_botton.dart';
import 'package:my_graduation/component/my_text_feild.dart';
import 'package:my_graduation/features/data/models/family_history.dart';
import 'package:my_graduation/features/data/models/patient_model.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/cubit/add_edit_patient_cubit.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/cubit/family_history_form_cubit.dart';
import 'package:my_graduation/core/dialogs/error_dialog.dart';
import 'package:my_graduation/core/dialogs/loading_dialog.dart';
import 'package:my_graduation/core/dialogs/massage_dialog.dart';
import 'package:my_graduation/core/navigation/navigation_methods.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/cubit/add_edit_patient_state.dart';

class FamilyHistoryForm extends StatefulWidget {
  const FamilyHistoryForm({
    super.key,
    required this.cubit,
    required this.familyHistoryFormCubit,
    this.patientModelToEdit,
    required this.isEdit,
  });
  final AddEditPatientCubit cubit;
  final FamilyHistoryFormCubit familyHistoryFormCubit;
  final PatientModel? patientModelToEdit;
  final bool isEdit;

  @override
  State<FamilyHistoryForm> createState() => _FamilyHistoryFormState();
}

class _FamilyHistoryFormState extends State<FamilyHistoryForm> {
  @override
  void initState() {
    super.initState();
    if (widget.patientModelToEdit != null) {
      PatientFamilyHistory familyHistory = PatientFamilyHistory.fromJson(
        widget.patientModelToEdit!.familyHistory ?? {},
      );

      widget
              .familyHistoryFormCubit
              .herediteryDiseasesOfTheFamilyController
              .text =
          familyHistory.hereditaryDiseasesOfTheFamily ?? "";
      widget
              .familyHistoryFormCubit
              .familyHistoryOfSimilarConditionController
              .text =
          familyHistory.similarCondition ?? "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: widget.cubit),
        BlocProvider.value(value: widget.familyHistoryFormCubit),
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
              "Family History saved successfully",
            ).then((value) => mypop(context));
          }
          if (state is AddEditPatientFailure) {
            mypop(context);
            errorDialog(context, state.error);
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                MyTextFeild(
                  hint: "Hereditery diseases of the family ",
                  controller: widget
                      .familyHistoryFormCubit
                      .herediteryDiseasesOfTheFamilyController,
                ),
                Gap(5),
                MyTextFeild(
                  hint: "Family history of similar condition",
                  controller: widget
                      .familyHistoryFormCubit
                      .familyHistoryOfSimilarConditionController,
                ),
                Gap(20),

                MyMainBotton(
                  title: widget.isEdit ? "Edit" : "Save",
                  onTap: () {
                    widget.cubit.currentPatient = widget.cubit.currentPatient
                        .copyWith(
                          familyHistory: widget.familyHistoryFormCubit
                              .saveFamilyHistory(),
                        );

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
