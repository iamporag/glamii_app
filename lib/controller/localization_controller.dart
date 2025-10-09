import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/api/api_client.dart';
import '../data/model/response/language_model.dart';
import '../util/app_constants.dart';

class LocalizationController extends GetxController implements GetxService {
  final SharedPreferences sharedPreferences;
  final ApiClient apiClient;

  LocalizationController(
      {required this.sharedPreferences, required this.apiClient}) {
    loadCurrentLanguage();
  }

  Locale _locale = Locale(AppConstants.languages[0].languageCode!,
      AppConstants.languages[0].countryCode);

  List<LanguageModel> _languages = [];

  Locale get locale => _locale;
  List<LanguageModel> get languages => _languages;

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void loadCurrentLanguage() async {
    _locale = Locale(
        sharedPreferences.getString(AppConstants.LANGUAGE_CODE) ??
            AppConstants.languages[0].languageCode!,
        sharedPreferences.getString(AppConstants.COUNTRY_CODE) ??
            AppConstants.languages[0].countryCode);

    for (int index = 0; index < AppConstants.languages.length; index++) {
      if (AppConstants.languages[index].languageCode == _locale.languageCode) {
        _selectedIndex = index;
        break;
      }
    }
    _languages = [];
    _languages.addAll(AppConstants.languages);
    update();
  }

  // Set user new selected language
  void setLanguage(Locale locale, int index) {
    Get.updateLocale(locale);
    _locale = locale;

    _selectedIndex = index;
    saveLanguage(_locale);
    update();
  }

// Save language in local database
  void saveLanguage(Locale locale) async {
    sharedPreferences.setString(
        AppConstants.LANGUAGE_CODE, locale.languageCode);
    sharedPreferences.setString(AppConstants.COUNTRY_CODE, locale.countryCode!);
  }

  //  User select language index set
  void setSelectIndex(int index) {
    _selectedIndex = index;
    update();
  }
}
