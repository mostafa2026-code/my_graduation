class AddEditPatientState {}

class AddEditPatientInitial extends AddEditPatientState {}
class AddEditPatientLoading extends AddEditPatientState {}
class AddEditPatientSuccess extends AddEditPatientState {}
class AddEditPatientFailure extends AddEditPatientState {
  final String error;

  AddEditPatientFailure(this.error);
}
