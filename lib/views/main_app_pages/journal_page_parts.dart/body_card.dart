import 'package:flutter/material.dart';
import 'package:mystats/components/display_tile.dart';
import 'package:mystats/components/ms_input_field.dart';

class BodyCard extends StatelessWidget {
  // TODO: Use this to query data!
  final DateTime date;

  const BodyCard({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return DisplayTile(
      color: Colors.blue[100]!,
      label: "Body Composition",
      child: Container(
        margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Row(
          children: [
            Expanded(
              child: MSInputField(
                enabledColor: Colors.white,
                hintText: 'Body Weight',
                suffixText: "kgs",
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: MSInputField(
                enabledColor: Colors.white,
                hintText: 'Body Fat',
                suffixText: "%",
              ),
            )
          ],
        ),
      ),
    );
  }
}
