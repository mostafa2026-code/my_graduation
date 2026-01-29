import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:my_graduation/component/my_main_botton.dart';
import 'package:my_graduation/component/my_text_feild.dart';
import 'package:my_graduation/core/dialogs/error_dialog.dart';
import 'package:my_graduation/core/dialogs/loading_dialog.dart';
import 'package:my_graduation/core/navigation/my_routes.dart';
import 'package:my_graduation/core/utils/my_text_styles.dart';
import 'package:my_graduation/features/presentation/auth/register/cubit/doctor_info_cubit.dart';

class DoctorInfoScreen extends StatelessWidget {
  const DoctorInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Complete Your Profile"),
        centerTitle: true,
      ),
      body: BlocListener<DoctorInfoCubit, DoctorInfoStates>(
        listener: (context, state) {
          if (state is DoctorInfoLoading) {
            loadingDialog(context);
          } else if (state is DoctorInfoSuccess) {
            Navigator.pop(context);
            context.go(MyRoutes.home);
          } else if (state is DoctorInfoError) {
            Navigator.pop(context);
            errorDialog(context, state.error);
          }
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "We need a few more details to set up your professional profile.",
                style: MyTextStyles.bodyLarge.copyWith(color: Colors.grey),
              ),
              const Gap(30),
              _buildDoctorInfoSection(context, "Professional Info", [
                MyTextFeild(
                  hint: "Speciality (e.g. Cardiologist)",
                  controller: context
                      .read<DoctorInfoCubit>()
                      .specialityController,
                ),
                const Gap(15),
                MyTextFeild(
                  hint: "Position",
                  controller: context
                      .read<DoctorInfoCubit>()
                      .positionController,
                ),
                const Gap(15),
                MyTextFeild(
                  hint: "Qualifications",
                  controller: context
                      .read<DoctorInfoCubit>()
                      .qualificationController,
                ),
              ]),
              const Gap(30),
              _buildDoctorInfoSection(context, "Contact & Location", [
                MyTextFeild(
                  hint: "Phone Number",
                  controller: context.read<DoctorInfoCubit>().phoneController,
                  keyboardType: TextInputType.phone,
                ),
                const Gap(15),
                MyTextFeild(
                  hint: "Work Address",
                  controller: context
                      .read<DoctorInfoCubit>()
                      .addressController,
                ),
              ]),
              const Gap(30),
              _buildDoctorInfoSection(context, "Working Hours & Others", [
                Row(
                  children: [
                    Expanded(
                      child: MyTextFeild(
                        hint: "From Hour",
                        controller: context
                            .read<DoctorInfoCubit>()
                            .fromHourController,
                      ),
                    ),
                    const Gap(15),
                    Expanded(
                      child: MyTextFeild(
                        hint: "To Hour",
                        controller: context
                            .read<DoctorInfoCubit>()
                            .toHourController,
                      ),
                    ),
                  ],
                ),
                const Gap(15),
                MyTextFeild(
                  hint: "Salary (Optional)",
                  controller: context
                      .read<DoctorInfoCubit>()
                      .salaryController,
                  keyboardType: TextInputType.number,
                ),
                const Gap(15),
                MyTextFeild(
                  hint: "About You",
                  controller: context.read<DoctorInfoCubit>().aboutController,
                  maxline: 4,
                ),
              ]),
              const Gap(40),
              MyMainBotton(
                title: "Complete Setup",
                onTap: () {
                  context.read<DoctorInfoCubit>().saveDoctorInfo();
                },
              ),
              const Gap(20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDoctorInfoSection(
    BuildContext context,
    String title,
    List<Widget> children,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: MyTextStyles.titleMedium.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        const Gap(15),
        ...children,
      ],
    );
  }
}
