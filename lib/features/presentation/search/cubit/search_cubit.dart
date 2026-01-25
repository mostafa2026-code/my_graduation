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
  Future<QuerySnapshot<Map<String, dynamic>>>? result;

  searchPatients() async {
    try {
      emit(SearchLoading());

      result = FirestoreHelper.filterAndSearchPatient(
        selectedDisease?.trim(),
        sortBy?.trim(),
        searchController.text.trim(),
      );
      final snapshot = await result!;
      if (snapshot.docs.isNotEmpty) {
        emit(SearchSuccess(result));
      } else {
        emit(SearchError("No Data Found"));
      }
    } on FirebaseException catch (e) {
      emit(SearchError(e.message.toString()));
      log(e.message.toString());
    }
  }
}
