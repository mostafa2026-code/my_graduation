import 'package:flutter/material.dart';
import 'package:my_graduation/component/my_main_botton.dart';
import 'package:my_graduation/component/my_text_feild.dart';
import 'package:my_graduation/core/const/my_images.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/widgets/complain_analysis_form.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/widgets/history_grid_view.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/widgets/personal_history_form.dart';

class AddEditPatient extends StatelessWidget {
  const AddEditPatient({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add/Edit Patient')),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [HistoryGridView()]),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(20),
        child: MyMainBotton(title: "Save", onTap: () {}),
      ),
    );
  }
}



class HistoryItemBuilder {
  final String title;
  final String image;
  final Color color;
  final Widget bottomSheet;

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
    bottomSheet: PersonalHistoryForm(),
  ),
  HistoryItemBuilder(
    title: "History of Present Illness",
    image: MyImages.presentillness,
    color: ColorsPalette.lightPurple,
    bottomSheet: ComplainAnalysisForm(),
  ),
  HistoryItemBuilder(
    title: "Past Medical History ",
    image: MyImages.pastHistory,
    color: ColorsPalette.lightGreen,
    bottomSheet: PastMedicalHistory(),
  ),
  HistoryItemBuilder(
    title: "Therapeutic History",
    image: MyImages.therapeutic,
    color: ColorsPalette.brightYellow,
    bottomSheet: TherapeuticHistory(),
  ),
  HistoryItemBuilder(
    title: "Family History",
    image: MyImages.familyHistory,
    color: ColorsPalette.lightPurple,
    bottomSheet: FamilyHistory(),
  ),
];

class HistoryOfPresentIllness extends StatelessWidget {
  const HistoryOfPresentIllness({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 10,
          children: [
            Text("History of Present Illness"),
            MyTextFeild(hint: "Name"),
            MyTextFeild(hint: "Name"),
            MyTextFeild(hint: "Name"),
            MyTextFeild(hint: "Name"),
            MyTextFeild(hint: "Name"),
            MyTextFeild(hint: "Name"),
            MyTextFeild(hint: "Name"),
            MyTextFeild(hint: "Name"),
            MyTextFeild(hint: "Name"),
            MyTextFeild(hint: "Name"),
            MyMainBotton(title: "save", onTap: () {}),
          ],
        ),
      ),
    );
  }
}

class FamilyHistory extends StatelessWidget {
  const FamilyHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 10,
          children: [
            Text("Family History"),
            MyTextFeild(hint: "Name"),
            MyTextFeild(hint: "Name"),
            MyTextFeild(hint: "Name"),
            MyTextFeild(hint: "Name"),
            MyTextFeild(hint: "Name"),
            MyTextFeild(hint: "Name"),
            MyTextFeild(hint: "Name"),
            MyTextFeild(hint: "Name"),
            MyTextFeild(hint: "Name"),
            MyTextFeild(hint: "Name"),
            MyMainBotton(title: "save", onTap: () {}),
          ],
        ),
      ),
    );
  }
}

class TherapeuticHistory extends StatelessWidget {
  const TherapeuticHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 10,
          children: [
            Text("Therapeutic"),
            MyTextFeild(hint: "Name"),
            MyTextFeild(hint: "Name"),
            MyTextFeild(hint: "Name"),
            MyTextFeild(hint: "Name"),
            MyTextFeild(hint: "Name"),
            MyTextFeild(hint: "Name"),
            MyTextFeild(hint: "Name"),
            MyTextFeild(hint: "Name"),
            MyTextFeild(hint: "Name"),
            MyTextFeild(hint: "Name"),
            MyMainBotton(title: "save", onTap: () {}),
          ],
        ),
      ),
    );
  }
}

class PastMedicalHistory extends StatelessWidget {
  const PastMedicalHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 10,
          children: [
            Text("Past medical History"),
            MyTextFeild(hint: "Name"),
            MyTextFeild(hint: "Name"),
            MyTextFeild(hint: "Name"),
            MyTextFeild(hint: "Name"),
            MyTextFeild(hint: "Name"),
            MyTextFeild(hint: "Name"),
            MyTextFeild(hint: "Name"),
            MyTextFeild(hint: "Name"),
            MyTextFeild(hint: "Name"),
            MyTextFeild(hint: "Name"),
            MyMainBotton(title: "save", onTap: () {}),
          ],
        ),
      ),
    );
  }
}
