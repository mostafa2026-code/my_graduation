import 'package:flutter/material.dart';
import 'package:my_graduation/component/my_main_botton.dart';
import 'package:my_graduation/core/const/my_images.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/cubit/add_edit_patient_cubit.dart';
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
  late final String id;

  @override
  void initState() {
    super.initState();

    cubit = AddEditPatientCubit();
    id = cubit.generateId();
    cubit.id = id;
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
              children: [HistoryGridView(cubit: cubit, id: id)],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: MyMainBotton(title: "Save", onTap: () {}),
      ),
    );
  }
}

class HistoryItemBuilder {
  final String title;
  final String image;
  final Color color;
  final Widget Function(AddEditPatientCubit cubit, String id) bottomSheet;

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
    bottomSheet: (cubit, id) => PersonalHistoryForm(id: id, cubit: cubit),
  ),
  HistoryItemBuilder(
    title: "History of Present Illness",
    image: MyImages.presentillness,
    color: ColorsPalette.lightPurple,
    bottomSheet: (cubit, id) => ComplainAnalysisForm(id: id, cubit: cubit),
  ),
  HistoryItemBuilder(
    title: "Past Medical History ",
    image: MyImages.pastHistory,
    color: ColorsPalette.lightGreen,
    bottomSheet: (cubit, id) => PastMedicalHistoryForm(id: id, cubit: cubit),
  ),
  HistoryItemBuilder(
    title: "Therapeutic History",
    image: MyImages.therapeutic,
    color: ColorsPalette.brightYellow,
    bottomSheet: (cubit, id) => TnerapeuticHistoryForm(cubit: cubit, id: id),
  ),
  HistoryItemBuilder(
    title: "Family History",
    image: MyImages.familyHistory,
    color: ColorsPalette.lightPurple,
    bottomSheet: (cubit, id) => FamilyHistoryForm(cubit: cubit, id: id),
  ),
];

class FamilyHistoryForm extends StatelessWidget {
  const FamilyHistoryForm({super.key, required this.cubit, required this.id});
  final AddEditPatientCubit cubit;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
