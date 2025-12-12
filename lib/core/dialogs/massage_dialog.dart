import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_graduation/core/const/my_images.dart';

Future<dynamic> massageDialog(BuildContext context, String massage) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog.adaptive(content: Text(massage));
    },
  );
}
