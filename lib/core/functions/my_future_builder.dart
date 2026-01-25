import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_graduation/component/patients_list_view.dart';
import 'package:my_graduation/features/data/models/patient_model.dart';





  StreamBuilder<QuerySnapshot<Map<String, dynamic>>> myStreamBuilder({
    required Stream<QuerySnapshot<Map<String, dynamic>>> stream,
  }) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: stream,
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
