import 'package:flutter/material.dart';
import 'package:my_graduation/component/my_text_feild.dart';

class THerapeuticHistoryForm extends StatelessWidget {
  const THerapeuticHistoryForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyTextFeild(hint: "Drug therapy taken by the patient"),
        MyTextFeild(hint: "Allergy to some drugs."),
        MyTextFeild(hint: "Recent prescribed drugs"),
      ],
    );
  }
}
