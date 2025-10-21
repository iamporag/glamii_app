import 'package:flutter/material.dart';

TextStyle? displayLargeText(BuildContext context) {
  return Theme.of(context).textTheme.displayLarge!;
}

TextStyle? displayMediumText(BuildContext context) {
  return Theme.of(context).textTheme.displayMedium!;
}

TextStyle? bodyLargeText(BuildContext context) {
  return Theme.of(context).textTheme.bodyLarge!;
}

TextStyle? bodyMediumText(BuildContext context) {
  return Theme.of(context).textTheme.bodyMedium!;
}

TextStyle? bodySmallText(BuildContext context) {
  return Theme.of(context).textTheme.bodySmall;
}


String dotStringText(String text, {int maxLength = 17}) {
  return text.length > maxLength ? '${text.substring(0, maxLength)}...' : text;
}

String dotAmountText(String text, {int maxLength = 8}) {
  return text.length > maxLength ? '${text.substring(0, maxLength)}...' : text;
}