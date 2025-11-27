import 'package:flutter/material.dart';
import 'package:my_graduation/core/navigation/navigation_methods.dart';

Future<dynamic> errorDialog(BuildContext context, String error) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Error"),
        content: Text(error),
        actions: [
          TextButton(
            onPressed: () {
              mypop(context);
            },
            child: Text("OK"),
          ),
        ],
      );
    },
  );
}
