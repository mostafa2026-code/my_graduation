import 'package:cloud_firestore/cloud_firestore.dart';

class SearchStates {}

class SearchInitial extends SearchStates {}

class SearchLoading extends SearchStates {}

class SearchSuccess extends SearchStates {
  Stream<QuerySnapshot<Map<String, dynamic>>> result;
  SearchSuccess({required this.result});
}

class SearchError extends SearchStates {
  String message;
  SearchError(this.message);
}
