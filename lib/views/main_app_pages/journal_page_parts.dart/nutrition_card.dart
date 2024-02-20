import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mystats/components/display_tile.dart';
import 'package:mystats/components/ms_input_field.dart';

class NutritionInfo {
  String? food;
  int? calories;
  int? fats;
  int? proteins;
  int? carbs;

  NutritionInfo(
      {this.food, this.calories, this.fats, this.proteins, this.carbs});
}

class NutritionCard extends StatefulWidget {
  const NutritionCard({super.key});

  @override
  State<NutritionCard> createState() => _NutritionCardState();
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
                  "carbohydrates",
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

class _NutritionCardState extends State<NutritionCard> {
  List<NutritionInfo> foods = [];
  int touchedIndex = -1;

  List<Widget> _buildFoodWidgetList() {
    final List<Widget> wList = [];
    for (NutritionInfo info in foods) {
      wList.add(
        NutritionItem(
          label: info.food ?? "Place Holder",
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

  List<PieChartSectionData> showingSections() {
    return List.generate(3, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      final titleStyle = TextStyle(
        color: Colors.white,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      );
      switch (i) {
        case 0:
          return PieChartSectionData(
              color: Colors.red,
              value: 40,
              title: '40%',
              radius: radius,
              titleStyle: titleStyle);
        case 1:
          return PieChartSectionData(
              color: Colors.green,
              value: 30,
              title: '30%',
              radius: radius,
              titleStyle: titleStyle);
        case 2:
          return PieChartSectionData(
              color: Colors.blue,
              value: 15,
              title: '15%',
              radius: radius,
              titleStyle: titleStyle);
        default:
          throw Error();
      }
    });
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
            Container(
              // color: Colors.white,
              height: 170,
              child: Row(
                children: [
                  Expanded(
                    child: PieChart(
                      PieChartData(
                        pieTouchData: PieTouchData(
                          touchCallback:
                              (FlTouchEvent event, pieTouchResponse) {
                            setState(() {
                              if (!event.isInterestedForInteractions ||
                                  pieTouchResponse == null ||
                                  pieTouchResponse.touchedSection == null) {
                                touchedIndex = -1;
                                return;
                              }
                              touchedIndex = pieTouchResponse
                                  .touchedSection!.touchedSectionIndex;
                            });
                          },
                        ),
                        borderData: FlBorderData(
                          show: false,
                        ),
                        sectionsSpace: 0,
                        centerSpaceRadius: 20,
                        sections: showingSections(),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      height: 200,
                      width: 100,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Calories: 2100 cal"),
                          Divider(
                            endIndent: 10,
                            height: 10,
                            thickness: 2,
                            color: Colors.white,
                          ),
                          SizedBox(height: 10),
                          Text("Proteins: 10g"),
                          Divider(
                            endIndent: 10,
                            height: 10,
                            thickness: 2,
                            color: Colors.white,
                          ),
                          SizedBox(height: 10),
                          Text("Carbs: 50g"),
                          Divider(
                            endIndent: 10,
                            height: 10,
                            thickness: 2,
                            color: Colors.white,
                          ),
                          SizedBox(height: 10),
                          Text("Fats: 100g"),
                          Divider(
                            endIndent: 10,
                            height: 10,
                            thickness: 2,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            ..._buildFoodWidgetList(),
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
