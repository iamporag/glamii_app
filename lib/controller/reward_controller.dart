import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class RewardController extends GetxController implements GetxService {
  // Dummy reward activities
  final List<Map<String, String>> rewardActivities = [
    {
      'date': '2024-11-11',
      'activity': 'Earned Points',
      'points': '+5000',
      'description': 'Birthday Gift'
    },
    {
      'date': '2024-11-11',
      'activity': 'Expired Points',
      'points': '-700',
      'description': 'Redeemed for a discount on Hair Styling'
    },
    {
      'date': '2024-11-11',
      'activity': 'Earned Points',
      'points': '+1000',
      'description': 'Owner Gift'
    },
    {
      'date': '2024-11-11',
      'activity': 'Expired Points',
      'points': '-1600',
      'description': 'Redeemed for a discount on Hair Styling'
    },
    {
      'date': '2024-11-11',
      'activity': 'Earned Points',
      'points': '+900',
      'description': 'Owner Gift'
    },
    {
      'date': '2024-11-01',
      'activity': 'Earned Points',
      'points': '+150',
      'description': 'For booking Luxury Spa Treatment'
    },
    {
      'date': '2024-10-28',
      'activity': 'Redeemed Points',
      'points': '-100',
      'description': 'Redeemed for a discount on Hair Styling'
    },
    {
      'date': '2024-10-20',
      'activity': 'Earned Points',
      'points': '+200',
      'description': 'For referring a friend'
    },
    {
      'date': '2024-10-15',
      'activity': 'Expired Points',
      'points': '-50',
      'description': 'Points expired'
    },
    {
      'date': '2024-10-10',
      'activity': 'Earned Points',
      'points': '+200',
      'description': 'Signup Bonus'
    },
  ];

  // Observables
  var totalPoints = 0.obs;
  var isLoading = false.obs;
  var activityList = <Map<String, String>>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadRewardActivities();
    calculateTotalPoints();
  }

  /// Load activities (simulate network)
  void loadRewardActivities() async {
    isLoading(true);
    await Future.delayed(const Duration(milliseconds: 300));
    activityList.assignAll(rewardActivities);
    isLoading(false);
  }

  /// Calculate total points dynamically
  void calculateTotalPoints() {
    int points = 0;

    for (var activity in rewardActivities) {
      String pointsString = activity['points']!;
      try {
        int value = int.parse(pointsString);
        points += value; // Handles + or - automatically
      } catch (e) {
        debugPrint('Error parsing ${activity['activity']}: $pointsString');
      }
    }

    totalPoints(points);
  }
}
