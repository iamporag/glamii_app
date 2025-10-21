// import 'package:get/get.dart';

// import '../../helper/route_helper.dart';
// import '../../view/screens/home/home_screen.dart';

// class ApiChecker {
//   static void checkApi(Response response) {
//     // api response handler code
//     if (response.statusCode == 401) {
//       Get.find<AuthController>().clearSharedData();
//       Get.offAllNamed(RouteHelper.getLoginRoute());
//     } else if (response.statusCode == 403) {
//       showCustomToastMessage(response.body['message'], isError: true);
//       Get.find<OverviewController>().setBottomNavBarIndex(0);
//       Get.find<OverviewController>().setBodyItem(const HomeScreen());
//       Get.offAllNamed(RouteHelper.getNavbarRoute());
//     } else if (response.statusCode == 500) {
//       showCustomToastMessage(response.statusText!);
//     } else {
//       showCustomToastMessage(response.body['message'], isError: true);
//     }
//   }
// }
