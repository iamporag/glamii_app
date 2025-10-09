import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:glamii_app/util/images.dart';

import '../../../../../../controller/splash_controller.dart';
import '../../../../../../util/dimensions.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<SplashController>();
    });
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              Images.LOGO,
              width: 220,
            ),
            const SizedBox(
              height: Dimensions.FREE_SIZE_DEFAULT,
            ),
            CircularProgressIndicator(
              strokeWidth: 3.0,
              color: theme.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
