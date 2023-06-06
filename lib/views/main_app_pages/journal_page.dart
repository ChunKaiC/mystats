import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class JournalPage extends StatelessWidget {
  const JournalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Center(
          child: CarouselSlider.builder(
        itemCount: 20,
        itemBuilder: (context, index, realIndex) {
          final dateTime = DateTime.now().add(Duration(days: index));

          return JournalEntryPage(
            datetime: dateTime,
          );
        },
        options: CarouselOptions(
            enableInfiniteScroll: false,
            viewportFraction: .92,
            enlargeCenterPage: true,
            enlargeFactor: .15,
            height: double.infinity),
      )),
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
                Container(
                  height: 100,
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text('Some information here'),
                  ),
                ),
                Container(
                  height: 300,
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text('Body'),
                  ),
                ),
                Container(
                  height: 300,
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text('Nutrition'),
                  ),
                ),
                Container(
                  height: 300,
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text('Training'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TrainingCard extends StatelessWidget {
  const TrainingCard({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class NutritionCard extends StatelessWidget {
  const NutritionCard({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class BodyCard extends StatelessWidget {
  const BodyCard({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
