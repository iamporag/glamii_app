import 'dart:async';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

class GreetingController extends GetxController implements GetxService {
  // common variable
  var greeting = 'Good day!'.obs;
  var emoji = '🌤️'.obs;

  @override
  void onInit() {
    super.onInit();
    updateGreeting();

    // Update every minute
    Timer.periodic(1.minutes, (_) => updateGreeting());
  }

  // ===================================
  // Greeting Logic Section
  // ===================================

  // update greeting logic
  void updateGreeting() {
    final hour = DateTime.now().hour;

    if (hour >= 5 && hour < 12) {
      greeting.value = 'Good morning!';
      emoji.value = '☀️';
    } else if (hour >= 12 && hour < 14) {
      greeting.value = 'Good noon!';
      emoji.value = '🕛';
    } else if (hour >= 14 && hour < 17) {
      greeting.value = 'Good afternoon!';
      emoji.value = '🌤️';
    } else if (hour >= 17 && hour < 21) {
      greeting.value = 'Good evening!';
      emoji.value = '🌆';
    } else {
      greeting.value = 'Good night!';
      emoji.value = '🌙';
    }

    // Also update the time string
    update();
  }

  // Current Time
  String get currentTime {
    return DateFormat('h:mm a').format(DateTime.now());
  }
}
