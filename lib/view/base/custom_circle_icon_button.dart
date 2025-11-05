import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../theme/light_theme.dart';

class CustomCircleIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double? boxSize;
  final double? imagePaddingSize;
  final String? svgImagePath;
  final IconData? icon;
  const CustomCircleIconButton(
      {super.key,
      required this.onPressed,
      this.boxSize,
      this.imagePaddingSize,
      this.svgImagePath,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: boxSize ?? 40,
          width: boxSize ?? 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColor.hoverBlueColor),
          ),
          child: Padding(
            padding: EdgeInsets.all(imagePaddingSize ?? 8.0),
            child: svgImagePath != null
                ? SvgPicture.asset(
                    svgImagePath!,
                    color: Get.isDarkMode
                        ? AppColor.hoverBlueColor
                        : Theme.of(context).primaryColor,
                  )
                : Icon(
                    icon,
                    color: Get.isDarkMode
                        ? AppColor.hoverBlueColor
                        : Theme.of(context).primaryColor,
                  ),
          ),
        ),
      ),
    );
  }
}
