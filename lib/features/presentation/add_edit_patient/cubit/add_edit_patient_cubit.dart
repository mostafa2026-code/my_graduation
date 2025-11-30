import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_graduation/core/enums/my_enums.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/cubit/add_edit_patient_state.dart';

class AddEditPatientCubit extends Cubit<AddEditPatientState> {
  AddEditPatientCubit() : super(AddEditPatientInitial());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  late final Gender gender;
  late final MartialStatus martialStatus;

  final TextEditingController occupationController = TextEditingController();
  final TextEditingController chidrenController = TextEditingController();



}
