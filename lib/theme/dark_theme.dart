// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';

import '../util/dimensions.dart';

ThemeData dark = ThemeData(
<<<<<<< HEAD
  fontFamily: 'Lufga',
  primaryColor: const Color(0xFF514DEC),
  scaffoldBackgroundColor: const Color(0xFF19171C),
  disabledColor: const Color(0xFF505867),
  brightness: Brightness.dark,
  indicatorColor: const Color(0xFFF3F5F7),
  hintColor: const Color(0xFFbebebe),
  cardColor: const Color(0xFF1D1B21),
  colorScheme: const ColorScheme.dark(
    primary: Color(0xFF514DEC),
    secondary: Color(0xFF514DEC),
    error: Color(0xFFE84D4F),
  ),
  primarySwatch: DarkAppColor.primarySwatchValueColor,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'Lufga',
      fontSize: Dimensions.FONT_SIZE_OVER_LARGE,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    displayMedium: TextStyle(
      fontFamily: 'Lufga',
      fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
      fontWeight: FontWeight.w500,
      color: Colors.white70,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Lufga',
      fontSize: Dimensions.FONT_SIZE_LARGE,
      fontWeight: FontWeight.w500,
      color: Colors.white70,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Lufga',
      fontSize: Dimensions.FONT_SIZE_DEFAULT,
      fontWeight: FontWeight.w500,
      color: Colors.white54,
    ),
    bodySmall: TextStyle(
      fontFamily: 'Lufga',
      fontSize: Dimensions.FONT_SIZE_SMALL,
      fontWeight: FontWeight.w400,
      color: Colors.white38,
    ),
  ),
  iconTheme: const IconThemeData(color: Colors.white54),
  iconButtonTheme: const IconButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStatePropertyAll<Color>(Colors.white70),
      iconColor: MaterialStatePropertyAll<Color>(Colors.white70),
      overlayColor: MaterialStatePropertyAll<Color>(Colors.white24),
    ),
  ),
);

class DarkAppColor {
  static const int primarySwatchValue = 0xFF514DEC;
  static const MaterialColor primarySwatchValueColor = MaterialColor(
    primarySwatchValue,
    <int, Color>{
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
    },
  );
=======
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
>>>>>>> dcfb046afcba923fb6c5217705a6664c3e369244
}
