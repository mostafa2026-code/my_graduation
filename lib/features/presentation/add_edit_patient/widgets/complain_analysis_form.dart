import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_graduation/component/my_chip.dart';
import 'package:my_graduation/component/my_text_feild.dart';

class ComplainAnalysisForm extends StatelessWidget {
  const ComplainAnalysisForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Complain Analysis"),
        const Gap(16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Onset"),
            MyChip(label: "Acute"),
            MyChip(label: "Gradual"),
          ],
        ),
        const Gap(8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Course"),
            MyChip(label: "Progressive"),
            MyChip(label: "Regressive"),
            MyChip(label: "Intermetent"),
            MyChip(label: "Stationary"),
          ],
        ),
        const Gap(8),
        MyTextFeild(hint: "Duration"),
        const Gap(8),
        MyTextFeild(hint: "Special Character", maxline: 3),
        const Gap(8),

        MyTextFeild(hint: "Reliveing Factors"),
        const Gap(8),
        MyTextFeild(hint: "Exagreting Factor "),
        const Gap(16),
      ],
    );
  }
}
