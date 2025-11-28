import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_graduation/features/presentation/home/widgets/patient_card.dart';

class PatientsHome extends StatelessWidget {
  const PatientsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Patients Home')),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Your Patient"),
            Gap(24),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              separatorBuilder: (BuildContext context, int index) {
                return Gap(8);
              },
              itemBuilder: (BuildContext context, int index) {
                return PatientCard();
              },
            ),
          ],
        ),
      ),
    );
  }
}
