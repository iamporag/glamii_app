import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:glamii_app/util/images.dart';

<<<<<<< HEAD
import '../../../controller/splash_controller.dart';
import '../../../util/dimensions.dart';
=======
import '../../../../../../controller/splash_controller.dart';
import '../../../../../../util/dimensions.dart';
>>>>>>> dcfb046afcba923fb6c5217705a6664c3e369244

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
<<<<<<< HEAD
              Images.logo,
=======
              Images.LOGO,
>>>>>>> dcfb046afcba923fb6c5217705a6664c3e369244
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
