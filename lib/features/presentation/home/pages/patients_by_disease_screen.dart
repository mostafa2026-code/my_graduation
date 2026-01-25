import 'package:flutter/material.dart';

import 'package:my_graduation/core/functions/my_future_builder.dart';
import 'package:my_graduation/core/services/firebsase/firestore_helper.dart';

class PatientsByDiseaseScreen extends StatelessWidget {
  const PatientsByDiseaseScreen({super.key, required this.diseaseName});
  final String diseaseName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(diseaseName)),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                myStreamBuilder(
                  stream: FirestoreHelper.getPatientByDisease(diseaseName),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
