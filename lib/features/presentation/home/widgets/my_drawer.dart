import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_graduation/core/navigation/navigation_methods.dart';
import 'package:my_graduation/core/services/firebsase/firebase_helper.dart';
import 'package:my_graduation/core/utils/my_colors.dart';
import 'package:my_graduation/features/presentation/home/pages/home_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: MyColors.background,
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: MyColors.primary,
                  ),
                ),
                const Gap(16),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Dr. ${FirebaseHelper.getUserName() ?? ''}",
    
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Gap(8),
                    Text(
                      FirebaseHelper.getuserEmail() ?? '',
    
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
    
            Gap(20),
            Expanded(
              child: ListView.separated(
                itemCount: drawerItems.length,
                separatorBuilder: (BuildContext context, int index) {
                  return Gap(8);
                },
                itemBuilder: (BuildContext context, int index) {
                  DrawerItemModel drawerItem = drawerItems[index];
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: MyColors.background,
                    ),
                    child: ListTile(
                      title: Text(drawerItem.title),
                      leading: Icon(drawerItem.iconData),
                      onTap: () {
                        mypush(context, drawerItem.to, null);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
