import 'package:flutter/material.dart';

class SectionTile extends StatelessWidget {
  final String label;
  final double? width;
  final double? height;
  final Widget? child;
  final double? borderRadius;
  final EdgeInsets? margin;

  const SectionTile(
      {super.key,
      required this.label,
      this.width,
      this.height,
      this.child,
      this.borderRadius,
      required this.margin});

  @override
  Widget build(BuildContext context) {
    const double defaultRadius = 0;

    return Container(
      margin: margin,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey[800]!, width: 1),
          borderRadius: BorderRadius.circular(borderRadius ?? defaultRadius)),
      child: Column(
        children: [
          Container(
            alignment: AlignmentDirectional.center,
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular((borderRadius ?? defaultRadius) - 2),
                topRight: Radius.circular((borderRadius ?? defaultRadius) - 2),
              ),
            ),
            child: Text(
              label,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          child ?? Container(),
        ],
      ),
    );
  }
}
