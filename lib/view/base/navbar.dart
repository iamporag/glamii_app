// ignore_for_file: library_private_types_in_public_api, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/navigation_controller.dart';

import '../../theme/light_theme.dart';
import '../../util/dimensions.dart';
import '../../util/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavigationBarScreen extends StatelessWidget {
  NavigationBarScreen({super.key});

  final NavigationController controller = Get.put(NavigationController());

  static DateTime? _lastBackPressTime;

  Future<bool> _onWillPop(BuildContext context) async {
    final now = DateTime.now();
    final difference =
        _lastBackPressTime == null ? null : now.difference(_lastBackPressTime!);

    if (difference == null || difference > const Duration(seconds: 2)) {
      _lastBackPressTime = now;
      final messenger = ScaffoldMessenger.of(context);
      messenger.showSnackBar(
        const SnackBar(
          content: Text("Press back again to exit"),
          duration: Duration(seconds: 2),
        ),
      );
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Obx(
        () => Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          extendBody: true,
          body: controller.pages[controller.selectedIndex.value],
          bottomNavigationBar: Container(
            height: controller.barHeight,
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
            decoration: BoxDecoration(
              color: theme.cardColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.07),
                  blurRadius: 10,
                  offset: const Offset(0, -1),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _navItem(
                  context,
                  index: 0,
                  iconData: Icons.home_max,
                  label: "Home",
                ),
                _navItem(
                  context,
                  index: 1,
                  iconData: Icons.favorite,
                  label: "Favorites",
                ),
                _navItem(
                  context,
                  index: 2,
                  iconData: Icons.calendar_month,
                  label: "Calendar",
                ),
                _navItem(
                  context,
                  index: 3,
                  iconData: Icons.account_circle,
                  label: "Profile",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _navItem(BuildContext context,
      {required int index,
      String? icon,
      required String label,
      IconData? iconData}) {
    final theme = Theme.of(context);
    final bool isSelected = controller.selectedIndex.value == index;

    return GestureDetector(
      onTap: () => controller.changePage(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_SMALL),
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColor.primary.withOpacity(0.9)
                  : Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: icon != null
                ? SvgPicture.asset(
                    icon,
                    width: 20,
                    color: isSelected
                        ? AppColor.primary
                        : Colors.grey.withOpacity(0.7),
                  )
                : Icon(
                    iconData,
                    size: 20,
                    color: isSelected
                        ? AppColor.cardColor
                        : Colors.grey.withOpacity(0.7),
                  ),
          ),
          Text(
            label,
            style: bodyMediumText(context)!.copyWith(
              fontSize: Dimensions.FONT_SIZE_SMALL,
              color: isSelected
                  ? Get.isDarkMode
                      ? AppColor.cardColor
                      : theme.primaryColor
                  : Theme.of(context).disabledColor,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
