import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_with_localization/controllers/localization/localization_controller.dart';
import 'package:project_with_localization/utils/app_constants.utils.dart';
import 'package:project_with_localization/utils/app_routes.utils.dart';
import 'package:project_with_localization/utils/messages.utils.dart';
import 'package:project_with_localization/utils/dependency.utils.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Map<String, Map<String, String>> _languages = await dep.init();
  runApp(MyApp(languages: _languages));
}

class MyApp extends StatelessWidget {
  const MyApp({required this.languages});
  final Map<String, Map<String, String>> languages;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalizationController>(
        builder: (localizationController) {
      return GetMaterialApp(
        title: 'My App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: const Scaffold(),
        locale: localizationController.locale,
        translations: Messages(languages: languages),
        fallbackLocale: Locale(AppConstants.language[0].languageCode,
            AppConstants.language[0].countryCode),
        initialRoute: RouteHelper.getSplashScreen(),
        getPages: RouteHelper.routes,
      );
    });
  }
}
