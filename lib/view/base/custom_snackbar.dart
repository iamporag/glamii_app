import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../util/dimensions.dart';

void showCustomSnackBar(String message, {bool isError = true}) {
  Get.showSnackbar(
    GetSnackBar(
      backgroundColor: isError ? Colors.red : Colors.green,
      message: message,
      duration: const Duration(seconds: 2),
      snackStyle: SnackStyle.FLOATING,
      margin: const EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
      borderRadius: 10,
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      snackPosition: SnackPosition.TOP,
    ),
  );
}
