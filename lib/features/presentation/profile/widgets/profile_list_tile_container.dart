import 'package:flutter/material.dart';
import 'package:my_graduation/core/utils/my_colors.dart';
import 'package:my_graduation/features/presentation/profile/widgets/profile_list_tile.dart';

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
            offset:const  Offset(0, 3),
          ),
        ],
      ),
      child: const ProfileListTile(),
    );
  }
}
