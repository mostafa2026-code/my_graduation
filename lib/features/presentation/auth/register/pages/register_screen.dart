import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:my_graduation/component/my_main_botton.dart';
import 'package:my_graduation/component/my_text_bottn.dart';
import 'package:my_graduation/component/my_text_feild.dart';
import 'package:my_graduation/core/dialogs/error_dialog.dart';
import 'package:my_graduation/core/dialogs/loading_dialog.dart';
import 'package:my_graduation/core/navigation/my_routes.dart';
import 'package:my_graduation/core/navigation/navigation_methods.dart';
import 'package:my_graduation/features/presentation/auth/register/cubit/register_cubit.dart';
import 'package:my_graduation/features/presentation/auth/register/cubit/register_states.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final RegisterCubit cubitReg;
  final GlobalKey<FormState> formKeyReg = GlobalKey<FormState>();

  bool isDialogShowing = false;
  @override
  void initState() {
    super.initState();
    cubitReg = context.read<RegisterCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          if (!isDialogShowing) {
            isDialogShowing = true;
            loadingDialog(context);
          }
        } else if (state is RegisterSuccessState) {
          if (isDialogShowing) {
            mypop(context);
            isDialogShowing = false;
          }
          mygo(context, MyRoutes.home, null);
        } else if (state is RegisterErrorState) {
          if (isDialogShowing) {
            mypop(context);
            isDialogShowing = false;
          }
          errorDialog(context, state.error);
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text("Register")),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKeyReg,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Welcome to Dr.record"),
                Gap(10),
                MyTextFeild(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Name is required";
                    }
                    return null;
                  },
                  hint: "Enter your name",
                  controller: cubitReg.nameReg,
                ),
                Gap(10),
                MyTextFeild(
                  validator: (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return "Email is required";
                    } else if (!RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                    ).hasMatch(p0)) {
                      return "Please enter a valid email";
                    }
                    return null;
                  },
                  hint: "Enter your email",
                  controller: cubitReg.emailReg,
                ),
                Gap(10),
                MyTextFeild(
                  validator: (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return "Password is required";
                    } else if (p0.length < 6) {
                      return "Password must be at least 6 characters";
                    }
                    return null;
                  },
                  hint: "Enter your password",
                  controller: cubitReg.passwordReg,
                ),
                Gap(20),
                MyMainBotton(
                  title: "Register",
                  onTap: () {
                    if (formKeyReg.currentState!.validate()) {
                      log(cubitReg.nameReg.text);
                      log(cubitReg.emailReg.text);
                      log(cubitReg.passwordReg.text);
                      FocusScope.of(context).unfocus();
                      cubitReg.register();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Already have an account?"),
            MyTextBottn(
              text: "Login",
              onTap: () {
                mypushReplace(context, MyRoutes.login, null);
              },
            ),
          ],
        ),
      ),
    );
  }
}
