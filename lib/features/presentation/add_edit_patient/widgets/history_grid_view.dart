import 'package:flutter/material.dart';
import 'package:my_graduation/features/data/models/patient_model.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/cubit/add_edit_patient_cubit.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/pages/add_edit_patient.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/pages/history_cards.dart';

class HistoryGridView extends StatelessWidget {
  const HistoryGridView({
    super.key,
    required this.cubit,

    this.patientModelToEdit,
    required this.isEdit,
  });
  final AddEditPatientCubit cubit;
  final bool isEdit;

  final PatientModel? patientModelToEdit;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: historyCardList.length,
      itemBuilder: (BuildContext context, int index) {
        HistoryItemBuilder model = historyCardList[index];

        return GestureDetector(
          onTap: () async {
            Navigator.of(context).push(
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    Scaffold(
                      appBar: AppBar(title: Text(model.title)),
                      body: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: model.buildForm(
                          cubit,
                          patientModelToEdit,
                          isEdit,
                        ),
                      ),
                    ),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                      const begin = Offset(1.0, 0.0);
                      const end = Offset.zero;
                      const curve = Curves.easeInOut;

                      var tween = Tween(
                        begin: begin,
                        end: end,
                      ).chain(CurveTween(curve: curve));

                      return SlideTransition(
                        position: animation.drive(tween),
                        child: child,
                      );
                    },
              ),
            );
          },
          child: HistoryCards(model: model, cubit: cubit),
        );
      },
    );
  }
}
