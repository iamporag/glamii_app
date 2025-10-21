import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:glamii_app/controller/splash_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

import '../controller/localization_controller.dart';
import '../controller/theme_controller.dart';
import '../data/api/api_client.dart';
import '../data/response/language_model.dart';
import '../util/app_constants.dart';

Future<Map<String, Map<String, String>>> init() async {
  // Core
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  Get.lazyPut(() => ApiClient(
      appBaseUrl: AppConstants.BASE_URL, sharedPreferences: Get.find()));

  // Repository

  // Controller
  Get.lazyPut(() => SplashController());
  Get.lazyPut(
      () => LocalizationController(
          sharedPreferences: Get.find(), apiClient: Get.find()),
      fenix: true);
  Get.lazyPut(() => ThemeController(sharedPreferences: Get.find()));

  // Retrieving localized data
  Map<String, Map<String, String>> languages = {};
  for (LanguageModel languageModel in AppConstants.languages) {
    String jsonStringValues = await rootBundle
        .loadString('assets/language/${languageModel.languageCode}.json');
    Map<String, dynamic> mappedJson = json.decode(jsonStringValues);
    // ignore: no_leading_underscores_for_local_identifiers
    Map<String, String> _json = {};
    mappedJson.forEach((key, value) {
      _json[key] = value.toString();
    });
    languages['${languageModel.languageCode}_${languageModel.countryCode}'] =
        _json;
  }
  return languages;
}
