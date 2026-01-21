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
import 'package:my_graduation/features/presentation/add_edit_patient/widgets/past_medical_history_form.dart';

class ComplainAnalysisForm extends StatefulWidget {
  const ComplainAnalysisForm({
    super.key,

    required this.cubit,
    required this.patientModel,
  });

  final PatientModel patientModel;
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
                      isSelected: onset == Onset.sudden_onset,
                      label: "Acute",
                      onselected: (_) {
                        onset = Onset.sudden_onset;
                      },
                    ),
                    MyChip(
                      isSelected:onset==Onset.gradual_onset ,
                      label: "Gradual",
                      onselected: (_) {
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
                      isSelected:  course == Course.progressive,
                      label: "Progressive",
                      onselected: (_) {
                        course = Course.progressive;
                      },
                    ),
                    MyChip(
                      isSelected:  course == Course.regressive,
                      label: "Regressive",
                      onselected: (_) {
                        course = Course.regressive;
                      },
                    ),
                    MyChip(
                      isSelected: course == Course.intermetent ,
                      label: "Intermetent",
                      onselected: (_) {
                        course = Course.intermetent;
                      },
                    ),
                    MyChip(
                      isSelected:  course ==Course.stationary,
                      label: "Stationary",
                      onselected: (_) {
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
                    patientcomplainAnalysis = PatientcomplainAnalysis(
                      
                      onset: onset.toString(),
                      course: course.toString(),
                      duration: durationController.text,
                      complain: complaintController.text,
                      reliefFactors: releivingFactorController.text,
                      aggravatingFactors: exaeratingFactorController.text,
                      specialCharacteristics: specialCharacter.text,
                      associatedSymptoms: associatedSymptomsController.text,
                    );
                    PatientModel patient = widget.patientModel.copyWith(
                      analysisofcomplains:
                          patientcomplainAnalysis?.toJson() ?? {},
                    );
                    widget.cubit.updatePatient(patient);
                    logMyData(patient);
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
