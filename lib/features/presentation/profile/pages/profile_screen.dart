import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_graduation/features/presentation/profile/widgets/profile_list_tile_container.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(radius: 50, backgroundColor: Colors.grey),
              Gap(8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Username',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text('Email', style: TextStyle(fontSize: 16)),
                ],
              ),
            ],
          ),
          Gap(20),
          ListView.separated(
            itemCount: 4,
            separatorBuilder: (BuildContext context, int index) {
              return Gap(10);
            },
            itemBuilder: (BuildContext context, int index) {
              return ProfileListTileContainer();
            },
          ),
        ],
      ),
    );
  }
}
