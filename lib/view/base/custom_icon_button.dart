// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Icon? iconName;
  final void Function() onPressed;
  final Color? iconColor;
  final double? iconSize;
  final bool? isImage;
  final String? imageName;

  const CustomIconButton({
    super.key,
    this.iconName,
    required this.onPressed,
    this.iconColor,
    this.isImage = false,
    this.iconSize,
    this.imageName,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: isImage!
          ? Image.asset(
              imageName!,
              color: iconColor,
              height: iconSize,
              width: iconSize,
            )
          : Icon(
              Icons.dark_mode_outlined,
              color: iconColor ?? Theme.of(context).indicatorColor,
              size: iconSize,
            ),
    );
  }
}
