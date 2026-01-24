import 'package:flutter/material.dart';
import 'package:my_graduation/core/utils/my_colors.dart';

class MyTextFeild extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final int? maxline;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final Function()? ontap;

  const MyTextFeild({
    super.key,
    required this.hint,
    this.controller,
    this.validator,
    this.keyboardType,
    this.maxline,
    this.textInputAction,
    this.focusNode,
    this.ontap
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxline ?? 1,
      keyboardType: keyboardType,
      autovalidateMode: AutovalidateMode.always,
      validator: validator,
      textInputAction: textInputAction ?? TextInputAction.next,
      controller: controller,
      focusNode: focusNode,
      onTap: ontap,
      decoration: InputDecoration(
        filled: true,
        fillColor: MyColors.textFieldText.withAlpha(60),
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: MyColors.primary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.grey),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
