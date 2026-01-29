import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_graduation/core/const/my_images.dart';
import 'package:my_graduation/features/presentation/auth/login/cubit/login_cubit.dart';

class SocialBottons extends StatelessWidget {
  const SocialBottons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(MyImages.socialImages.length, (index) {
        return GestureDetector(
          onTap: () {
            if (index == 0) {
              context.read<LoginCubit>().loginWithGoogle();
            } else if (index == 1) {
              context.read<LoginCubit>().loginWithFacebook();
            }
          },
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(MyImages.socialImages[index]),
            ),
          ),
        );
      }),
    );
  }
}
