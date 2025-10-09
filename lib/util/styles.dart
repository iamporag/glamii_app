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

// regular font styles
const giazaStencilRegular = TextStyle(
  fontFamily: 'GiazaStencil',
  fontWeight: FontWeight.w400,
);

// medium font styles
const giazaStencilMedium = TextStyle(
  fontFamily: 'GiazaStencil',
  fontWeight: FontWeight.w500,
);

// bold font styles
const giazaStencilBold = TextStyle(
  fontFamily: 'GiazaStencil',
  fontWeight: FontWeight.w700,
);

// black font styles
const giazaStencilBlack = TextStyle(
  fontFamily: 'GiazaStencil',
  fontWeight: FontWeight.w900,
);
