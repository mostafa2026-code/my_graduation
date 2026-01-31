import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:my_graduation/component/my_chip.dart';
import 'package:my_graduation/component/my_main_botton.dart';
import 'package:my_graduation/component/my_text_feild.dart';
import 'package:my_graduation/core/dialogs/error_dialog.dart';
import 'package:my_graduation/core/dialogs/loading_dialog.dart';
import 'package:my_graduation/core/dialogs/massage_dialog.dart';
import 'package:my_graduation/core/enums/my_enums.dart';
import 'package:my_graduation/core/navigation/navigation_methods.dart';
import 'package:my_graduation/features/data/models/patient_model.dart';
import 'package:my_graduation/features/data/models/patient_personal_history.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/cubit/add_edit_patient_cubit.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/cubit/add_edit_patient_state.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/cubit/personal_history_form_cubit.dart';

class PersonalHistoryForm extends StatefulWidget {
  const PersonalHistoryForm({
    super.key,
    required this.cubit,

    required this.formCubit,
    this.patientModelToedit,
    required this.isEdit,
  });
  final PersonalHistoryFormCubit formCubit;
  final PatientModel? patientModelToedit;
  final bool isEdit;

  final AddEditPatientCubit cubit;

  @override
  State<PersonalHistoryForm> createState() => _PersonalHistoryFormState();
}

class _PersonalHistoryFormState extends State<PersonalHistoryForm> {
  @override
  void initState() {
    super.initState();

    if (widget.patientModelToedit != null) {
      Map<String, dynamic>? personalHistory =
          widget.patientModelToedit!.personalHistory;
      PatientPersonalHistory patientPersonalHistory =
          PatientPersonalHistory.fromJson(personalHistory!);
      widget.formCubit.nameController.text = patientPersonalHistory.name ?? "";
      widget.formCubit.ageController.text = patientPersonalHistory.age ?? "";
      widget.formCubit.addressController.text =
          patientPersonalHistory.address ?? "";
      widget.formCubit.occupationController.text =
          patientPersonalHistory.occupation ?? "";
      widget.formCubit.gender = patientPersonalHistory.gender;
      widget.formCubit.martialStatus = patientPersonalHistory.martialStatus;

      widget.formCubit.childrenNumberController.text = patientPersonalHistory
          .childrenNumber
          .toString();
      widget.formCubit.specailHabitController.text =
          patientPersonalHistory.specialHabits ?? "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: widget.cubit),
        BlocProvider.value(value: widget.formCubit),
      ],

      child: BlocListener<AddEditPatientCubit, AddEditPatientState>(
        listener: (context, state) {
          if (state is AddEditPatientLoading) {
            mypop(context);
            loadingDialog(context);
          }
          if (state is AddEditPatientSuccess) {
            mypop(context);
            massageDialog(
              context,
              "Personal History saved successfully",
              // ignore: use_build_context_synchronously
            ).then((value) => mypop(context));
          }
          if (state is AddEditPatientFailure) {
            mypop(context);
            errorDialog(context, state.error);
          }
        },
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(16),
              BlocBuilder<PersonalHistoryFormCubit, PersonalHistoryFormState>(
                builder: (context, state) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyTextFeild(
                        hint: "Name",
                        controller: widget.formCubit.nameController,
                      ),
                      const Gap(8),
                      MyTextFeild(
                        hint: "Age",
                        controller: widget.formCubit.ageController,
                      ),
                      const Gap(8),
                      const Text("Gender"),
                      const Gap(16),
                      Wrap(
                        spacing: 5,
                        children: [
                          MyChip(
                            label: "Male",
                            isSelected:
                                widget.formCubit.gender == Gender.male.name,
                            onselected: (_) {
                              widget.formCubit.selectGender(Gender.male);
                            },
                          ),
                          MyChip(
                            label: "Female",
                            isSelected:
                                widget.formCubit.gender == Gender.female.name,
                            onselected: (_) {
                              widget.formCubit.selectGender(Gender.female);
                            },
                          ),
                        ],
                      ),
                      const Gap(8),
                      MyTextFeild(
                        hint: "Address",
                        controller: widget.formCubit.addressController,
                      ),
                      const Gap(8),
                      MyTextFeild(
                        hint: "Occupation",
                        controller: widget.formCubit.occupationController,
                      ),
                      const Gap(8),
                      const Text("Marital Status"),
                      const Gap(16),
                      Wrap(
                        children: [
                          MyChip(
                            isSelected:
                                widget.formCubit.martialStatus ==
                                MartialStatus.single.name,
                            label: "Single ",
                            onselected: (_) {
                              widget.formCubit.selectMartialStatus(
                                MartialStatus.single,
                              );
                            },
                          ),
                          MyChip(
                            isSelected:
                                widget.formCubit.martialStatus ==
                                MartialStatus.married.name,
                            label: "Married",
                            onselected: (_) {
                              widget.formCubit.selectMartialStatus(
                                MartialStatus.married,
                              );
                            },
                          ),
                        ],
                      ),
                      if (widget.formCubit.martialStatus ==
                          MartialStatus.married.name) ...[
                        const Gap(8),
                        MyTextFeild(
                          hint: "Number of Children",
                          keyboardType: TextInputType.number,
                          controller: widget.formCubit.childrenNumberController,
                        ),
                      ],
                      const Gap(8),
                      const Text("Smoking Status"),
                      const Gap(8),
                      Wrap(
                        spacing: 8,
                        children: [
                          MyChip(
                            isSelected:
                                widget.formCubit.smokingStatus ==
                                SmokingStatus.nonSmoker.name,
                            label: "Non Smoker",
                            onselected: (_) {
                              widget.formCubit.selectSmokingStatus(
                                SmokingStatus.nonSmoker,
                              );
                            },
                          ),
                          MyChip(
                            isSelected:
                                widget.formCubit.smokingStatus ==
                                SmokingStatus.exSmoker.name,
                            label: "Ex Smoker",
                            onselected: (_) {
                              widget.formCubit.selectSmokingStatus(
                                SmokingStatus.exSmoker,
                              );
                            },
                          ),
                          MyChip(
                            isSelected:
                                widget.formCubit.smokingStatus ==
                                SmokingStatus.heavySmoker.name,
                            label: "Heavy Smoker",
                            onselected: (_) {
                              widget.formCubit.selectSmokingStatus(
                                SmokingStatus.heavySmoker,
                              );
                            },
                          ),
                          MyChip(
                            isSelected:
                                widget.formCubit.smokingStatus ==
                                SmokingStatus.lightSmoker.name,
                            label: "Light Smoker",
                            onselected: (_) {
                              widget.formCubit.selectSmokingStatus(
                                SmokingStatus.lightSmoker,
                              );
                            },
                          ),
                        ],
                      ),
                      const Gap(8),
                      MyTextFeild(
                        hint: "Special Habits",
                        controller: widget.formCubit.specailHabitController,
                      ),
                    ],
                  );
                },
              ),

              const Gap(8),
              MyMainBotton(
                title: "Save",
                onTap: () {
                  PatientModel patient = widget.cubit.currentPatient.copyWith(
                    personalHistory: widget.formCubit.setPersonalHistoryData(),
                  );

                  widget.cubit.currentPatient = patient;
                  widget.cubit.updatePatient();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
