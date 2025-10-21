// ignore_for_file: constant_identifier_names

import '../data/response/language_model.dart';
import 'images.dart';

class AppConstants {
  static const String APP_NAME = '29 HRM';
  static const double APP_VERSION = 1.0;

  /// Shared Key
  static const String THEME = 'theme';

  /// BASE URL LINK
  static const String BASE_URL = 'https://invoicex-saas.theme29.com/api';

  /// Auth
  static const String LOGIN_URI = '/auth/login';
  static const String LOGOUT_URI = '/app/admin/logout';
  static const String SOCIAL_LOGIN_URI = '/auth/social';
  static const String FORGET_PASSWORD = '/auth/forgot-password';
  static const String OTP_VERIFICATION_URI = '/auth/verify-otp-number';
  static const String CHANGE_PASSWORD_URI = '/app/admin/change-password';
  static const String GET_PERMISSION_URI = '/selected/settings';
  static const String REGISTER_URI = '/auth/register';

  /// User
  static const String GET_USER_DATA_URI = '/v1/mobile/hrm/users';

  /// Checkout
  static const String CHECKOUT_PUNCH_IN_URI = '/v1/mobile/hrm/check-punch-in';
  static const String CHECK_IN_URI = '/v1/mobile/hrm/check-in';
  static const String CHECK_OUT_URI = '/v1/mobile/hrm/check-out';
  static const String START_BREAK_URL = '/v1/mobile/hrm/start-break-times';
  static const String END_BREAK_URL = '/v1/mobile/hrm/end-break-times';
  static const String EMPLOYEE_ATTENDANCE_STATISTICS_URI =
      '/v1/mobile/hrm/employee-attendance-statistics';

  /// Overview
  static const String GET_OVERTIME_URL = '/v1/mobile/hrm/overviews';

  /// Profile
  static const String GET_PROFILE_URI = '/app/admin/profile';
  static const String GET_MY_PROFILE_URI = '/v1/mobile/hrm/my-profile';

  /// Employees
  static const String GET_EMPLOYEES_URI = '/v1/mobile/hrm/employees';

  /// Department
  static const String GET_DEPARTMENT_URI = '/v1/mobile/hrm/departments';

  /// Holiday
  static const String GET_HOLIDAY_URI = '/v1/mobile/hrm/holidays';

  /// Event
  static const String GET_EVENT_URI = '/v1/mobile/hrm/events';

  /// Leave
  static const String LEAVE_URI = '/v1/mobile/hrm/leaves';
  static const String GET_AVAILABLE_LEAVE_URI =
      '/v1/mobile/hrm/selected/available-leaves';

  /// Breaktime Overview
  static const String GET_BREAKTIME_OVERVIEW =
      '/v1/mobile/hrm/break-time-overviews';

  /// Attendance
  static const String GET_ATTENDANCE_URI = '/v1/mobile/hrm/attendances';
  static const String GET_EMPLOYEE_CALENDAR_ATTENDANCE_URI =
      '/v1/mobile/hrm/employee-calendar-attendances';
  static const String GET_EMPLOYEE_GRAPH_ATTENDANCE_URI =
      '/v1/mobile/hrm/employee-graph-overview-attendances';

  /// Selected
  static const String GET_SELECTED_DEPARTMENT_URI =
      '/v1/mobile/hrm/selected/departments';
  static const String GET_SELECTED_EMPLOYEE_STATUS_URI =
      '/v1/mobile/hrm/selected/employee-status';
  static const String GET_SELECTED_DESIGNATION_URI =
      '/v1/mobile/hrm/selected/designations';

  /// Shared Key
  static const String USER_PASSWORD = 'user_password';
  static const String USER_EMAIL = 'user_email';
  static const String USER_ADDRESS = 'user_address';
  static const String LOCALIZATION_KEY = 'X-localization';
  static const String TOKEN = 'access_token';
  static const String SLUG = 'tenant_slug';
  static const String IS_LANGUAGE_SELECTED = 'is_language_selected';
  static const String LANGUAGE_CODE = 'language_code';
  static const String COUNTRY_CODE = 'country_code';
  static const String KEEP_ME_LOGGED_IN = 'keep_me_logged_in';
  static const String PERMISSION = 'permission_status';
  static const String APP_LOGO = 'app_logo';

  /// Notification FirebaseOptions Key
  static const String apiKey = 'AIzaSyBXxbZyFot2gmexyqKMVF2XDhitQ5vUTmE';
  static const String appId = '1:1035488155178:android:5f5e099ed24c7f1fd6d553';
  static const String iosBundleId = 'app.invoicemaker.io';
  static const String messagingSenderId = '1035488155178';
  static const String projectId = 'invoice-maker-b5674';
  static const String storageBucket = 'invoice-maker-b5674.firebasestorage.app';

  /// Language section
  static List<LanguageModel> languages = [
    LanguageModel(
        imageUrl: Images.email_icon,
        languageName: 'English',
        countryCode: 'US',
        languageCode: 'en'),
    LanguageModel(
        imageUrl: Images.email_icon,
        languageName: 'Arabic',
        countryCode: 'SA',
        languageCode: 'ar'),
  ];
}
