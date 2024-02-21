import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mystats/components/display_tile.dart';
import 'package:mystats/components/ms_input_field.dart';

const int calPerCarb = 4;
const int calPerProtein = 4;
const int calPerFat = 9;

class NutritionInfo {
  String? name;
  int? calories;
  int? fats;
  int? proteins;
  int? carbohydrates;

  NutritionInfo(
      {this.name, this.calories, this.fats, this.proteins, this.carbohydrates});
}

class NutritionCard extends StatefulWidget {
  // TODO: Use this to query data!
  final DateTime date;
  final bool isUsingMacros = true;

  const NutritionCard({super.key, required this.date});

  @override
  State<NutritionCard> createState() => _NutritionCardState();
}

class _NutritionCardState extends State<NutritionCard> {
  List<NutritionInfo> foods = [
    NutritionInfo(fats: 30, proteins: 30, carbohydrates: 40)
  ];
  int touchedIndex = -1;

  // TODO: Load foods here
  @override
  void initeState() {
    super.initState();
  }

  List<Widget> buildFoodWidgetList() {
    final List<Widget> wList = [];
    for (NutritionInfo info in foods) {
      wList.add(
        NutritionItem(
          label: info.name ?? "Place Holder",
          margin: const EdgeInsets.fromLTRB(0, 5, 0, 10),
          borderRadius: 8,
          child: Container(
            height: 50,
          ),
        ),
      );
    }
    return wList;
  }

  // TODO: Data here are just placeholders!
  List<PieChartSectionData> _showingSections() {
    double proteinSum = 0;
    double fatSum = 0;
    double carbSum = 0;

    for (NutritionInfo info in foods) {
      proteinSum += info.proteins ?? 0;
      fatSum += info.fats ?? 0;
      carbSum += info.carbohydrates ?? 0;
    }

    double sum = proteinSum + fatSum + carbSum;

    if (sum == 0) {
      return [
        PieChartSectionData(
          color: Colors.grey,
          value: 100,
          radius: 50,
          title: "N/A",
        )
      ];
    }

    return List.generate(3, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 66.0 : 55.0;
      final titleStyle = TextStyle(
        color: Colors.white,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      );
      switch (i) {
        case 0:
          return PieChartSectionData(
              color: Colors.red,
              value: proteinSum,
              title: "${((proteinSum / sum) * 100).round()}%",
              radius: radius,
              titleStyle: titleStyle);
        case 1:
          return PieChartSectionData(
              color: Colors.green,
              value: fatSum,
              title: '${((fatSum / sum) * 100).round()}%',
              radius: radius,
              titleStyle: titleStyle);
        case 2:
          return PieChartSectionData(
              color: Colors.blue,
              value: carbSum,
              title: '${((carbSum / sum) * 100).round()}%',
              radius: radius,
              titleStyle: titleStyle);
        default:
          throw Error();
      }
    });
  }

  Widget _buildNutritionPieChart() {
    return PieChart(
      PieChartData(
        pieTouchData: PieTouchData(
          touchCallback: (FlTouchEvent event, pieTouchResponse) {
            setState(() {
              if (!event.isInterestedForInteractions ||
                  pieTouchResponse == null ||
                  pieTouchResponse.touchedSection == null) {
                touchedIndex = -1;
                return;
              }
              touchedIndex =
                  pieTouchResponse.touchedSection!.touchedSectionIndex;
            });
          },
        ),
        borderData: FlBorderData(
          show: false,
        ),
        sectionsSpace: 0,
        centerSpaceRadius: 20,
        sections: _showingSections(),
      ),
    );
  }

  Widget _buildNutritionNumeric() {
    double proteinSum = 0;
    double fatSum = 0;
    double carbSum = 0;

    for (NutritionInfo info in foods) {
      proteinSum += info.proteins ?? 0;
      fatSum += info.fats ?? 0;
      carbSum += info.carbohydrates ?? 0;
    }

    int calories = ((proteinSum * calPerProtein) +
            (fatSum * calPerFat) +
            (carbSum * calPerCarb))
        .round();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text("Calories:"),
            Expanded(child: Container()),
            Text("${calories}cal", textAlign: TextAlign.end)
          ],
        ),
        const Divider(
          height: 15,
          thickness: 2,
          color: Colors.white,
        ),
        Row(
          children: [
            const Text("Proteins:"),
            Expanded(child: Container()),
            Text("${proteinSum.round()}g", textAlign: TextAlign.end)
          ],
        ),
        const Divider(
          height: 15,
          thickness: 2,
          color: Colors.white,
        ),
        Row(
          children: [
            const Text("Carbs:"),
            Expanded(child: Container()),
            Text("${carbSum.round()}g", textAlign: TextAlign.end)
          ],
        ),
        const Divider(
          height: 15,
          thickness: 2,
          color: Colors.white,
        ),
        Row(
          children: [
            const Text("Fats:"),
            Expanded(child: Container()),
            Text("${fatSum.round()}g", textAlign: TextAlign.end)
          ],
        ),
        const Divider(
          height: 15,
          thickness: 2,
          color: Colors.white,
        ),
      ],
    );
  }

  Widget buildNutritionSummary() {
    return Container(
      // color: Colors.white,
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      height: 170,
      child: Row(
        children: [
          Expanded(child: _buildNutritionPieChart()),
          const SizedBox(width: 15),
          Expanded(child: _buildNutritionNumeric())
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DisplayTile(
      label: "Nutrition",
      color: Colors.blue[100]!,
      child: Container(
        margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
        child: Column(
          children: [
            widget.isUsingMacros ? buildNutritionSummary() : Container(),
            ...buildFoodWidgetList(),
            IconButton(
              icon: const Icon(Icons.add_circle),
              onPressed: () {
                setState(() => foods.add(NutritionInfo()));
              },
            )
          ],
        ),
      ),
    );
  }
}

class NutritionItem extends StatelessWidget {
  final String label;
  final double? width;
  final double? height;
  final Widget? child;
  final double? borderRadius;
  final EdgeInsets? margin;
  final FocusNode focusNode = FocusNode();
  final TextEditingController controller = TextEditingController();

  NutritionItem(
      {super.key,
      required this.label,
      this.width,
      this.height,
      this.child,
      this.borderRadius,
      this.margin});

  @override
  Widget build(BuildContext context) {
    const double defaultRadius = 0;

    return Container(
      margin: margin,
      decoration: BoxDecoration(
          color: Colors.white,
          // border: Border.all(color: Colors.grey[700]!, width: 1),
          borderRadius: BorderRadius.circular(borderRadius ?? defaultRadius)),
      child: Column(
        children: [
          Container(
            height: 35,
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular((borderRadius ?? defaultRadius) - 2),
                topRight: Radius.circular((borderRadius ?? defaultRadius) - 2),
              ),
            ),
            child: TextField(
              controller: controller,
              selectionControls: CupertinoTextSelectionControls(),
              focusNode: focusNode,
              onTapOutside: (event) {
                focusNode.unfocus();
              },
              cursorColor: Colors.white,
              style: const TextStyle(color: Colors.white, fontSize: 14),
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                hintText: "Entry Name",
                hintStyle: TextStyle(color: Colors.white, fontSize: 14),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 15),
              ),
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  "calories",
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Text(
                  "proteins",
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Text(
                  "carbs",
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Text(
                  "fats",
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          const Row(),
        ],
      ),
    );
  }
}
