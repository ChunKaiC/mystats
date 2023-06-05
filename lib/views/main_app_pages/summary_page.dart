import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryPage extends StatelessWidget {
  const SummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Summary Page',
        style: GoogleFonts.roboto(color: Colors.white),
      ),
    );
  }
}
