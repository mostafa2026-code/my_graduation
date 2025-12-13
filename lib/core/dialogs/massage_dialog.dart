import 'package:flutter/material.dart';

Future<dynamic> massageDialog(BuildContext context, String massage) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog.adaptive(content: Text(massage));
    },
  );
}
