import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_graduation/core/navigation/my_routes.dart';
import 'package:my_graduation/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: MyRoutes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
