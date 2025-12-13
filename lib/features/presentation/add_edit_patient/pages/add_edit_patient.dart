import 'package:flutter/material.dart';
import 'package:my_graduation/component/my_main_botton.dart';
import 'package:my_graduation/core/const/my_images.dart';
import 'package:my_graduation/features/data/models/patient_model.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/cubit/add_edit_patient_cubit.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/widgets/chest/chest_inpection_form.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/widgets/complain_analysis_form.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/widgets/history_grid_view.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/widgets/past_medical_history_form.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/widgets/personal_history_form.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/widgets/therapeutic_history_form.dart';

class AddEditPatient extends StatefulWidget {
  const AddEditPatient({super.key});

  @override
  State<AddEditPatient> createState() => _AddEditPatientState();
}

class _AddEditPatientState extends State<AddEditPatient> {
  late final AddEditPatientCubit cubit;
  @override
  void initState() {
    super.initState();

    cubit = AddEditPatientCubit();
    cubit.generateDoc(cubit.generatePatient()!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add/Edit Patient')),
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
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: MyMainBotton(title: "Save", onTap: () {
          cubit.updatePatient();
        }),
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
    bottomSheet: (cubit, model) =>
        PersonalHistoryForm(model: model, cubit: cubit),
  ),
  HistoryItemBuilder(
    title: "History of Present Illness",
    image: MyImages.presentillness,
    color: ColorsPalette.lightPurple,
    bottomSheet: (cubit, model) =>
        ComplainAnalysisForm(cubit: cubit, patientModel: model),
  ),
  HistoryItemBuilder(
    title: "Past Medical History ",
    image: MyImages.pastHistory,
    color: ColorsPalette.lightGreen,
    bottomSheet: (cubit, model) =>
        PastMedicalHistoryForm(model: model, cubit: cubit),
  ),
  HistoryItemBuilder(
    title: "Therapeutic History",
    image: MyImages.therapeutic,
    color: ColorsPalette.brightYellow,
    bottomSheet: (cubit, model) =>
        TnerapeuticHistoryForm(cubit: cubit, model: model),
  ),
  HistoryItemBuilder(
    title: "Family History",
    image: MyImages.familyHistory,
    color: ColorsPalette.lightPurple,
    bottomSheet: (cubit, model) =>
        FamilyHistoryForm(cubit: cubit, model: model),
  ),
  HistoryItemBuilder(
    title: "Chest Inspection",
    image: MyImages.familyHistory,
    color: ColorsPalette.lightPurple,
    bottomSheet: (cubit, model) =>
        ChestInpectionForm(cubit: cubit, model: model),
  ),
];

class FamilyHistoryForm extends StatelessWidget {
  const FamilyHistoryForm({
    super.key,
    required this.cubit,
    required this.model,
  });
  final AddEditPatientCubit cubit;
  final PatientModel model;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
