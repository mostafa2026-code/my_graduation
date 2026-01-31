import 'package:flutter/material.dart';
import 'package:my_graduation/core/utils/my_text_styles.dart';

class MyTextFeild extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final int? maxline;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final Function()? ontap;
  final Function(String)? onChanged;

  const MyTextFeild({
    super.key,
    required this.hint,
    this.controller,
    this.validator,
    this.keyboardType,
    this.maxline,
    this.textInputAction,
    this.focusNode,
    this.ontap,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxline ?? 1,
      keyboardType: keyboardType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      textInputAction: textInputAction ?? TextInputAction.next,
      controller: controller,
      focusNode: focusNode,
      onTap: ontap,
      onChanged: onChanged,
      style: MyTextStyles.inputText,
      decoration: InputDecoration(
        filled: true,
        hintText: hint,
        hintStyle: MyTextStyles.hintText,
        errorStyle: MyTextStyles.errorText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}
