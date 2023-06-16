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
                InfoCard(),
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
      height: 300,
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

class NutritionCard extends StatelessWidget {
  const NutritionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Text('Nutrition'),
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
