import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mystats/components/display_tile.dart';
import 'package:mystats/components/info_field.dart';
import 'package:mystats/components/section_tile.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class JournalPage extends StatefulWidget {
  const JournalPage({super.key});

  @override
  State<JournalPage> createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {
  final CarouselController carouselController = CarouselController();
  final int _itemCount = 3;
  late DateTime date;
  int currentIndex = 1;
  int previousIndex = 1;

  @override
  void initState() {
    super.initState();
    final today = DateTime.now();
    date = DateTime(today.year, today.month, today.day);
  }

  void _onPageChanged(int currentIndex, CarouselPageChangedReason reason) {
    setState(() {
      // Scroll right
      if (currentIndex == ((previousIndex + 1) % _itemCount)) {
        date = date.add(const Duration(days: 1));
      }
      // Scroll left
      else {
        date = date.subtract(const Duration(days: 1));
      }
      previousIndex = currentIndex;
    });
  }

  Widget _itemBuilder(BuildContext context, int index, int realIndex) {
    return JournalEntryPage(
      datetime: date,
    );
  }

  @override
  Widget build(BuildContext context) {
    final CarouselOptions options = CarouselOptions(
      initialPage: currentIndex,
      onPageChanged: _onPageChanged,
      enableInfiniteScroll: true,
      viewportFraction: .92,
      enlargeCenterPage: true,
      enlargeFactor: .15,
      height: double.infinity,
    );

    return CarouselSlider.builder(
      itemCount: _itemCount,
      itemBuilder: _itemBuilder,
      options: options,
    );
  }
}

class JournalEntryPage extends StatelessWidget {
  final DateTime datetime;
  const JournalEntryPage({super.key, required this.datetime});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(2, 0, 2, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 50,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.calendar_month),
                  Text(
                    DateFormat(' yyyy/MM/dd').format(datetime),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.koulen(fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                const BodyCard(),
                const NutritionCard(),
                TrainingCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BodyCard extends StatelessWidget {
  const BodyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return DisplayTile(
      color: Colors.blue[100]!,
      label: "Body Composition",
      child: Container(
        margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Row(
          children: [
            Expanded(
              child: InfoField(
                hintText: 'Body Weight',
                suffixText: "kgs",
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: InfoField(
                hintText: 'Body Fat',
                suffixText: "%",
              ),
            )
          ],
        ),
      ),
    );
  }
}

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

  NutritionItem(
      {super.key,
      required this.label,
      this.width,
      this.height,
      this.child,
      this.borderRadius,
      required this.margin});

  @override
  Widget build(BuildContext context) {
    const double defaultRadius = 0;

    return Container(
      margin: margin,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey[800]!, width: 1),
          borderRadius: BorderRadius.circular(borderRadius ?? defaultRadius)),
      child: Column(
        children: [
          Container(
            height: 40,
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular((borderRadius ?? defaultRadius) - 2),
                topRight: Radius.circular((borderRadius ?? defaultRadius) - 2),
              ),
            ),
            child: TextField(
              selectionControls: CupertinoTextSelectionControls(),
              focusNode: focusNode,
              onTapOutside: (event) {
                focusNode.unfocus();
              },
              cursorColor: Colors.white,
              style: const TextStyle(color: Colors.white, fontSize: 14),
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              ),
            ),
          ),
          child ?? Container(),
        ],
      ),
    );
  }
}

class _NutritionCardState extends State<NutritionCard> {
  List<NutritionInfo> foods = [];

  List<Widget> _buildFoodWidgetList() {
    final List<Widget> wList = [];
    for (NutritionInfo info in foods) {
      wList.add(
        NutritionItem(
          label: info.food ?? "Place Holder",
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
      label: "Nutrition",
      color: Colors.blue[100]!,
      child: Container(
        margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Column(
          children: [
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
