import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_graduation/core/const/my_images.dart';
import 'package:my_graduation/core/utils/my_colors.dart';
import 'package:my_graduation/core/navigation/my_routes.dart';
import 'package:my_graduation/core/navigation/navigation_methods.dart';
import 'package:my_graduation/features/data/models/patient_model.dart';

class PatientCard extends StatelessWidget {
  const PatientCard({super.key, required this.model});

  final PatientModel model;

  @override
  Widget build(BuildContext context) {
    final String name = model.personalHistory?["name"] ?? "no name ";
    final String id = model.id ?? "uebkjrejkreb";
    final String diagnosis = model.diagnosis ?? "no diagnosis";
    return GestureDetector(
      onTap: () {
        mypush(context, MyRoutes.patientDetails, model);
      },
      child: Container(
        padding: EdgeInsets.all(8),
        width: double.infinity,
        decoration: BoxDecoration(
          color: MyColors.primaryLight,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(MyImages.heartFailure, height: 80, fit: BoxFit.cover),
            Gap(16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name),

                  Text("ID: $id"),
                  Gap(8),
                  Text(diagnosis),
                  Gap(8),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
              mypush(context, MyRoutes.patientDetails, model);
                            },
              icon: Icon(Icons.arrow_forward_ios_rounded, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
