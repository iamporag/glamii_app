import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../util/dimensions.dart';
import '../../util/styles.dart';

class NotAvailableWidget extends StatelessWidget {
  final double fontSize;
  final bool isRestaurant;

  const NotAvailableWidget({
    super.key,
    this.fontSize = 8,
    this.isRestaurant = false,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      bottom: 0,
      right: 0,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.6),
          borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL),
        ),
        child: Text(
          isRestaurant ? 'closed_now'.tr : 'not_available_now_break'.tr,
          textAlign: TextAlign.center,
          style: bodyMediumText(
            context,
          )!.copyWith(color: Colors.white, fontSize: fontSize),
        ),
      ),
    );
  }
}
