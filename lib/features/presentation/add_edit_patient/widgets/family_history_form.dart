import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:my_graduation/component/my_main_botton.dart';
import 'package:my_graduation/component/my_text_feild.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/cubit/add_edit_patient_cubit.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/cubit/family_history_form_cubit.dart';

class FamilyHistoryForm extends StatelessWidget {
  const FamilyHistoryForm({
    super.key,
    required this.cubit,
    required this.familyHistoryFormCubit,
  });
  final AddEditPatientCubit cubit;
  final FamilyHistoryFormCubit familyHistoryFormCubit;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: cubit,),
        BlocProvider.value(value: familyHistoryFormCubit,)
      ],
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              MyTextFeild(
                hint: "Hereditery diseases of the family ",
                controller: familyHistoryFormCubit
                    .herediteryDiseasesOfTheFamilyController,
              ),
              Gap(5),
              MyTextFeild(
                hint: "Family history of similar condition",
                controller: familyHistoryFormCubit
                    .familyHistoryOfSimilarConditionController,
              ),
              Gap(20),
      
              MyMainBotton(
                title: "Save",
                onTap: () {
                  cubit.currentPatient = cubit.currentPatient.copyWith(
                    familyHistory: familyHistoryFormCubit.saveFamilyHistory(),
                  );
      
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
