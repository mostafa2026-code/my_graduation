import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:my_graduation/core/utils/my_colors.dart';
import 'package:my_graduation/features/presentation/home/pages/home_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: HomeScreen(),
      bottomNavigationBar: SafeArea(
        child: GNav(
          backgroundColor: MyColors.primary,
          activeColor: Colors.white,
          style: GnavStyle.google,
          gap: 8,

          onTabChange: (value) {},

          tabs: [
            GButton(icon: Icons.home, text: 'Home'),
            GButton(icon: Icons.favorite, text: 'Likes'),
            GButton(icon: Icons.search, text: 'Search'),
            GButton(icon: Icons.person, text: 'Profile'),
          ],
        ),
      ),
    );
  }
}
