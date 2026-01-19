import 'package:flutter/material.dart';
import 'package:my_graduation/component/my_list_tile.dart';
import 'package:my_graduation/core/services/firebsase/firebase_helper.dart';
import 'package:my_graduation/core/utils/my_colors.dart';

class ProfileListTileContainer extends StatelessWidget {
  const ProfileListTileContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: MyColors.primary.withAlpha(20),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: MyListTile(
        title: "LogOut",
        icon: Icons.logout,
        trailing: Icon(Icons.arrow_forward_ios),
        ontap: () {
          FirebaseHelper.mylogout();
        },
      ),
    );
  }
}
