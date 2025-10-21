import 'package:flutter/material.dart';

class PopupModel {
  final String? image;
  final double? iconSize;
  final String title;
  final double? fontSize;
  final String route;
  final Widget? widget;
  final bool isRoute;
  final Function()? onTap;
  final Color? iconColor;
  final Color? textColor;

  PopupModel({
    this.image,
    this.iconSize,
    required this.title,
    this.fontSize,
    required this.route,
    this.widget,
    this.isRoute = true,
    this.onTap,
    this.iconColor,
    this.textColor,
  });
}
