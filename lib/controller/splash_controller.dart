import 'package:get/get.dart';

import '../helper/route_helper.dart';

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
