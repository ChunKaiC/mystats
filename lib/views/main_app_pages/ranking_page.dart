import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mystats/components/display_tile.dart';

class RankingPage extends StatelessWidget {
  const RankingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        DisplayTile(
          label: "Personal Records",
          child: Container(
            height: 200,
            alignment: Alignment.center,
            child: Text("Personal Records"),
          ),
        ),
        DisplayTile(
          label: "Most Improved",
          child: Container(
            height: 200,
            alignment: Alignment.center,
            child: Text("Personal Records"),
          ),
        ),
        DisplayTile(
          label: "Most Consistent",
          child: Container(
            height: 200,
            alignment: Alignment.center,
            child: Text("Personal Records"),
          ),
        )
      ],
    );
  }
}
