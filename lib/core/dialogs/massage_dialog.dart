import 'package:flutter/material.dart';
import 'package:my_graduation/core/utils/my_text_styles.dart';

Future<dynamic> massageDialog(BuildContext context, String massage) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog.adaptive(
        content: Text(massage, style: MyTextStyles.dialogContent),
      );
    },
  );
}
