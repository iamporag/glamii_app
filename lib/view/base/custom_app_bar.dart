// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../util/dimensions.dart';
import '../../util/styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool isBackButtonExist;
  final Function? onBackPressed;
  final List<Widget>? actions;
  final bool? centerTitle;
  final double? fontSize;

  const CustomAppBar({
    super.key,
    this.title,
    this.isBackButtonExist = true,
    this.onBackPressed,
    this.actions,
    this.centerTitle,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;
    final isDarkMode = Get.isDarkMode;

    return AppBar(
      surfaceTintColor: Colors.transparent,
      backgroundColor: _getBackgroundColor(context, platform, isDarkMode),
      // systemOverlayStyle: _getSystemUiOverlayStyle(context, isDarkMode),
      title: _buildTitle(context),
      centerTitle: centerTitle ?? true,
      leading: isBackButtonExist
          ? _buildBackButton(context, platform)
          : const SizedBox(),
      actions: actions,
      elevation: 0,
    );
  }

  Color? _getBackgroundColor(
    BuildContext context,
    TargetPlatform platform,
    bool isDarkMode,
  ) {
    if (platform == TargetPlatform.iOS) {
      return isDarkMode ? null : Theme.of(context).primaryColor;
    }
    if (platform == TargetPlatform.android) {
      return Theme.of(context).primaryColor;
    }
    return null;
  }

  // SystemUiOverlayStyle _getSystemUiOverlayStyle(
  //     BuildContext context, bool isDarkMode) {
  //   return SystemUiOverlayStyle(
  //     statusBarColor: isDarkMode
  //         ? Theme.of(context).cardColor
  //         : Theme.of(context).primaryColor,
  //     statusBarIconBrightness: Brightness.light,
  //     statusBarBrightness: Brightness.light,
  //   );
  // }

  Widget _buildTitle(BuildContext context) {
    if (title != null) {
      return Text(
        title!,
        textAlign: TextAlign.center,
        style: bodyMediumText(context)!.copyWith(
          fontSize: fontSize ?? Dimensions.FONT_SIZE_LARGE,
          color: Theme.of(context).indicatorColor,
        ),
      );
    }
    return const SizedBox();
  }

  Widget _buildBackButton(BuildContext context, TargetPlatform platform) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        color: platform == TargetPlatform.iOS
            ? Theme.of(context).indicatorColor
            : null,
      ),
      onPressed: () =>
          onBackPressed != null ? onBackPressed!() : Navigator.pop(context),
    );
  }

  @override
  Size get preferredSize => Size(1170, GetPlatform.isDesktop ? 70 : 50);
}
