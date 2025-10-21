import 'package:get/get.dart';
import 'package:glamii_app/view/base/navbar.dart';

import '../view/screens/splash/splash_screen.dart';

class RouteHelper {
  static const String initial = '/';
  static const String navbar = '/navbar';

  static String getInitialRoute() => initial;
  static String getNavbarRoute() => navbar;

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => const SplashScreen()),
    GetPage(name: navbar, page: () => const Navbar()),
  ];
}
