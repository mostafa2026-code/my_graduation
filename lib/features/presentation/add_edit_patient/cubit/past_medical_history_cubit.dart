import 'package:flutter_bloc/flutter_bloc.dart';

class PastMedicalHistoryCubit extends Cubit<PastMedicalHistoryState> {
  PastMedicalHistoryCubit() : super(PastMedicalHistoryInitial());
}

class PastMedicalHistoryState {}

class PastMedicalHistoryInitial extends PastMedicalHistoryState {}