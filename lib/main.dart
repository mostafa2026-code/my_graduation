import 'package:flutter/material.dart';
import 'package:my_graduation/core/navigation/my_routes.dart';

void main() {
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
