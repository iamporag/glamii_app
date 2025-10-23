// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../util/dimensions.dart';

ThemeData light = ThemeData(
  fontFamily: 'TTChocolates',
  primaryColor: AppColor.primary,
  scaffoldBackgroundColor: const Color(0xFFF3F5F9),
  disabledColor: const Color(0xFF7a7a7a),
  indicatorColor: const Color(0xFFF3F5F7),
  brightness: Brightness.light,
  hintColor: const Color(0xFFA0A4A8),
  cardColor: const Color(0xFFFFFFFF),
  colorScheme: const ColorScheme.light(
    primary: AppColor.primary,
    secondary: AppColor.primary,
    error: Color(0xFFE84D4F),
  ),
  primarySwatch: AppColor.primarySwatchValueColor,
  useMaterial3: true,
  splashFactory: NoSplash.splashFactory,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'TTChocolates',
      fontSize: Dimensions.FONT_SIZE_OVER_LARGE,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    displayMedium: TextStyle(
      fontFamily: 'TTChocolates',
      fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
      fontWeight: FontWeight.w500,
      color: Colors.black87,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'TTChocolates',
      fontSize: Dimensions.FONT_SIZE_LARGE,
      fontWeight: FontWeight.w500,
      color: Colors.black87,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'TTChocolates',
      fontSize: Dimensions.FONT_SIZE_DEFAULT,
      fontWeight: FontWeight.w500,
      color: Colors.black54,
    ),
    bodySmall: TextStyle(
      fontFamily: 'TTChocolates',
      fontSize: Dimensions.FONT_SIZE_SMALL,
      fontWeight: FontWeight.w400,
      color: Colors.black45,
    ),
  ),
  iconTheme: const IconThemeData(color: Colors.black54),
);

class AppColor {
  static const Color primary = Color(0xFF75140C);
  static const Color deepBlackColor = Colors.black;
  static const Color blackColor = Colors.black87;
  static const Color blackMediumColor = Colors.black54;
  static const Color blackLowColor = Colors.black45;
  static const Color whiteColor = Colors.white70;
  static const Color whiteColorMedium = Colors.white54;
  static const Color whiteColorLow = Colors.white38;
  static const Color aquamarine = Color(0xff31c79b);
  static const Color bisque = Color(0xFFEC9C53);
  static const Color hoverBisqueColor = Color(0xFFFFF4EB);
  static const Color pink = Color(0xFFF5508C);
  static const Color dodgerBlue = Color(0xFF1F98FF);
  static const Color lime = Color(0xFF57BC2C);
  static const Color lightOrange = Color(0xFFFFAB00);
  static const Color deepOrange = Color(0xFFFE4A23);
  static const Color deepRed = Color(0xFFF4360C);
  static const Color lightYellow = Color(0xFFFDD835);
  static const Color lightRed = Color(0xFFFF3E1D);
  static const Color graphSecondary = Color(0xFF0DBAEC);
  static const Color lightGreen = Color(0xFF6DC38D);
  static const Color darkGreen = Color(0xFF1D8F6D);
  static const Color simpleGreen = Color(0xFF1DC36B);
  static const Color blackGrey = Color(0xFF1F2A37);
  static const Color originGrey = Color(0xFFD7E1EC);
  static const Color darkGrey = Color(0xFF8A8A8A);
  static const Color lightPurple = Color(0xFF9B98B4);
  static const Color lightGrey = Color(0xFFF8F6FF);
  static const Color cardColor = Color(0xFFFFFFFF);
  static const Color disabledColor = Color(0xFFA0A4A8);
  static const Color hoverBlueColor = Color(0xFFEEEDFD);
  static const Color hoverGreenColor = Color(0xFFEBFFF9);
  static const Color hoverLightBlueColor = Color(0xFFF5F7FA);
  static const Color lightBlackColor = Color(0xFF19171C);
  static const Color lightBlueColor = Color(0xFF7471F0);
  static const Color lightSplashBlueColor = Color(0xFFB9B8F7);
  static const Color linerPartOneColor = Color(0xFF9F96FF);
  static const Color linerPartTwoColor = Color(0xFF6B4EFF);
  static const Color onboardingTittleColor = Color(0xFF050534);
  static const Color splashBlueTittleColor = Color(0xFF222B45);
  static const Color onboardingSubTittleColor = Color(0xFF8F9BB3);
  static const Color lightGreyColor = Color(0xFFE8E6EA);
  static const Color deepLightGreyColor = Color(0xFFD9D9D9);
  static const Color darkBlueColor = Color(0xFF090F24);
  static const Color splashDarkBlueColor = Color(0xFF0D1028);
  static const Color lightDarkBlueColor = Color(0xFF1E2644);
  static const Color lightSplashBlackColor = Color(0xFF292D32);
  static const Color lightlyBlueColor = Color(0xFF2563EB);
  static const Color darkSplashGreyColor = Color(0xFF999999);
  static const Color splashPrimaryColor = Color(0xFFB5BBCF);
  static const Color splashBlueColor = Color(0xFFD2D1FF);
  static const Color offBlueColor = Color(0xFFDCDBFB);
  static const Color offGreyColor = Color(0xFF31383F);
  static const Color backgroundColor = Color(0xFF1D1B21);
  static const Color greyColor = Color(0xFF999CAD);
  static const Color softPink = Color(0xFFFFD8E6);
  static const Color lightMint = Color(0xFFD1F3E9);
  static const Color lightPeach = Color(0xFFF8E4D3);
  static const Color cbcGreyBlue = Color(0xFFCBCED5);
  static const Color warningYellow = Color(0xFFFDB022);
  static const Color successGreen = Color(0xFF12B76A);
  static const Color lightLavender = Color(0xFFAFA4F9);
  static const Color dangerRed = Color(0xFFF04438);
  static const Color payGreyBlue = Color(0xFF202630);
  static const Color whiteGreyBlue = Color(0xFFE5E9F3);
  static const Color darkOrangeColor = Color(0xFFFF7032);

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
