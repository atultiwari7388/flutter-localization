import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:project_with_localization/controllers/localization/localization_controller.dart';
import 'package:project_with_localization/models/language_model.models.dart';
import 'package:project_with_localization/utils/app_constants.utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

Future<Map<String, Map<String, String>>> init() async {
  final sharedPref = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPref);

  Get.lazyPut(() => LocalizationController(sharedPreferences: Get.find()));

  //Retrieving localized data

  Map<String, Map<String, String>> _languages = Map();

  for (LanguageModel languageModel in AppConstants.language) {
    String jsonStringValues = await rootBundle
        .loadString("assets/languages/${languageModel.languageCode}.json");
    Map<String, dynamic> _mappedJson = json.decode(jsonStringValues);
    Map<String, String> _json = Map();

    _mappedJson.forEach((key, value) {
      _json[key] = value.toString();
    });

    //languages
    _languages['${languageModel.languageCode}_${languageModel.countryCode}'] =
        _json;
  }
  return _languages;
}
