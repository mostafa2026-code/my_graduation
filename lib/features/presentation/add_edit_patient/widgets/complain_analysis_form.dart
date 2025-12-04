import 'package:flutter/material.dart';
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Onset"),
            MyChip(label: "Acute"),
            MyChip(label: "Gradual"),
          ],
        ),
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
        MyTextFeild(hint: "Duration"),
        MyTextFeild(hint: "Special Character", maxline: 3),

        MyTextFeild(hint: "Reliveing Factors"),
        MyTextFeild(hint: "Exagreting Factor "),
      ],
    );
  }
}
