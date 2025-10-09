import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../util/dimensions.dart';
import '../../util/styles.dart';
import 'custom_button.dart';

class ConfirmationDialog extends StatelessWidget {
  final String icon;
  final String? title;
  final String description;
  final Function onYesPressed;
  final Function? onNoPressed;
  final bool isLogOut;

  const ConfirmationDialog({
    super.key,
    required this.icon,
    this.title,
    required this.description,
    required this.onYesPressed,
    this.onNoPressed,
    this.isLogOut = false,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL),
      ),
      insetPadding: const EdgeInsets.all(30),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Padding(
        padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildIcon(),
            _buildTitle(context),
            _buildDescription(context),
            const SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
            _buildActionButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon() {
    return Padding(
      padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
      child: Image.asset(icon, width: 50, height: 50),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return title != null
        ? Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Dimensions.PADDING_SIZE_LARGE,
            ),
            child: Text(
              title!,
              textAlign: TextAlign.center,
              style: bodyMediumText(context)!.copyWith(
                fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
                color: Colors.red,
              ),
            ),
          )
        : const SizedBox();
  }

  Widget _buildDescription(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
      child: Text(
        description,
        style: bodyMediumText(
          context,
        )!.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: () => isLogOut
                ? onYesPressed()
                : onNoPressed != null
                ? onNoPressed!()
                : Get.back(),
            style: TextButton.styleFrom(
              backgroundColor: Theme.of(
                context,
              ).disabledColor.withValues(alpha: 0.3),
              minimumSize: const Size(1170, 40),
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL),
              ),
            ),
            child: Text(
              isLogOut ? 'yes'.tr : 'no'.tr,
              textAlign: TextAlign.center,
              style: bodyMediumText(
                context,
              )!.copyWith(color: Theme.of(context).textTheme.bodyLarge?.color),
            ),
          ),
        ),
        const SizedBox(width: Dimensions.PADDING_SIZE_LARGE),
        Expanded(
          child: CustomButton(
            buttonText: isLogOut ? 'no'.tr : 'yes'.tr,
            onPressed: () => isLogOut ? Get.back() : onYesPressed(),
            height: 40,
          ),
        ),
      ],
    );
  }
}
