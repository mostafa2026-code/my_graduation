import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_graduation/component/my_main_botton.dart';
import 'package:my_graduation/component/my_text_feild.dart';
import 'package:my_graduation/core/const/my_images.dart';
import 'package:my_graduation/core/lists/diseases_list.dart';
import 'package:my_graduation/features/data/models/patient_model.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/cubit/add_edit_patient_cubit.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/cubit/complain_analysis_cubit.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/cubit/family_history_form_cubit.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/cubit/past_medical_history_cubit.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/cubit/personal_history_form_cubit.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/cubit/theraputic_history_form_cubit.dart';

import 'package:my_graduation/features/presentation/add_edit_patient/widgets/complain_analysis_form.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/widgets/family_history_form.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/widgets/history_grid_view.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/widgets/past_medical_history_form.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/widgets/personal_history_form.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/widgets/therapeutic_history_form.dart';

class AddEditPatient extends StatefulWidget {
  const AddEditPatient({super.key, this.patientModelToedit});
  final PatientModel? patientModelToedit;

  @override
  State<AddEditPatient> createState() => _AddEditPatientState();
}

class _AddEditPatientState extends State<AddEditPatient> {
  late final bool isEdit;

  late final AddEditPatientCubit cubit;
  TextEditingController examinationAbnormalitiesController =
      TextEditingController();
  TextEditingController neededInvestigationsController =
      TextEditingController();
  TextEditingController diagnosisController = TextEditingController();
  String? selectedDiagnosis;
  @override
  void initState() {
    super.initState();
    if (widget.patientModelToedit != null) {
      isEdit = true;
      PatientModel patientModel = widget.patientModelToedit!;
      examinationAbnormalitiesController.text = patientModel
          .examinationAbnormalities
          .toString();
      neededInvestigationsController.text = patientModel.neededInvestigation
          .toString();
      diagnosisController.text = patientModel.diagnosis.toString();
    }

    cubit = AddEditPatientCubit();
    cubit.generateDoc(cubit.generatePatient()!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(isEdit ? "Edit Patient" : "Add Patient")),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                HistoryGridView(
                  cubit: cubit,
                  patientModel: cubit.currentPatient,
                ),
                Gap(8),
                MyTextFeild(
                  hint: "Examination Abnormalities",
                  controller: examinationAbnormalitiesController,
                  maxline: 10,
                ),
                Gap(8),
                MyTextFeild(
                  hint: "Needed Investigations ",
                  controller: neededInvestigationsController,
                  maxline: 3,
                ),
                Gap(8),
                Autocomplete(
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    // ignore: unrelated_type_equality_checks
                    if (textEditingValue == "") {
                      return diseasesList;
                    } else {
                      return diseasesList.where(
                        (element) => element.toLowerCase().contains(
                          textEditingValue.text.toLowerCase(),
                        ),
                      );
                    }
                  },
                  onSelected: (value) {
                    setState(() {
                      selectedDiagnosis = value.toString();
                      diagnosisController.text = selectedDiagnosis.toString();
                    });
                  },
                  fieldViewBuilder:
                      (
                        context,
                        textEditingController,
                        focusNode,
                        onFieldSubmitted,
                      ) {
                        return MyTextFeild(
                          hint: "Expected Diagnosis",
                          controller: diagnosisController,
                          focusNode: focusNode,
                          ontap: () {
                            FocusScope.of(context).requestFocus(focusNode);
                          },
                        );
                      },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: MyMainBotton(
          title: isEdit ? "Edit" : "Save",
          onTap: () {
            PatientModel patientModel = cubit.currentPatient.copyWith(
              diagnosis: diagnosisController.text.trim(),
              examinationAbnormalities: examinationAbnormalitiesController.text
                  .trim(),
              neededInvestigation: neededInvestigationsController.text.trim(),
            );
            cubit.currentPatient = patientModel;
            cubit.updatePatient();
          },
        ),
      ),
    );
  }
}

class HistoryItemBuilder {
  final String title;
  final String image;
  final Color color;
  final Widget Function(AddEditPatientCubit cubit, PatientModel model)
  bottomSheet;

  HistoryItemBuilder({
    required this.title,
    required this.image,
    required this.color,
    required this.bottomSheet,
  });
}

class ColorsPalette {
  static const Color lightBlue = Color(0xFF4A90E2);
  static const Color darkBlue = Color(0xFF003366);
  static const Color lightGreen = Color(0xFF7ED321);
  static const Color darkGreen = Color(0xFF417505);
  static const Color brightYellow = Color(0xFFF5A623);
  static const Color lightOrange = Color(0xFFFF9500);
  static const Color lightPink = Color(0xFFFF2D55);
  static const Color lightPurple = Color(0xFFBD10E0);
}

List<HistoryItemBuilder> historyCardList = [
  HistoryItemBuilder(
    title: "Personal History",
    image: MyImages.personalHistory,
    color: ColorsPalette.lightBlue,
    bottomSheet: (cubit, model) => PersonalHistoryForm(
      cubit: cubit,
      formCubit: PersonalHistoryFormCubit(),
    ),
  ),
  HistoryItemBuilder(
    title: "History of Present Illness",
    image: MyImages.presentillness,
    color: ColorsPalette.lightPurple,
    bottomSheet: (cubit, model) => ComplainAnalysisForm(
      cubit: cubit,

      complainAnalysisCubit: ComplainAnalysisCubit(),
    ),
  ),
  HistoryItemBuilder(
    title: "Past Medical History ",
    image: MyImages.pastHistory,
    color: ColorsPalette.lightGreen,
    bottomSheet: (cubit, model) => PastMedicalHistoryForm(
      cubit: cubit,
      pastMedicalHistoryCubit: PastMedicalHistoryCubit(),
    ),
  ),
  HistoryItemBuilder(
    title: "Therapeutic History",
    image: MyImages.therapeutic,
    color: ColorsPalette.brightYellow,
    bottomSheet: (cubit, model) => TnerapeuticHistoryForm(
      cubit: cubit,
      theraputicHistoryFormCubit: TheraputicHistoryFormCubit(),
    ),
  ),
  HistoryItemBuilder(
    title: "Family History",
    image: MyImages.familyHistory,
    color: ColorsPalette.lightPurple,
    bottomSheet: (cubit, model) => FamilyHistoryForm(
      cubit: cubit,
      familyHistoryFormCubit: FamilyHistoryFormCubit(),
    ),
  ),
];
