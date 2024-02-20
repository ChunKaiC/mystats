import 'package:flutter/material.dart';
import 'package:mystats/components/display_tile.dart';
import 'package:mystats/views/main_app_pages/journal_page_parts.dart/nutrition_card.dart';

class TrainingInfo {
  final String? name;

  TrainingInfo({this.name});
}

class TrainingCard extends StatefulWidget {
  TrainingCard({super.key});

  @override
  State<TrainingCard> createState() => _TrainingCardState();
}

class _TrainingCardState extends State<TrainingCard> {
  final List<TrainingInfo> trainings = [];

  List<Widget> _buildTrainingWidgetList() {
    final List<Widget> wList = [];
    for (TrainingInfo info in trainings) {
      wList.add(
        NutritionItem(
          label: info.name ?? "Place Holder",
          margin: const EdgeInsets.fromLTRB(0, 5, 0, 10),
          borderRadius: 10,
          child: Container(
            height: 50,
          ),
        ),
      );
    }
    return wList;
  }

  @override
  Widget build(BuildContext context) {
    return DisplayTile(
      label: "Training",
      color: Colors.blue[100]!,
      child: Container(
        margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Column(children: [
          ..._buildTrainingWidgetList(),
          IconButton(
            icon: const Icon(Icons.add_circle),
            onPressed: () {
              setState(() => trainings.add(TrainingInfo()));
            },
          )
        ]),
      ),
    );
  }
}
