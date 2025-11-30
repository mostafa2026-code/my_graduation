import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/pages/add_edit_patient.dart';

class HistoryCards extends StatelessWidget {
  const HistoryCards({super.key, required this.model});

  final HistoryItemBuilder model;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 100,
      decoration: BoxDecoration(
        color: model.color,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16),
          bottomLeft: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(model.image, height: 80),
          Gap(16),
          Text(model.title),
        ],
      ),
    );
  }
}
