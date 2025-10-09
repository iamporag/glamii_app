import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/theme_controller.dart';
import '../../../helper/route_helper.dart';
import '../../../util/dimensions.dart';
import '../../../util/images.dart';
import '../../../util/styles.dart';
import '../../base/custom_app_bar.dart';
import '../../base/custom_button.dart';
import '../../base/custom_icon_button.dart';
import '../../base/custom_snackbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: "welcome_page".tr,
        isBackButtonExist: false,
        actions: [
          CustomIconButton(
            onPressed: () {
              Get.find<ThemeController>().toggleTheme();
            },
            isImage: true,
            imageName: Images.theme,
            iconSize: 20,
            iconColor: theme.cardColor,
          ),
          CustomIconButton(
            onPressed: () {
              Get.toNamed(RouteHelper.getLanguageRoute());
            },
            isImage: true,
            imageName: Images.language,
            iconSize: 20,
            iconColor: theme.cardColor,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: theme.cardColor,
              child: Center(
                child: Text(
                  "welcome".tr,
                  textAlign: TextAlign.center,
                  style: bodyLargeText(context),
                ),
              ),
            ),
          ),
          const SizedBox(height: Dimensions.FREE_SIZE_DEFAULT),
          CustomButton(
            margin: const EdgeInsets.symmetric(
              horizontal: Dimensions.PADDING_SIZE_DEFAULT,
              vertical: 10,
            ),
            onPressed: () {
              showCustomSnackBar("thanks_for_click".tr, isError: false);
            },
            buttonText: "get_started".tr,
          ),
        ],
      ),
    );
  }
}
