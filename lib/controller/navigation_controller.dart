import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/screens/calendar/calendar_screen.dart';
import '../view/screens/category/categories_screen.dart';
import '../view/screens/feature_service/featured_services_screen.dart';
import '../view/screens/profile/profile_screen.dart';

class NavigationController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  final List<Widget> pages = [
    FeaturedServicesScreen(),
    CategoriesScreen(),
    const CalendarScreen(),
    const ProfileScreen(),
  ];

  double get barHeight => Platform.isIOS ? 80 : 65;

  void changePage(int index) => selectedIndex.value = index;
}
