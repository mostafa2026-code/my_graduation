import 'dart:developer';

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
import 'package:my_graduation/features/presentation/add_edit_patient/cubit/add_edit_patient_cubit.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/cubit/add_edit_patient_state.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/cubit/personal_history_form_cubit.dart';

class PersonalHistoryForm extends StatelessWidget {
  const PersonalHistoryForm({
    super.key,
    required this.cubit,
    
    required this.formCubit,
  });
  final PersonalHistoryFormCubit formCubit;
 
  final AddEditPatientCubit cubit;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: cubit),
        BlocProvider.value(value: formCubit),
      ],

      child: BlocListener<AddEditPatientCubit, AddEditPatientState>(
        listener: (context, state) {
          if (state is AddEditPatientLoading) {
            mypop(context);
            loadingDialog(context);
          }
          if (state is AddEditPatientSuccess) {
            mypop(context);
            massageDialog(context, "Personal History saved successfully");
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
              MyTextFeild(hint: "Name", controller: formCubit.nameController),
              const Gap(8),
              MyTextFeild(hint: "Age", controller: formCubit.ageController),
              const Gap(8),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text("Gender"),
                  const Gap(16),
                  BlocBuilder<
                    PersonalHistoryFormCubit,
                    PersonalHistoryFormState
                  >(
                    bloc: formCubit,
                    builder: (context, state) {
                      return Wrap(
                        spacing: 5,
                        children: [
                          MyChip(
                            label: "Male",
                            isSelected: formCubit.gender == Gender.male,
                            onselected: (_) {
                              formCubit.selectGender(Gender.male);
                            },
                          ),
                          MyChip(
                            label: "Female",
                            isSelected: formCubit.gender == Gender.female,
                            onselected: (_) {
                              formCubit.selectGender(Gender.female);
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
              const Gap(8),
              MyTextFeild(
                hint: "Address",
                controller: formCubit.addressController,
              ),
              const Gap(8),
              MyTextFeild(
                hint: "Occupation",
                controller: formCubit.occupationController,
              ),
              const Gap(8),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text("Martial Status"),
                  const Gap(16),
                  BlocBuilder<
                    PersonalHistoryFormCubit,
                    PersonalHistoryFormState
                  >(
                    bloc: formCubit,
                    builder: (context, state) {
                      return Wrap(
                        children: [
                          MyChip(
                            isSelected:
                                formCubit.martialStatus == MartialStatus.single,
                            label: "Single ",
                            onselected: (_) {
                              formCubit.selectMartialStatus(
                                MartialStatus.single,
                              );
                            },
                          ),
                          MyChip(
                            isSelected:
                                formCubit.martialStatus ==
                                MartialStatus.married,
                            label: "Married",
                            onselected: (_) {
                              formCubit.selectMartialStatus(
                                MartialStatus.married,
                              );
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
              if (formCubit.martialStatus == MartialStatus.married)
                MyTextFeild(
                  hint: "Number of Childern",
                  controller: formCubit.childrenNumberController,
                ),
              const Gap(8),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text("Smoking Status"),
                  const Gap(16),

                  BlocBuilder(
                    bloc: formCubit,
                    builder: (context, state) {
                      return Wrap(
                        spacing: 8,
                        children: [
                          MyChip(
                            isSelected:
                                formCubit.smokingStatus ==
                                SmokingStatus.nonSmoker,
                            label: "Non Smoker",
                            onselected: (_) {
                              formCubit.selectSmokingStatus(
                                SmokingStatus.nonSmoker,
                              );
                            },
                          ),

                          MyChip(
                            isSelected:
                                formCubit.smokingStatus ==
                                SmokingStatus.exSmoker,
                            label: "Ex Smoker",
                            onselected: (_) {
                              formCubit.selectSmokingStatus(
                                SmokingStatus.exSmoker,
                              );
                            },
                          ),

                          MyChip(
                            isSelected:
                                formCubit.smokingStatus ==
                                SmokingStatus.heavySmoker,
                            label: "Heavy Smoker",
                            onselected: (_) {
                              formCubit.selectSmokingStatus(
                                SmokingStatus.heavySmoker,
                              );
                            },
                          ),

                          MyChip(
                            isSelected:
                                formCubit.smokingStatus ==
                                SmokingStatus.lightSmoker,
                            label: "light Smoker",
                            onselected: (_) {
                              formCubit.selectSmokingStatus(
                                SmokingStatus.lightSmoker,
                              );
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
              const Gap(8),
              MyTextFeild(
                hint: "Specail Habits",
                controller: formCubit.specailHabitController,
              ),

              const Gap(8),
              MyMainBotton(
                title: "Save",
                onTap: () {
                  PatientModel patient = cubit.currentPatient.copyWith(
                    personalHistory: formCubit.setPersonalHistoryData(),
                  );
                  log('Name: ${formCubit.nameController.text}');
                  log('Age: ${formCubit.ageController.text}');
                  log('Address: ${formCubit.addressController.text}');
                  log('Occupation: ${formCubit.occupationController.text}');
                  log('Gender: ${formCubit.gender}');
                  log('Martial Status: ${formCubit.martialStatus}');
                  log(
                    'Children Number: ${formCubit.childrenNumberController.text}',
                  );
                  log(
                    'Special Habits: ${formCubit.specailHabitController.text}',
                  );
                  cubit.currentPatient = patient;
                  cubit.updatePatient();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
