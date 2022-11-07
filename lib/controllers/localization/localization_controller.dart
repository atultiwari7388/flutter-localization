import 'dart:ui';
import 'package:get/get.dart';
import 'package:project_with_localization/utils/app_constants.utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/language_model.models.dart';

class LocalizationController extends GetxController implements GetxService {
  //shared pref

  final SharedPreferences sharedPreferences;

  LocalizationController({required this.sharedPreferences}) {
    loadCurrentLanguage();
  }

  Locale _locale = Locale(AppConstants.language[0].languageCode,
      AppConstants.language[0].countryCode);
  Locale get locale => _locale;

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  List<LanguageModel> _languages = [];
  List get languages => _languages;

  void loadCurrentLanguage() async {
    //only get called during installation or reboot
    _locale = Locale(
        sharedPreferences.getString(AppConstants.LANGUAGE_CODE) ??
            AppConstants.language[0].languageCode,
        sharedPreferences.getString(AppConstants.COUNTRY_CODE) ??
            AppConstants.language[0].languageCode);

    for (int index = 0; index < AppConstants.language.length; index++) {
      if (AppConstants.language[index].languageCode == _locale.languageCode) {
        _selectedIndex = index;
        break;
      }
    }

    _languages = [];
    _languages.addAll(AppConstants.language);
    update();
  }

  void setLanguage(Locale locale) {
    Get.updateLocale(locale);
    _locale = locale;
    saveLanguage(_locale);
    update();
  }

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    update();
  }

  void saveLanguage(Locale locale) async {
    sharedPreferences.setString(
        AppConstants.LANGUAGE_CODE, locale.languageCode);
    sharedPreferences.setString(AppConstants.COUNTRY_CODE, locale.countryCode!);
  }
}
