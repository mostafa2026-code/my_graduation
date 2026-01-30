import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:my_graduation/core/cubits/theme_cubit.dart';
import 'package:my_graduation/component/my_main_botton.dart';
import 'package:my_graduation/component/my_text_feild.dart';
import 'package:my_graduation/core/const/my_images.dart';
import 'package:my_graduation/core/dialogs/massage_dialog.dart';
import 'package:my_graduation/core/lists/diseases_list.dart';
import 'package:my_graduation/core/navigation/navigation_methods.dart';
import 'package:my_graduation/core/utils/my_text_styles.dart';
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
  bool get isEdit => widget.patientModelToedit != null;

  late final AddEditPatientCubit cubit;
  TextEditingController examinationAbnormalitiesController =
      TextEditingController();
  TextEditingController neededInvestigationsController =
      TextEditingController();
  TextEditingController diagnosisController = TextEditingController();
  @override
  void initState() {
    super.initState();
    cubit = AddEditPatientCubit();
    if (widget.patientModelToedit != null && isEdit) {
      cubit.currentPatient = widget.patientModelToedit!;
      PatientModel patientModel = widget.patientModelToedit!;
      examinationAbnormalitiesController.text = patientModel
          .examinationAbnormalities
          .toString();
      neededInvestigationsController.text = patientModel.neededInvestigation
          .toString();
      diagnosisController.text = patientModel.diagnosis.toString();
      cubit.currentPatient = patientModel;
    } else if (!isEdit) {
      cubit.generateDoc(cubit.generatePatient()!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isEdit ? "Edit Patient" : "Add Patient",
          style: MyTextStyles.appBarTitle,
        ),
        actions: [
          BlocBuilder<ThemeCubit, bool>(
            builder: (context, isDark) {
              return IconButton(
                icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
                onPressed: () {
                  context.read<ThemeCubit>().toggleTheme();
                },
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                HistoryGridView(
                  cubit: cubit,
                  patientModelToEdit: widget.patientModelToedit,
                  isEdit: isEdit,
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
                Autocomplete<String>(
                  initialValue: TextEditingValue(
                    text: diagnosisController.text,
                  ),
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    if (textEditingValue.text.isEmpty) {
                      return diseasesList;
                    }
                    return diseasesList.where(
                      (element) => element.toLowerCase().contains(
                        textEditingValue.text.toLowerCase(),
                      ),
                    );
                  },
                  onSelected: (value) {
                    diagnosisController.text = value;
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
                          controller: textEditingController,
                          focusNode: focusNode,
                          onChanged: (value) {
                            diagnosisController.text = value;
                          },
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
            massageDialog(
              context,
              "Patient saved successfully",
              // ignore: use_build_context_synchronously
            ).then((value) => mypop(context));
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
  final Widget Function(
    AddEditPatientCubit cubit,

    PatientModel? patientModelToEdit,
    bool isEdit,
  )
  buildForm;

  HistoryItemBuilder({
    required this.title,
    required this.image,
    required this.color,
    required this.buildForm,
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
    buildForm: (cubit, patientModelToEdit, isEdit) => PersonalHistoryForm(
      cubit: cubit,
      formCubit: PersonalHistoryFormCubit(),
      patientModelToedit: patientModelToEdit,
      isEdit: isEdit,
    ),
  ),
  HistoryItemBuilder(
    title: "History of Present Illness",
    image: MyImages.presentillness,
    color: ColorsPalette.lightPurple,
    buildForm: (cubit, patientModelToEdit, isEdit) => ComplainAnalysisForm(
      patientModelToEdit: patientModelToEdit,
      cubit: cubit,

      complainAnalysisCubit: ComplainAnalysisCubit(),
      isEdit: isEdit,
    ),
  ),
  HistoryItemBuilder(
    title: "Past Medical History ",
    image: MyImages.pastHistory,
    color: ColorsPalette.lightGreen,
    buildForm: (cubit, patientModelToEdit, isEdit) => PastMedicalHistoryForm(
      patientModelToEdit: patientModelToEdit,
      cubit: cubit,
      pastMedicalHistoryCubit: PastMedicalHistoryCubit(),
      isEdit: isEdit,
    ),
  ),
  HistoryItemBuilder(
    title: "Therapeutic History",
    image: MyImages.therapeutic,
    color: ColorsPalette.brightYellow,
    buildForm: (cubit, patientModelToEdit, isEdit) => TnerapeuticHistoryForm(
      patientModelToEdit: patientModelToEdit,
      cubit: cubit,
      theraputicHistoryFormCubit: TheraputicHistoryFormCubit(),
      isEdit: isEdit,
    ),
  ),
  HistoryItemBuilder(
    title: "Family History",
    image: MyImages.familyHistory,
    color: ColorsPalette.lightPurple,
    buildForm: (cubit, patientModelToEdit, isEdit) => FamilyHistoryForm(
      patientModelToEdit: patientModelToEdit,
      cubit: cubit,
      familyHistoryFormCubit: FamilyHistoryFormCubit(),
      isEdit: isEdit,
    ),
  ),
];
