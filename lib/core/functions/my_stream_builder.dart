import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_graduation/component/patients_list_view.dart';
import 'package:my_graduation/core/const/my_images.dart';
import 'package:my_graduation/features/data/models/patient_model.dart';

StreamBuilder<QuerySnapshot<Map<String, dynamic>>> myStreamBuilder({
  required Stream<QuerySnapshot<Map<String, dynamic>>> stream,
  bool Function(PatientModel)? filter,
}) {
  return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
    stream: stream,
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const PatientsListView(patients: [], isLoading: true);
      } else if (snapshot.hasError) {
        return Center(child: Text(snapshot.error.toString()));
      } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Lottie.asset(MyImages.emptyJson)),
            Text("No Matched Data!"),
          ],
        );
      }

      List<PatientModel> models = snapshot.data!.docs
          .map((e) => PatientModel.fromJson(e.data()))
          .toList();

      if (filter != null) {
        models = models.where(filter).toList();
      }

      if (models.isEmpty) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Lottie.asset(MyImages.emptyJson)),
            Text("No Matched Data!"),
          ],
        );
      }

      return PatientsListView(patients: models);
    },
  );
}
