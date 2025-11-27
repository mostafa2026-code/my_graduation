import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:my_graduation/component/my_main_botton.dart';
import 'package:my_graduation/component/my_text_bottn.dart';
import 'package:my_graduation/component/my_text_feild.dart';
import 'package:my_graduation/core/const/my_images.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_graduation/core/dialogs/error_dialog.dart';
import 'package:my_graduation/core/dialogs/loading_dialog.dart';
import 'package:my_graduation/core/navigation/my_routes.dart';
import 'package:my_graduation/core/navigation/navigation_methods.dart';
import 'package:my_graduation/core/utils/my_colors.dart';
import 'package:my_graduation/features/presentation/auth/login/cubit/login_cubit.dart';
import 'package:my_graduation/features/presentation/auth/login/cubit/login_states.dart';
import 'package:my_graduation/features/presentation/auth/login/widgets/social_bottons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginCubit cubitLogin = context.read<LoginCubit>();
    return BlocListener<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is LoginLoadingState) {
          loadingDialog(context);
        } else if (state is LoginSuccessState) {
          mypop(context);

          mypushReplace(context, MyRoutes.home, null);
        } else if (state is LoginErrorState) {
          mypop(context);

          errorDialog(context, state.error);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("login"),
          // automaticallyImplyLeading: false,

          // title: SvgPicture.asset(MyImages.logo, height: 10),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: cubitLogin.formKeyLogin,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: SvgPicture.asset(MyImages.doctor, height: 150)),
                  Gap(20),
                  Text("Welcome Back"),
                  Gap(10),
                  MyTextFeild(
                    
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else if (!RegExp(
                        r'^[^@]+@[^@]+\.[^@]+',
                      ).hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    hint: 'Enter your email',
                    controller: cubitLogin.emailLogin,
                  ),
                  Gap(10),

                  MyTextFeild(
                    
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
                    },
                    hint: 'Enter your password',
                    controller: cubitLogin.passwordLogin,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,

                    children: [
                      Text("Forget your password?"),
                      MyTextBottn(text: 'Reset', onTap: () {}),
                    ],
                  ),
                  Gap(20),
                  MyMainBotton(
                    title: "Login",
                    onTap: () {
                      cubitLogin.login();
                    },
                  ),
                  Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(child: Divider()),
                      Gap(5),
                      Text("or continue with"),
                      Gap(5),
                      Expanded(child: Divider()),
                    ],
                  ),
                  Gap(20),

                  SocialBottons(),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                MyTextBottn(
                  text: 'Sign Up',
                  onTap: () {
                    mypushReplace(context, MyRoutes.register, null);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
