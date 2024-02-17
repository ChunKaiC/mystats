import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

extension ThemeManager on ThemeData {
  static csLight() => ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color.fromARGB(255, 0, 56, 255),
      )._customized(Brightness.light);

  static csDark() => ThemeData(
          primarySwatch: Colors.blue,
          // primaryColor: PRIMARY_COLOR_1,
          brightness: Brightness.dark)
      ._customized(Brightness.dark);

  ThemeData _customized(Brightness mode) {
    final isDark = mode == Brightness.dark;
    final colorScheme = this.colorScheme.copyWith(
        // primary: WHITE,
        // secondary: isDark ? WHITE : Colors.black,
        // background: isDark ? PRIMARY_COLOR_1 : Colors.white,
        // tertiary: isDark ? PRIMARY_COLOR_3 : Colors.green,
        // onBackground: isDark ? PRIMARY_COLOR_2 : Colors.grey,
        );
    return copyWith(
      // highlightColor: isDark ? WHITE : const Color(0xFFE4E4E4),
      scaffoldBackgroundColor: colorScheme.background,
      // splashColor: isDark ? WHITE : Colors.transparent,
      colorScheme: colorScheme,
      // dialogBackgroundColor: isDark ? BLACK : Colors.grey[50],
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            overlayColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(23, 255, 255, 255).withOpacity(0.09))),
      ),
      checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.all<Color>(colorScheme.primary),
          checkColor: MaterialStateProperty.all<Color>(colorScheme.background)),
      textTheme: textTheme.copyWith(
          // headlineLarge: HEADLINE1.copyWith(color: isDark ? WHITE : BLACK),
          // headlineMedium: HEADLINE2.copyWith(color: isDark ? WHITE : BLACK),
          // headlineSmall: HEADLINE3.copyWith(color: isDark ? WHITE : BLACK),
          // titleLarge: HEADLINE4.copyWith(color: isDark ? WHITE : BLACK),
          // bodyLarge: PARAGRAPH1.copyWith(color: isDark ? WHITE : BLACK),
          // bodyMedium: PARAGRAPH2.copyWith(color: isDark ? WHITE : BLACK),
          // bodySmall: SMALL_TEXT.copyWith(color: isDark ? WHITE : BLACK),
          ),
      appBarTheme: appBarTheme.copyWith(
        backgroundColor: primaryColor,
        // toolbarHeight: APP_BAR_HEIGHT,
        iconTheme: iconTheme.copyWith(
            // color: isDark ? DEFAULT_ICON_COLOR_LIGHT : DEFAULT_ICON_COLOR_DARK,
            // size: APP_BAR_ICON_SIZE,
            ),
      ),
      iconTheme: iconTheme.copyWith(
        // color: isDark ? DEFAULT_ICON_COLOR_LIGHT : DEFAULT_ICON_COLOR_DARK,
        size: 22,
      ),
    );
  }

  SystemUiOverlayStyle getSystemUiOverlayStyle() {
    if (brightness == Brightness.dark) {
      return SystemUiOverlayStyle.light;
    }
    return SystemUiOverlayStyle.dark;
  }
}
