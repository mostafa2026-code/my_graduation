import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_graduation/component/my_text_feild.dart';

class PastMedicalHistoryForm extends StatelessWidget {
  const PastMedicalHistoryForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Past Medical History"),
        Gap(16),
        MyTextFeild(hint: "Similar condition"),
        const Gap(8),
        MyTextFeild(hint: "Previous hospitalization"),
        const Gap(8),
        MyTextFeild(hint: "Previous hospitalization"),
        const Gap(8),
        MyTextFeild(hint: "Previous chronic diseases"),
        const Gap(8),

        MyTextFeild(hint: "Blood transfusion"),
        const Gap(8),
        MyTextFeild(hint: "Food allergy"),
        const Gap(8),
      ],
    );
  }
}
