import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplitPage extends StatelessWidget {
  const SplitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Center(
            child: Text(
          'Split Page',
          style: GoogleFonts.roboto(color: Colors.white),
        )),
      ),
    );
  }
}
