import 'package:flutter_bloc/flutter_bloc.dart';

class ComplainAnalysisCubit extends Cubit<ComplainAnalysisState> {
  ComplainAnalysisCubit() : super(ComplainAnalysisInitial());
}

class ComplainAnalysisState {}

class ComplainAnalysisInitial extends ComplainAnalysisState {}