// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';

import '../util/dimensions.dart';

ThemeData dark = ThemeData(
  fontFamily: 'FKGroteskNeueTrial',
  primaryColor: const Color(0xFFFC8200),
  scaffoldBackgroundColor: const Color(0xFF232531),
  disabledColor: const Color(0xFF6f7275),
  brightness: Brightness.dark,
  indicatorColor: const Color(0xFFF3F5F7),
  hintColor: const Color(0xFFbebebe),
  cardColor: const Color(0xFF333645),
  colorScheme: const ColorScheme.dark(
    primary: Color(0xFFFC8200),
    secondary: Color(0xFFFC8200),
    error: Color(0xFFE84D4F),
  ),
  primarySwatch: AppColor.primarySwatchValueColor,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'FKGroteskNeueTrial',
      fontSize: Dimensions.FONT_SIZE_OVER_LARGE,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    displayMedium: TextStyle(
      fontFamily: 'FKGroteskNeueTrial',
      fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
      fontWeight: FontWeight.bold,
      color: Colors.white70,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'FKGroteskNeueTrial',
      fontSize: Dimensions.FONT_SIZE_LARGE,
      fontWeight: FontWeight.normal,
      color: Colors.white70,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'FKGroteskNeueTrial',
      fontSize: Dimensions.FONT_SIZE_DEFAULT,
      fontWeight: FontWeight.normal,
      color: Colors.white54,
    ),
    bodySmall: TextStyle(
      fontFamily: 'FKGroteskNeueTrial',
      fontSize: Dimensions.FONT_SIZE_SMALL,
      fontWeight: FontWeight.normal,
      color: Colors.white38,
    ),
  ),
);

class AppColor {
  static const int primarySwatchValue = 0xFFFC8200;
  static const MaterialColor primarySwatchValueColor =
      MaterialColor(primarySwatchValue, <int, Color>{
        50: Color(primarySwatchValue),
        100: Color(primarySwatchValue),
        200: Color(primarySwatchValue),
        300: Color(primarySwatchValue),
        400: Color(primarySwatchValue),
        500: Color(primarySwatchValue),
        600: Color(primarySwatchValue),
        700: Color(primarySwatchValue),
        800: Color(primarySwatchValue),
        900: Color(primarySwatchValue),
      });
}
