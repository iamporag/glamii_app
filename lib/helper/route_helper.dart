<<<<<<< HEAD
import 'package:get/get.dart';
import 'package:glamii_app/view/base/navbar.dart';

import '../view/screens/splash/splash_screen.dart';
=======
// ignore_for_file: unnecessary_string_interpolations

import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:glamii_app/view/screens/splash/splash_screen.dart';

import '../view/base/navbar.dart';
import '../view/screens/language/language_screen.dart';
>>>>>>> dcfb046afcba923fb6c5217705a6664c3e369244

class RouteHelper {
  static const String initial = '/';
  static const String navbar = '/navbar';
<<<<<<< HEAD

  static String getInitialRoute() => initial;
  static String getNavbarRoute() => navbar;
=======
  static const String languageScreen = '/language';
  static String getInitialRoute() => '$initial';
  static String getNavbarRoute() => navbar;
  static String getLanguageRoute() => languageScreen;
>>>>>>> dcfb046afcba923fb6c5217705a6664c3e369244

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => const SplashScreen()),
<<<<<<< HEAD
    GetPage(name: navbar, page: () => const Navbar()),
<<<<<<< HEAD
=======
=======
    GetPage(name: navbar, page: () => const NavigationBarScreen()),
>>>>>>> 8f4ea7438f6ab5ecaa47d181f529c6cfae31952d
    GetPage(name: languageScreen, page: () => const LanguageScreen()),
>>>>>>> dcfb046afcba923fb6c5217705a6664c3e369244
  ];
}
