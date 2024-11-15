part of 'points_bloc.dart';

 class PointsEvent extends Equatable {
  const PointsEvent();

  @override
  List<Object> get props => [];
}

class CalculatePointsEvent extends PointsEvent {}
class LoadRewardActivitiesEvent extends PointsEvent {}
