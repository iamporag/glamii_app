// ignore_for_file: unnecessary_type_check

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'points_event.dart';
part 'points_state.dart';

class PointsBloc extends Bloc<PointsEvent, PointsState> {
  // Dummy data for reward activities
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
  PointsBloc() : super(PointsInitial()) {
    on<CalculatePointsEvent>((event, emit) {
      // // Handle the CalculatePointsEvent
      if (event is CalculatePointsEvent) {
        int points = 0;
        for (var activity in rewardActivities) {
          String pointsString = activity['points']!;

          try {
            int pointValue = int.parse(pointsString);
            if (activity['activity'] == 'Earned Points') {
              points += pointValue;
            } else if (activity['activity'] == 'Redeemed Points') {
              points += pointValue;
            } else if (activity['activity'] == 'Expired Points') {
              points += pointValue;
            }
          } catch (e) {
            debugPrint(
                'Error Parsing Point for ${activity['activity']}: $pointsString');
          }
        }
        emit(PointsCalculatedState(totalPoints: points));
      }
    });

    on<LoadRewardActivitiesEvent>((event, emit) {
      // // Handle the CalculatePointsEvent

      emit(RewardActivitiesLoadedState(rewardActivities: rewardActivities));
    });
  }
}
