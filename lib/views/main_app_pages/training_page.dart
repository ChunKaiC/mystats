import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TrainingPage extends StatelessWidget {
  const TrainingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Center(
            child: Text(
          'Training Page',
          style: GoogleFonts.roboto(color: Colors.white),
        )),
      ),
    );
  }
}
