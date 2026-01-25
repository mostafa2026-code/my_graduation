import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_graduation/core/functions/my_future_builder.dart';
import 'package:my_graduation/core/services/firebsase/firebase_helper.dart';
import 'package:my_graduation/core/services/firebsase/firestore_helper.dart';
import 'package:my_graduation/features/presentation/home/widgets/disease_category_list_view.dart';
import 'package:my_graduation/features/presentation/home/widgets/my_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.menu),
            );
          },
        ),
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
                Text("Undiagnosed Cases", style: headlineTextStyle()),
                const Gap(16),
                myStreamBuilder(
                  stream: FirestoreHelper.getPatientWithoutDiagnosis(),
                ),
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

  final Function? ontap;

  DrawerItemModel({required this.title, required this.iconData, this.ontap});
}

List<DrawerItemModel> drawerItems = [
  DrawerItemModel(title: "Profile", iconData: Icons.person),
  DrawerItemModel(title: "Settings", iconData: Icons.settings),

  DrawerItemModel(title: "Notifications", iconData: Icons.notifications),
  DrawerItemModel(title: "About", iconData: Icons.info),
  DrawerItemModel(title: "Q&A", iconData: Icons.question_mark),
  DrawerItemModel(
    title: "Logout",
    iconData: Icons.logout,
    ontap: FirebaseHelper.mylogout,
  ),
];
