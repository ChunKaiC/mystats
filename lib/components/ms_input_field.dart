import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MSInputField extends StatelessWidget {
  final Color? enabledColor;
  final Color? disabledColor;
  final String? label;
  final String? hintText;
  final String? suffixText;
  final TextEditingController? controller;
  final bool? readOnly;
  final bool? alwaysShowSuffix;
  final EdgeInsets? padding;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final focusNode = FocusNode();

  MSInputField({
    super.key,
    this.label,
    this.suffixText,
    this.controller,
    this.readOnly,
    this.hintText,
    this.keyboardType,
    this.onChanged,
    this.padding,
    this.alwaysShowSuffix,
    this.enabledColor,
    this.disabledColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          label != null
              ? Text(
                  label!,
                )
              : Container(),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: SizedBox(
              height: 40,
              child: TextField(
                onTapOutside: (event) {
                  focusNode.unfocus();
                },
                style: const TextStyle(fontSize: 14),
                focusNode: focusNode,
                controller: controller,
                keyboardType: keyboardType,
                onChanged: onChanged,
                readOnly: readOnly ?? false,
                maxLines: 1,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: readOnly != null && readOnly!
                      ? disabledColor
                      : enabledColor,
                  hintText: hintText,
                  suffixText: alwaysShowSuffix != null && alwaysShowSuffix!
                      ? null
                      : suffixText,
                  suffixIcon: alwaysShowSuffix != null && alwaysShowSuffix!
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            suffixText ?? "",
                            textAlign: TextAlign.center,
                          ),
                        )
                      : null,
                  contentPadding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
