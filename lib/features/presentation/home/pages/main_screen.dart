import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:my_graduation/core/const/my_images.dart';
import 'package:my_graduation/core/utils/my_colors.dart';
import 'package:my_graduation/features/presentation/home/pages/home_screen.dart';
import 'package:my_graduation/features/presentation/patients/pages/patients_home.dart';

List<Widget> pages = [
  HomeScreen(),
  PatientsHome(),
  Center(child: Text('Search Page')),
  Center(child: Text('Profile Page')),
];

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedPage],
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GNav(
            tabBorderRadius: 16,
            backgroundColor: MyColors.primary,
            activeColor: Colors.white,
            style: GnavStyle.google,
            gap: 8,
            selectedIndex: selectedPage,

            onTabChange: (value) {
              setState(() {
                selectedPage = value;
              });
            },

            tabs: [
              GButton(icon: Icons.home, text: 'Home'),
              GButton(icon: Icons.people, text: 'Patients'),
              GButton(icon: Icons.search, text: 'Search'),
              GButton(icon: Icons.person, text: 'Profile'),
            ],
          ),
        ),
      ),
    );
  }
}
