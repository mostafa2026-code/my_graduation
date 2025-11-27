import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_graduation/core/const/my_images.dart';

Future<dynamic> loadingDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return Center(child: Lottie.asset(MyImages.loading));
    },
  );
}
