part of 'splash_cubit.dart';

 class SplashState extends Equatable {
   final bool isCompleted;

  const SplashState({this.isCompleted = false });

  SplashState copyWith({
     bool? isCompleted
 }) {
    return SplashState(
      isCompleted: isCompleted ?? this.isCompleted,
    );
}

  @override
  List<Object?> get props => [isCompleted];
}

