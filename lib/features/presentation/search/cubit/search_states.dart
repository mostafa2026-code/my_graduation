import 'package:cloud_firestore/cloud_firestore.dart';

class SearchStates {}

class SearchInitial extends SearchStates {}

class SearchLoading extends SearchStates {}

class SearchSuccess extends SearchStates {
  Future<QuerySnapshot<Map<String, dynamic>>>? result;
  SearchSuccess(this.result);
}

class SearchError extends SearchStates {
  String message;
  SearchError(this.message);
}
