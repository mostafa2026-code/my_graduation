import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_graduation/component/my_text_feild.dart';

class TnerapeuticHistoryForm extends StatelessWidget {
  const TnerapeuticHistoryForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Therapeutic History"),
        const Gap(16),
        MyTextFeild(hint: "Drug therapy taken by the patient"),
        const Gap(8),
        MyTextFeild(hint: "Allergy to some drugs."),
        const Gap(8),
        MyTextFeild(hint: "Recent prescribed drugs"),
        const Gap(8),
      ],
    );
  }
}
