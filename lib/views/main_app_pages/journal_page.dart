import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
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
      // width: double.infinity,
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
              child: Text(
                'DATE: ${DateFormat('yyyy/MM/dd').format(datetime)}',
                textAlign: TextAlign.center,
                style: GoogleFonts.koulen(fontSize: 20),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                BodyCard(),
                NutritionCard(),
                TrainingCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 5),
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Text('Some information here'),
      ),
    );
  }
}

class BodyCard extends StatelessWidget {
  const BodyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Text('Body'),
      ),
    );
  }
}

class NutritionInfo {
  String food;
  int calories;
  int fats;
  int proteins;
  int carbs;

  NutritionInfo(this.food, this.calories, this.fats, this.proteins, this.carbs);
}

class NutritionCard extends StatefulWidget {
  const NutritionCard({super.key});

  @override
  State<NutritionCard> createState() => _NutritionCardState();
}

class _NutritionCardState extends State<NutritionCard> {
  List<NutritionInfo> breakfast = [];
  List<NutritionInfo> lunch = [];
  List<NutritionInfo> dinner = [];
  List<NutritionInfo> snacks = [];

  @override
  Widget build(BuildContext context) {
    final List<Widget> breakfastSection = [Text('Breakfast')];
    for (int i = 0; i < breakfast.length + 1; i++) {
      if (i == breakfast.length) {
        breakfastSection.add(TextButton(
            onPressed: () {
              setState(() {
                breakfast.add(NutritionInfo('stuff', 0, 0, 0, 0));
              });
            },
            child: Text(
              'Add',
              style: GoogleFonts.roboto(color: Colors.black),
            )));
      } else {
        final info = breakfast[i];
        breakfastSection.add(Text(info.food));
      }
    }

    final List<Widget> lunchSection = [Text('Lunch')];
    for (int i = 0; i < lunch.length + 1; i++) {
      if (i == lunch.length) {
        lunchSection.add(TextButton(
            onPressed: () {
              setState(() {
                lunch.add(NutritionInfo('stuff', 0, 0, 0, 0));
              });
            },
            child: Text(
              'Add',
              style: GoogleFonts.roboto(color: Colors.black),
            )));
      } else {
        final info = lunch[i];
        lunchSection.add(Text(info.food));
      }
    }

    final List<Widget> dinnerSection = [Text('Dinner')];
    for (int i = 0; i < dinner.length + 1; i++) {
      if (i == dinner.length) {
        dinnerSection.add(TextButton(
            onPressed: () {
              setState(() {
                dinner.add(NutritionInfo('stuff', 0, 0, 0, 0));
              });
            },
            child: Text(
              'Add',
              style: GoogleFonts.roboto(color: Colors.black),
            )));
      } else {
        final info = dinner[i];
        dinnerSection.add(Text(info.food));
      }
    }

    final List<Widget> snackSection = [Text('Snack')];
    for (int i = 0; i < snacks.length + 1; i++) {
      if (i == snacks.length) {
        snackSection.add(TextButton(
            onPressed: () {
              setState(() {
                snacks.add(NutritionInfo('stuff', 0, 0, 0, 0));
              });
            },
            child: Text(
              'Add',
              style: GoogleFonts.roboto(color: Colors.black),
            )));
      } else {
        final info = snacks[i];
        snackSection.add(Text(info.food));
      }
    }

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Column(children: breakfastSection),
          Column(children: lunchSection),
          Column(children: dinnerSection),
          Column(children: snackSection)
        ],
      ),
    );
  }
}

class TrainingCard extends StatelessWidget {
  const TrainingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Text('Training'),
      ),
    );
  }
}
