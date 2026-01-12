import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_graduation/component/my_main_botton.dart';
import 'package:my_graduation/core/navigation/my_routes.dart';
import 'package:my_graduation/core/navigation/navigation_methods.dart';
import 'package:my_graduation/core/services/firebsase/firestore_helper.dart';
import 'package:my_graduation/features/data/models/patient_model.dart';
import 'package:my_graduation/features/presentation/home/widgets/patient_card.dart';

class PatientsHome extends StatelessWidget {
  const PatientsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Patients Home')),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Your Patient"),
                  MyMainBotton(
                    width: 50,
                    height: 30,

                    title: "Add Patient",
                    onTap: () {
                      mypush(context, MyRoutes.addPatient, null);
                    },
                  ),
                ],
              ),
              Gap(24),
              myFutureBiulder(),
            ],
          ),
        ),
      ),
    );
  }

  FutureBuilder<QuerySnapshot<Map<String, dynamic>>> myFutureBiulder() {
    return FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
              future: FirestoreHelper.getAllPatient(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(child: Text("you haven't patient yet "));
                }

                List<PatientModel> models = snapshot.data!.docs
                    .map((e) => PatientModel.fromJson(e.data()))
                    .toList();

                log(models.toString());
                return PatientsListView(patients: models);
              },
            );
  }
}

class PatientsListView extends StatelessWidget {
  const PatientsListView({super.key, required this.patients});
  final List<PatientModel> patients;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: patients.length,
      separatorBuilder: (BuildContext context, int index) {
        return Gap(8);
      },
      itemBuilder: (BuildContext context, int index) {
        return PatientCard(model: patients[index]);
      },
    );
  }
}
