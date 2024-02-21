import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mystats/components/display_tile.dart';
import 'package:mystats/components/ms_input_field.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:mystats/components/section_tile.dart';
import 'package:mystats/views/main_app_pages/journal_page_parts.dart/body_card.dart';
import 'package:mystats/views/main_app_pages/journal_page_parts.dart/nutrition_card.dart';
import 'package:mystats/views/main_app_pages/journal_page_parts.dart/training_card.dart';
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
      date: date,
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
  final DateTime date;
  const JournalEntryPage({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(2, 0, 2, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
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
                    DateFormat(' yyyy/MM/dd').format(date),
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
                BodyCard(date: date),
                NutritionCard(date: date),
                TrainingCard(date: date),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
