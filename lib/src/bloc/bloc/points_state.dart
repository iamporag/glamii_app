part of 'points_bloc.dart';

abstract class PointsState extends Equatable {
  const PointsState();

  @override
  List<Object> get props => [];
}

final class PointsInitial extends PointsState {}

class PointsCalculatedState extends PointsState {
  final int totalPoints;

  const PointsCalculatedState({required this.totalPoints});

  @override
  List<Object> get props => [totalPoints];
}

class RewardActivitiesLoadedState extends PointsState {
  final List<Map<String, String>> rewardActivities;

  const RewardActivitiesLoadedState({required this.rewardActivities});

  @override
  List<Object> get props => [rewardActivities];
}
