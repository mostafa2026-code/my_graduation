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
import 'package:my_graduation/features/data/models/patient_therapuetic_history.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/cubit/add_edit_patient_cubit.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/cubit/add_edit_patient_state.dart';

class TnerapeuticHistoryForm extends StatelessWidget {
  TnerapeuticHistoryForm({super.key, required this.cubit, required this.model});
  final AddEditPatientCubit cubit;
  final PatientModel model;
  final TextEditingController drugs = TextEditingController();
  final TextEditingController drugsAllergy = TextEditingController();
  final TextEditingController recentPrescribedDrugs = TextEditingController();

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Therapeutic History"),
              const Gap(16),
              MyTextFeild(
                hint: "Drug therapy taken by the patient",
                controller: drugs,
              ),
              const Gap(8),
              MyTextFeild(
                hint: "Allergy to some drugs.",
                controller: drugsAllergy,
              ),
              const Gap(8),
              MyTextFeild(
                hint: "Recent prescribed drugs",
                controller: recentPrescribedDrugs,
              ),
              const Gap(8),

              MyMainBotton(
                title: "save",
                onTap: () {
                  PatientTherapueticHistory patientTherapeuticHistory =
                      PatientTherapueticHistory(
                        id: model.id,
                        doctorId: FirebaseHelper.getUserId(),
                        doctorName: FirebaseHelper.getUserName(),
                        drugTherapy: drugs.text,
                        allergyToDrugs: drugsAllergy.text,
                        recentPrescribedDrugs: recentPrescribedDrugs.text,
                      );

                  cubit.updateTherapeuticHistory(
                    patientTherapeuticHistory.toJson(),
                  );
                  cubit.updatePatient();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
