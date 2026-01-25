import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_graduation/core/services/firebsase/firestore_helper.dart';
import 'package:my_graduation/features/presentation/search/cubit/search_states.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitial());

  TextEditingController searchController = TextEditingController();
  String? selectedDisease;
  String? sortBy;
  late Stream<QuerySnapshot<Map<String, dynamic>>> result;

  void searchPatients() {
    try {
      result = FirestoreHelper.filterAndSearchPatient(
        selectedDisease?.trim(),
        sortBy?.trim(),
        searchController.text.trim(),
      );
      result.listen((snapshot) {
        log("Docs found: ${snapshot.docs.length}");
        for (var doc in snapshot.docs) {
          log(doc.data().toString());
        }
      });
      emit(SearchSuccess(result: result));
    } on FirebaseException catch (e) {
      emit(SearchError(e.message.toString()));
    }
  }

  void getallpatient() {
    result = FirestoreHelper.getAllPatient();
    log("All docs for doctor: ${result.length}");
    result.listen((result) {
      log("Docs found: ${result.docs.length}");
      for (var doc in result.docs) {
        log(doc.data().toString());
      }
    });

    emit(SearchSuccess(result: result));
  }

  void resetSearch() {
    selectedDisease = null;
    sortBy = null;
    searchController.dispose();

    emit(SearchInitial());
  }
}
