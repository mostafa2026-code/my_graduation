import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_graduation/core/services/firebsase/firestore_helper.dart';
import 'package:my_graduation/core/services/shared_prefrences/shared_helper.dart';
import 'package:my_graduation/features/data/models/doctors_model.dart';
import 'package:my_graduation/features/presentation/profile/cubit/edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileInitial());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController specialityController = TextEditingController();
  final TextEditingController positionController = TextEditingController();
  final TextEditingController qualificationController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();

  void init(DoctorsModel doctor) {
    nameController.text = doctor.name ?? '';
    phoneController.text = doctor.phone ?? '';
    addressController.text = doctor.address ?? '';
    specialityController.text = doctor.speciality ?? '';
    positionController.text = doctor.position ?? '';
    qualificationController.text = doctor.qualification ?? '';
    aboutController.text = doctor.about ?? '';
  }

  Future<void> updateProfile(DoctorsModel doctor) async {
    emit(EditProfileLoading());
    try {
      final updatedDoctor = doctor.copyWith(
        name: nameController.text.trim(),
        phone: phoneController.text.trim(),
        address: addressController.text.trim(),
        speciality: specialityController.text.trim(),
        position: positionController.text.trim(),
        qualification: qualificationController.text.trim(),
        about: aboutController.text.trim(),
      );

      await FirestoreHelper.saveDoctorData(updatedDoctor);
      await SharedHelper.saveDoctor(updatedDoctor);

      emit(EditProfileSuccess());
    } catch (e) {
      emit(EditProfileFailure(e.toString()));
    }
  }

  @override
  Future<void> close() {
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    specialityController.dispose();
    positionController.dispose();
    qualificationController.dispose();
    aboutController.dispose();
    return super.close();
  }
}
