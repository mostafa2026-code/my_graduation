import 'package:flutter/material.dart';
import 'package:my_graduation/core/navigation/my_routes.dart';
import 'package:my_graduation/core/navigation/navigation_methods.dart';
import 'package:my_graduation/core/services/firebsase/firebase_helper.dart';
import 'package:my_graduation/core/utils/my_colors.dart';
import 'package:my_graduation/core/utils/my_text_styles.dart';
import 'package:my_graduation/features/presentation/home/pages/home_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children:  [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(30),
              ),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Theme.of(context).primaryColor,
                  // ignore: deprecated_member_use
                  Theme.of(context).primaryColor.withOpacity(0.8),
                ],
              ),
            ),
            currentAccountPicture: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 40, color: MyColors.primary),
              ),
            ),
            accountName: Text(
              "Dr. ${FirebaseHelper.getUserName() ?? 'Doctor'}",
              style: MyTextStyles.titleMedium.copyWith(color: Colors.white),
            ),
            accountEmail: Text(
              FirebaseHelper.getuserEmail() ?? '',
              style: MyTextStyles.bodyMedium.copyWith(color: Colors.white70),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: drawerItems.length,
              itemBuilder: (BuildContext context, int index) {
                final item = drawerItems[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ListTile(
                    leading: Icon(
                      item.iconData,
                      color: Theme.of(context).primaryColor,
                    ),
                    title: Text(item.title, style: MyTextStyles.listTileTitle),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    onTap: () {
                      mypop(context); // Close drawer
                      if (item.title == "Profile") {
                        mypush(context, MyRoutes.profile, null);
                      } else if (item.title == "Settings") {
                        mypush(context, MyRoutes.settings, null);
                      } else if (item.title == "About") {
                        mypush(context, MyRoutes.about, null);
                      } else if (item.title == "Logout") {
                        FirebaseHelper.mylogout();
                        mygo(context, MyRoutes.login, null);
                      } else if (item.ontap != null) {
                        item.ontap!();
                      }
                    },
                  ),
                );
              },
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'App Version 1.0.0',
              style: MyTextStyles.labelSmall.copyWith(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
