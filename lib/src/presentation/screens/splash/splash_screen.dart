import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glamii_app/login_screen.dart';
import 'package:glamii_app/src/bloc/splash/splash_cubit.dart';
import 'package:glamii_app/src/utils/assets_managers.dart';

import '../../../../home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state.isCompleted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const LoginScreen()),
          );
        }
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                AssetsManagers.LOGO_1,
                width: 220,
              ),
              const SizedBox(
                height: 20,
              ),
              const CircularProgressIndicator(
                strokeWidth: 3.0,
                color: Color(0xFF75140c),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
