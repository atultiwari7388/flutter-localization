import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:project_with_localization/screens/localization/localization_screen.localization.dart';
import 'package:project_with_localization/screens/splash_screen.splash.dart';
import '../screens/home/home_screen.home.screens.dart';

class RouteHelper {
  static const String initial = "/";
  static const String splash = "/splash";
  static const String language = "/language";

  static String getSplashScreen() => "$splash";
  static String getInitialScreen() => "$initial";
  static String getLanguageScreen() => "$language";

  static List<GetPage> routes = [
    GetPage(
      name: splash,
      page: () {
        return const SplashScreen();
      },
    ),
    GetPage(
      name: initial,
      page: () {
        return const HomeScreen();
      },
    ),
    GetPage(
      name: language,
      page: () {
        return const SelectLanguageScreen();
      },
    ),
  ];
}
