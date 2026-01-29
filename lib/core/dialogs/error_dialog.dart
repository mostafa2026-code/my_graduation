import 'package:flutter/material.dart';
import 'package:my_graduation/core/navigation/navigation_methods.dart';
import 'package:my_graduation/core/utils/my_text_styles.dart';

Future<dynamic> errorDialog(BuildContext context, String error) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Error", style: MyTextStyles.dialogTitle),
        content: Text(error, style: MyTextStyles.dialogContent),
        actions: [
          TextButton(
            onPressed: () {
              mypop(context);
            },
            child: Text("OK", style: MyTextStyles.textButton),
          ),
        ],
      );
    },
  );
}
