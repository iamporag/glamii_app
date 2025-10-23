// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:glamii_app/theme/light_theme.dart';

import '../util/dimensions.dart';

ThemeData dark = ThemeData(
  fontFamily: 'TTChocolates',
  primaryColor: AppColor.primary,
  scaffoldBackgroundColor: const Color(0xFF1c1f26),
  disabledColor: const Color(0xFF7a7a7a),
  brightness: Brightness.dark,
  indicatorColor: const Color(0xFFF3F5F7),
  hintColor: const Color(0xFFA0A4A8),
  cardColor: const Color(0xFF262a33),
  colorScheme: const ColorScheme.dark(
    primary: AppColor.primary,
    secondary: AppColor.primary,
    error: Color(0xFFE84D4F),
  ),
  primarySwatch: DarkAppColor.primarySwatchValueColor,
  useMaterial3: true,
  splashFactory: NoSplash.splashFactory,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'TTChocolates',
      fontSize: Dimensions.FONT_SIZE_OVER_LARGE,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    displayMedium: TextStyle(
      fontFamily: 'TTChocolates',
      fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
      fontWeight: FontWeight.w500,
      color: Colors.white70,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'TTChocolates',
      fontSize: Dimensions.FONT_SIZE_LARGE,
      fontWeight: FontWeight.w500,
      color: Colors.white70,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'TTChocolates',
      fontSize: Dimensions.FONT_SIZE_DEFAULT,
      fontWeight: FontWeight.w500,
      color: Colors.white54,
    ),
    bodySmall: TextStyle(
      fontFamily: 'TTChocolates',
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
  static const int primarySwatchValue = 0xFF75140C;
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
}
