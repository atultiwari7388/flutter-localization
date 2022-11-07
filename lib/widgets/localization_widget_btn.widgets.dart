import 'package:flutter/material.dart';
import 'package:project_with_localization/controllers/localization/localization_controller.dart';
import 'package:project_with_localization/models/language_model.models.dart';
import 'package:project_with_localization/utils/app_constants.utils.dart';

class LocalizationWidgetButton extends StatelessWidget {
  final LanguageModel languageModel;
  final LocalizationController localizationController;
  final int index;
  const LocalizationWidgetButton({
    Key? key,
    required this.languageModel,
    required this.localizationController,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        localizationController.setLanguage(Locale(
          AppConstants.language[index].languageCode,
          AppConstants.language[index].countryCode,
        ));

        localizationController.setSelectedIndex(index);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: Colors.grey[200]!, blurRadius: 5, spreadRadius: 1),
          ],
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 5),
                  Text(languageModel.languageName),
                ],
              ),
            ),
            localizationController.selectedIndex == index
                ? Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    bottom: 40,
                    child: Icon(
                      Icons.check_circle,
                      color: Theme.of(context).primaryColor,
                      size: 30,
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
