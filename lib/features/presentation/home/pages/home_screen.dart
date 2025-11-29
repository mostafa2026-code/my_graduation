import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_graduation/core/services/firebsase/firebase_helper.dart';
import 'package:my_graduation/features/presentation/home/widgets/complicated_cases_list_view.dart';
import 'package:my_graduation/features/presentation/home/widgets/disease_category_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              const  Gap(16),

                SizedBox(
                  height: MediaQuery.of(context).size.height * .25,
                  child: DiseaseCategoryListView(),
                ),
               const  Gap(24),
                Text("Compilcated Cases", style: headlineTextStyle()),
               const  Gap(16),
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
