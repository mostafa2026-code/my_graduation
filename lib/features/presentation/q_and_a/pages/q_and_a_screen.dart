import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_graduation/core/utils/my_colors.dart';
import 'package:my_graduation/features/data/models/q_and_a_model.dart';

class QAndAScreen extends StatelessWidget {
  const QAndAScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dr.Record Q&A"), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,

            children: [
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: drRecordQA.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const Gap(10);
                },
                itemBuilder: (BuildContext context, int index) {
                  QAndAModel qAndAModel = drRecordQA[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: MyColors.background,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ExpansionTile(
                      backgroundColor: MyColors.primaryLight,
                      title: Text(qAndAModel.question),

                      children: [
                        Text(qAndAModel.answer, textAlign: TextAlign.start),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
