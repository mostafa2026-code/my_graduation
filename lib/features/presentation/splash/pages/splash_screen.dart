import 'package:flutter/material.dart';
import 'package:my_graduation/core/const/my_images.dart';
import 'package:my_graduation/core/navigation/my_routes.dart';
import 'package:my_graduation/core/navigation/navigation_methods.dart';
import 'package:lottie/lottie.dart';
import 'package:my_graduation/core/services/firebsase/firebase_helper.dart';
import 'package:my_graduation/core/services/shared_prefrences/shared_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (FirebaseHelper.getuserEmail() != null) {
        // ignore: use_build_context_synchronously
        mypushReplace(context, MyRoutes.main, null);
      } else {
        // ignore: use_build_context_synchronously
        if (SharedHelper.isOnboardingDone()) {
          // ignore: use_build_context_synchronously
          mypushReplace(context, MyRoutes.welcome, null);
        } else {
          // ignore: use_build_context_synchronously
          mypushReplace(context, MyRoutes.onBoarding, null);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Lottie.asset(MyImages.splash)));
  }
}
