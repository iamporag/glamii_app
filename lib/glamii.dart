import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glamii_app/src/bloc/splash/splash_cubit.dart';
import 'package:glamii_app/src/presentation/screens/splash/splash_screen.dart';

import 'src/bloc/bloc/points_bloc.dart';

class Glamii extends StatelessWidget {
  const Glamii({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SplashCubit()..startSplashAction()),
        BlocProvider(
            create: (context) => PointsBloc()..add(CalculatePointsEvent())),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Glamii',
          theme: ThemeData(
            primaryColor: const Color(0xFF75140C),
            scaffoldBackgroundColor: Colors.white,
            fontFamily: 'GiazaStencil',
          ),
          home: const SplashScreen() // HomeScreen is main entry point
          ),
    );
  }
}
