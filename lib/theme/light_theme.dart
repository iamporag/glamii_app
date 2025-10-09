// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../util/dimensions.dart';

ThemeData light = ThemeData(
  fontFamily: 'TTChocolates',
  primaryColor: AppColor.primary,
  scaffoldBackgroundColor: const Color(0xFFF3F5F7),
  disabledColor: const Color(0xFFA0A4A8),
  indicatorColor: const Color(0xFFF3F5F7),
  brightness: Brightness.light,
  hintColor: const Color(0xFF9F9F9F),
  cardColor: const Color(0xFFFFFFFF),
  colorScheme: const ColorScheme.light(
    primary: Color(0xFF232f3e),
    secondary: Color(0xFF232f3e),
    error: Color(0xFFE84D4F),
  ),
  primarySwatch: AppColor.primarySwatchValueColor,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'TTChocolates',
      fontSize: Dimensions.FONT_SIZE_OVER_LARGE,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    displayMedium: TextStyle(
      fontFamily: 'TTChocolates',
      fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
      fontWeight: FontWeight.bold,
      color: Colors.black87,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'TTChocolates',
      fontSize: Dimensions.FONT_SIZE_LARGE,
      fontWeight: FontWeight.normal,
      color: Colors.black87,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'TTChocolates',
      fontSize: Dimensions.FONT_SIZE_DEFAULT,
      fontWeight: FontWeight.normal,
      color: Colors.black54,
    ),
    bodySmall: TextStyle(
      fontFamily: 'TTChocolates',
      fontSize: Dimensions.FONT_SIZE_SMALL,
      fontWeight: FontWeight.normal,
      color: Colors.black45,
    ),
  ),
);

class AppColor {
  static const Color primary = Color(0xFF75140c);
  static const int primarySwatchValue = 0xFF75140c;
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
