import 'package:get/get.dart';
<<<<<<< HEAD
import 'package:glamii_app/helper/route_helper.dart';
=======

import '../helper/route_helper.dart';
>>>>>>> dcfb046afcba923fb6c5217705a6664c3e369244

class SplashController extends GetxController implements GetxService {
  @override
  void onInit() {
    super.onInit();
    _navigateToHome();
  }

  void _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.offAllNamed(RouteHelper.getNavbarRoute());
  }
}
