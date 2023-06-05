import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CaloriesPage extends StatelessWidget {
  const CaloriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Center(
            child: Text(
          'Calories Page',
          style: GoogleFonts.roboto(color: Colors.white),
        )),
      ),
    );
  }
}
