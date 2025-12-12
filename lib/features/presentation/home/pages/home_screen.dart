import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_graduation/core/navigation/my_routes.dart';
import 'package:my_graduation/core/navigation/navigation_methods.dart';
import 'package:my_graduation/core/services/firebsase/firebase_helper.dart';
import 'package:my_graduation/core/services/shared_prefrences/shared_helper.dart';
import 'package:my_graduation/core/utils/my_colors.dart';
import 'package:my_graduation/features/presentation/home/widgets/complicated_cases_list_view.dart';
import 'package:my_graduation/features/presentation/home/widgets/disease_category_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: MyColors.background,
                  child: Icon(Icons.person, size: 50, color: MyColors.primary),
                ),
                const Gap(16),
                Column(
                  children: [
                    Text(
                      "Dr. ${SharedHelper.getUserInfo()?.name ?? ''}",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Gap(8),
                    Text(
                      SharedHelper.getUserInfo()?.email ?? '',
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),

            Gap(20),
            ListView.separated(
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
                    onTap: drawerItem.ontap(context),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              //open drawer
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(Icons.menu),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(24),
                Text("Welcome Doctor ${FirebaseHelper.getUserName() ?? ''}!"),
                const Gap(24),
                Text('Diseaes Categories', style: headlineTextStyle()),
                const Gap(16),

                SizedBox(
                  height: MediaQuery.of(context).size.height * .25,
                  child: DiseaseCategoryListView(),
                ),
                const Gap(24),
                Text("Compilcated Cases", style: headlineTextStyle()),
                const Gap(16),
                ComplicatedCasesListView(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextStyle headlineTextStyle() =>
      TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
}

class DrawerItemModel {
  final String title;
  final IconData iconData;

  final Function(BuildContext context) ontap;

  DrawerItemModel({
    required this.title,
    required this.iconData,
    required this.ontap,
  });
}

List<DrawerItemModel> drawerItems = [
  DrawerItemModel(
    title: "Profile",
    iconData: Icons.person,
    ontap: (context) {
      mypush(context, MyRoutes.profile, null);
    },
  ),
  DrawerItemModel(
    title: "Settings",
    iconData: Icons.settings,
    ontap: (context) {
      mypush(context, MyRoutes.settings, null);
    },
  ),

  DrawerItemModel(
    title: "Notifications",
    iconData: Icons.notifications,
    ontap: (context) {},
  ),
  DrawerItemModel(
    title: "About",
    iconData: Icons.info,
    ontap: (context) {
      mypush(context, MyRoutes.about, null);
    },
  ),
  DrawerItemModel(
    title: "Q&A",
    iconData: Icons.question_mark,
    ontap: (context) {
      mypush(context, MyRoutes.qAndA, null);
    },
  ),
  DrawerItemModel(title: "Logout", iconData: Icons.logout, ontap: (context) {}),
];
