import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../theme/light_theme.dart';
import '../../util/dimensions.dart';
import '../../util/styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool? isBackButtonExist;
  final Function? onBackPressed;
  final List<Widget>? actions;
  final bool? centerTitle;
  const CustomAppBar({
    super.key,
    this.actions,
    this.title,
    this.isBackButtonExist,
    this.onBackPressed,
    this.centerTitle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      backgroundColor: theme.cardColor,
      surfaceTintColor: Colors.transparent,

      /// Title Section
      title: title != null
          ? Text(
              title!,
              textAlign: TextAlign.center,
              style: bodyMediumText(context)!.copyWith(
                  color: Get.isDarkMode
                      ? theme.textTheme.bodyLarge!.color
                      : AppColor.splashBlueTittleColor,
                  fontSize: Dimensions.FONT_SIZE_LARGE),
            )
          : const SizedBox(),
      centerTitle: centerTitle == null ? true : false,

      /// Action Section
      leading: isBackButtonExist!
          ? GestureDetector(
              onTap: () => onBackPressed != null
                  ? onBackPressed!()
                  : Navigator.pop(context),
              child: Center(
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColor.hoverBlueColor),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                      color: Get.isDarkMode
                          ? AppColor.hoverBlueColor
                          : Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
            )
          : const SizedBox(),
      actions: actions,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size(1170, GetPlatform.isDesktop ? 70 : 50);
}
