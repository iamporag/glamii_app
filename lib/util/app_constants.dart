// ignore_for_file: constant_identifier_names

import '../data/model/response/language_model.dart';
import 'images.dart';

class AppConstants {
  static const String APP_NAME = 'Glamii';
  static const double APP_VERSION = 1.0;

  // BASE URL LINK
  static const String BASE_URL = 'https://dev.logiclabpro.xyz/api/';

  // Shared Key
  static const String THEME = 'theme';
  static const String LOCALIZATION_KEY = 'X-localization';
  static const String TOKEN = 'token';

  // Language Key
  static const String LANGUAGE_CODE = 'language_code';
  static const String COUNTRY_CODE = 'country_code';

  // Laguage section
  static List<LanguageModel> languages = [
    LanguageModel(
        imageUrl: Images.english_language,
        languageName: 'English',
        countryCode: 'US',
        languageCode: 'en'),
    LanguageModel(
        imageUrl: Images.arabic_language,
        languageName: 'Arabic',
        countryCode: 'SA',
        languageCode: 'ar'),
  ];
}
