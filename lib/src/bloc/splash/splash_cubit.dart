import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState());

  void startSplashAction() async{
    await Future.delayed(const Duration(seconds: 3));
    emit(state.copyWith(isCompleted: true));
  }
}
