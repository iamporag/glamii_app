import 'package:flutter/material.dart';

class GlamiiTheme {
  static const Color redColor = Color(0xFF75140c);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color blackColor = Color(0xFF000000);

  ThemeData buildTheme() {
    return ThemeData(
      primaryColor: redColor,
      hintColor: blackColor,
      scaffoldBackgroundColor: whiteColor,
      fontFamily: 'TT Chocolates',
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontFamily: 'Giaza Stencil', color: blackColor),
        bodyLarge: TextStyle(color: blackColor),
      ),
    );
  }
}
