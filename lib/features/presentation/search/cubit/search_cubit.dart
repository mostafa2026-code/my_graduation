import 'dart:async';

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
  Timer? _debounce;

  void onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      searchPatients();
    });
  }

  void searchPatients() {
    try {
      result = FirestoreHelper.filterAndSearchPatient(
        selectedDisease?.trim(),
        sortBy?.trim(),
        searchController.text.trim(),
      );
      result.listen((snapshot) {});
      emit(SearchSuccess(result: result));
    } on FirebaseException catch (e) {
      emit(SearchError(e.message.toString()));
    }
  }

  void getallpatient() {
    result = FirestoreHelper.getAllPatient();

    result.listen((result) {});

    emit(SearchSuccess(result: result));
  }

  void resetSearch() {
    selectedDisease = null;
    sortBy = null;
    searchController.clear();

    emit(SearchInitial());
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    searchController.dispose();
    return super.close();
  }
}
