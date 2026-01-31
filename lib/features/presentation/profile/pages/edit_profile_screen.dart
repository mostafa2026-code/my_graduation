import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:my_graduation/component/my_main_botton.dart';
import 'package:my_graduation/component/my_text_feild.dart';
import 'package:my_graduation/core/dialogs/error_dialog.dart';
import 'package:my_graduation/core/dialogs/loading_dialog.dart';
import 'package:my_graduation/core/dialogs/massage_dialog.dart';
import 'package:my_graduation/core/navigation/navigation_methods.dart';
import 'package:my_graduation/core/utils/my_text_styles.dart';
import 'package:my_graduation/features/data/models/doctors_model.dart';
import 'package:my_graduation/features/presentation/profile/cubit/edit_profile_cubit.dart';
import 'package:my_graduation/features/presentation/profile/cubit/edit_profile_state.dart';

class EditProfileScreen extends StatefulWidget {
  final DoctorsModel doctor;
  const EditProfileScreen({super.key, required this.doctor});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late EditProfileCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = EditProfileCubit()..init(widget.doctor);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,
      child: BlocListener<EditProfileCubit, EditProfileState>(
        listener: (context, state) {
          if (state is EditProfileLoading) {
            loadingDialog(context);
          } else if (state is EditProfileSuccess) {
            mypop(context);
            massageDialog(
              context,
              "Profile Updated Successfully",
            // ignore: use_build_context_synchronously
            ).then((_) => mypop(context));
          } else if (state is EditProfileFailure) {
            mypop(context);
            errorDialog(context, state.error);
          }
        },
        child: Scaffold(
          appBar: AppBar(title: const Text("Edit Profile")),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    "Update your information",
                    style: MyTextStyles.titleMedium,
                  ),
                  const Gap(24),
                  MyTextFeild(hint: "Name", controller: _cubit.nameController),
                  const Gap(16),
                  MyTextFeild(
                    hint: "Phone",
                    controller: _cubit.phoneController,
                    keyboardType: TextInputType.phone,
                  ),
                  const Gap(16),
                  MyTextFeild(
                    hint: "Address",
                    controller: _cubit.addressController,
                  ),
                  const Gap(16),
                  MyTextFeild(
                    hint: "Speciality",
                    controller: _cubit.specialityController,
                  ),
                  const Gap(16),
                  MyTextFeild(
                    hint: "Position",
                    controller: _cubit.positionController,
                  ),
                  const Gap(16),
                  MyTextFeild(
                    hint: "Qualification",
                    controller: _cubit.qualificationController,
                  ),
                  const Gap(16),
                  MyTextFeild(
                    hint: "About",
                    controller: _cubit.aboutController,
                    maxline: 5,
                  ),
                  const Gap(32),
                  MyMainBotton(
                    title: "Save Changes",
                    onTap: () {
                      _cubit.updateProfile(widget.doctor);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
