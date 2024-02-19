import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

/// Textstyle usage:
///
///
///
///
///
///
///

extension ThemeManager on ThemeData {
  static lightMode() => ThemeData()._customized(Brightness.light);

  // TODO: Add dark theme, currently default to light theme
  static csDark() => ThemeData()._customized(Brightness.light);

  ThemeData _customized(Brightness mode) {
    final isDark = mode == Brightness.dark;
    final colorScheme = this.colorScheme.copyWith(
          primary: Colors.blue,
          secondary: Colors.white,
          background: Colors.blue,
        );
    return copyWith(
      scaffoldBackgroundColor: colorScheme.background,
      // splashColor: isDark ? WHITE : Colors.transparent,
      colorScheme: colorScheme,
      dialogBackgroundColor: Colors.white,
      textTheme: textTheme.copyWith(
        displayLarge:
            GoogleFonts.koulen(height: .1, fontSize: 70, color: Colors.white),
        titleLarge: TextStyle(fontFamily: "SF Pro Display"),
        bodyLarge: TextStyle(fontFamily: "SF Pro Text"),
      ),
      iconTheme: iconTheme.copyWith(
        color: Colors.white,
      ),
    );
  }
}
