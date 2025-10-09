// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../../util/dimensions.dart';
import '../../util/styles.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String buttonText;
  final bool transparent;
  final EdgeInsets? margin;
  final double? height;
  final double? width;
  final double? fontSize;
  final Color? color;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    this.transparent = false,
    this.margin,
    this.width,
    this.height,
    this.fontSize,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: TextButton(
        onPressed: onPressed,
        style: _buildButtonStyle(context),
        child: Text(
          buttonText,
          textAlign: TextAlign.center,
          style: _buildTextStyle(context),
        ),
      ),
    );
  }

  ButtonStyle _buildButtonStyle(BuildContext context) {
    return TextButton.styleFrom(
      backgroundColor: _getBackgroundColor(context),
      minimumSize: Size(width ?? 1170, height ?? 45),
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL),
      ),
    );
  }

  Color? _getBackgroundColor(BuildContext context) {
    if (onPressed == null) {
      return Theme.of(context).disabledColor;
    }
    return transparent
        ? Colors.transparent
        : color ?? Theme.of(context).primaryColor;
  }

  TextStyle _buildTextStyle(BuildContext context) {
    return bodyMediumText(context)!.copyWith(
      color: Theme.of(context).indicatorColor,
      fontSize: fontSize ?? Dimensions.FONT_SIZE_LARGE,
    );
  }
}
