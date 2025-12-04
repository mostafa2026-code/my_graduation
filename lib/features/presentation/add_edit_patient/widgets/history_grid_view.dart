import 'package:flutter/material.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/pages/add_edit_patient.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/pages/history_cards.dart';

class HistoryGridView extends StatelessWidget {
  const HistoryGridView({super.key});

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
            await showModalBottomSheet(
              showDragHandle: true,
              isScrollControlled: true,

              useSafeArea: true,
              isDismissible: true,
              sheetAnimationStyle: AnimationStyle(
                curve: Curves.bounceInOut,
                duration: const Duration(milliseconds: 200),
              ),

              context: context,
              builder: (context) {
                return DraggableScrollableSheet(
                  initialChildSize: .6,
                  minChildSize: 0.2,
                  maxChildSize: 1,
                  expand: false,

                  builder: (context, scrollController) {
                    return SafeArea(child: model.bottomSheet);
                  },
                );
              },
            );
          },
          child: HistoryCards(model: model),
        );
      },
    );
  }
}
