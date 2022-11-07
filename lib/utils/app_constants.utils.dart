import '../models/language_model.models.dart';

class AppConstants {
  /*
  Localization Data
   */

  //these two fields are mandatory

  static const String COUNTRY_CODE = "country_code";
  static const String LANGUAGE_CODE = "language_code";

  //List of languages

  static List<LanguageModel> language = [
    LanguageModel(
      imageUrl: "assets/img/hindi-png.png",
      languageName: "Hindi",
      languageCode: "hi",
      countryCode: "IN",
    ),
    LanguageModel(
      imageUrl: "assets/img/english.png",
      languageName: "English",
      languageCode: "en",
      countryCode: "US",
    )
  ];
}
