import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DisplayTile extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? color;
  final String label;
  final Widget child;
  final focusNode = FocusNode();

  DisplayTile(
      {super.key,
      this.height,
      this.width,
      this.color,
      required this.label,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            const SizedBox(height: 15),
            Container(
              width: width ?? double.infinity,
              height: height,
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 10),
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 2),
                color: color ?? Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(child: child),
            ),
          ],
        ),
        IntrinsicWidth(
          child: Container(
            height: 30,
            alignment: AlignmentDirectional.center,
            margin: const EdgeInsets.fromLTRB(20, 10, 10, 10),
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue, width: 2),
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              label,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w500),
            ),
          ),
        )
      ],
    );
  }
}
