import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'controller/localization_controller.dart';
import 'controller/theme_controller.dart';
import 'helper/get_di.dart' as di;
import 'helper/route_helper.dart';
import 'theme/dark_theme.dart';
import 'theme/light_theme.dart';
import 'util/app_constants.dart';
import 'util/messages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  Map<String, Map<String, String>> languages = await di.init();

  runApp(MyApp(languages: languages));
}

class MyApp extends StatelessWidget {
  final Map<String, Map<String, String>> languages;
  const MyApp({super.key, required this.languages});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (themeController) {
        return GetBuilder<LocalizationController>(
          builder: (localizeController) {
            return GetMaterialApp(
              title: AppConstants.APP_NAME,
              debugShowCheckedModeBanner: false,
              navigatorKey: Get.key,
              theme: themeController.darkTheme ? dark : light,
              locale: localizeController.locale,
              initialRoute: RouteHelper.getInitialRoute(),
              getPages: RouteHelper.routes,
              defaultTransition: Transition.topLevel,
              translations: Messages(languages: languages),
              fallbackLocale: Locale(
                AppConstants.languages[0].languageCode!,
                AppConstants.languages[0].countryCode,
              ),
              transitionDuration: const Duration(milliseconds: 500),
              builder: (context, child) {
                final theme = Theme.of(context);
                final isDark = theme.brightness == Brightness.dark;

                return AnnotatedRegion<SystemUiOverlayStyle>(
                  value: SystemUiOverlayStyle(
                    statusBarColor: Colors.transparent,
                    statusBarIconBrightness:
                        isDark ? Brightness.light : Brightness.dark,
                    systemNavigationBarColor: theme.cardColor, // Android only
                    systemNavigationBarIconBrightness:
                        isDark ? Brightness.light : Brightness.dark,
                  ),
                  child: Container(
                    color: theme.cardColor,
                    child: SafeArea(
                      top: false,
                      bottom: true,
                      child: child!,
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
