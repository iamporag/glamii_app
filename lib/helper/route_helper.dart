// ignore_for_file: unnecessary_string_interpolations

import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:glamii_app/view/screens/splash/splash_screen.dart';

import '../view/base/navbar.dart';
import '../view/screens/language/language_screen.dart';

class RouteHelper {
  static const String initial = '/';
  static const String navbar = '/navbar';
  static const String languageScreen = '/language';
  static String getInitialRoute() => '$initial';
  static String getNavbarRoute() => navbar;
  static String getLanguageRoute() => languageScreen;

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => const SplashScreen()),
    GetPage(name: navbar, page: () => const NavigationBarScreen()),
    GetPage(name: languageScreen, page: () => const LanguageScreen()),
  ];
}
