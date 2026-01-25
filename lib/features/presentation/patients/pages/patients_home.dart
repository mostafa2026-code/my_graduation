import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_graduation/component/my_main_botton.dart';
import 'package:my_graduation/core/functions/my_future_builder.dart';
import 'package:my_graduation/core/navigation/my_routes.dart';
import 'package:my_graduation/core/navigation/navigation_methods.dart';
import 'package:my_graduation/core/services/firebsase/firestore_helper.dart';

class PatientsHome extends StatelessWidget {
  const PatientsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Patients Home')),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Your Patient"),
                  MyMainBotton(
                    width: 50,
                    height: 30,

                    title: "Add Patient",
                    onTap: () {
                      mypush(context, MyRoutes.addPatient, null);
                    },
                  ),
                ],
              ),
              Gap(24),
              
              myFutureBuilder(future: FirestoreHelper.getAllPatient()),
            ],
          ),
        ),
      ),
    );
  }
}
