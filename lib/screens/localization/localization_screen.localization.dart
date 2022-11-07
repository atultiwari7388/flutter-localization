import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_with_localization/controllers/localization/localization_controller.dart';
import 'package:project_with_localization/widgets/localization_widget_btn.widgets.dart';

class SelectLanguageScreen extends StatefulWidget {
  const SelectLanguageScreen({Key? key}) : super(key: key);

  @override
  State<SelectLanguageScreen> createState() => _SelectLanguageScreenState();
}

class _SelectLanguageScreenState extends State<SelectLanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GetBuilder<LocalizationController>(
            builder: (localizationController) {
          return Column(
            children: [
              Expanded(
                child: Center(
                  child: Scrollbar(
                    child: Scrollbar(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.all(5),
                        child: Center(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(
                                    child: Image.asset("assets/img/FBC.png",
                                        width: 140)),
                                const SizedBox(height: 30),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Text("select_language".tr),
                                ),
                                const SizedBox(height: 10),
                                GridView.builder(
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 1,
                                    ),
                                    itemCount: 2,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return LocalizationWidgetButton(
                                        languageModel: localizationController
                                            .languages[index],
                                        localizationController:
                                            localizationController,
                                        index: index,
                                      );
                                    }),
                                const SizedBox(height: 10),
                                Text("you_can_change_language".tr),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
