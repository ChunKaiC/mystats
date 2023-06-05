import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RankingPage extends StatelessWidget {
  const RankingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Center(
            child: Text(
          'Ranking Page',
          style: GoogleFonts.roboto(color: Colors.white),
        )),
      ),
    );
  }
}
