import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/account_setup/language_controller.dart';
import '../../controller/theme_controller.dart';
import '../../utils/colors.dart';
import '../../utils/strings.dart';
import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;
import '../widgets/common_app_bar.dart';

// LanguageScreen
class LanguageScreen extends StatelessWidget {
  LanguageScreen({super.key});

  final LanguageController controller = Get.put(LanguageController());
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: language),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  suggested,
                  style: themeController.isDarkMode.value
                      ? dark.heading5
                      : light.heading5,
                ),
                const SizedBox(height: 10.0),
                ListTileTheme(
                  contentPadding: EdgeInsets.zero,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RadioListTile(
                        title: Text(englishUS,
                            style: themeController.isDarkMode.value
                                ? dark.heading6
                                : light.heading6),
                        value: 0,
                        groupValue: controller.selectedRadioButton.value,
                        onChanged: controller.onRadioValueChange,
                        activeColor: primaryColor,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                      RadioListTile(
                        title: Text(englishUK,
                            style: themeController.isDarkMode.value
                                ? dark.heading6
                                : light.heading6),
                        value: 1,
                        groupValue: controller.selectedRadioButton.value,
                        onChanged: controller.onRadioValueChange,
                        activeColor: primaryColor,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  others,
                  style: themeController.isDarkMode.value
                      ? dark.heading5
                      : light.heading5,
                ),
                const SizedBox(height: 10.0),
                ListTileTheme(
                  contentPadding: EdgeInsets.zero,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RadioListTile(
                        title: Text(mandarin,
                            style: themeController.isDarkMode.value
                                ? dark.heading6
                                : light.heading6),
                        value: 2,
                        groupValue: controller.selectedRadioButton.value,
                        onChanged: controller.onRadioValueChange,
                        activeColor: primaryColor,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                      RadioListTile(
                        title: Text(hindi,
                            style: themeController.isDarkMode.value
                                ? dark.heading6
                                : light.heading6),
                        value: 3,
                        groupValue: controller.selectedRadioButton.value,
                        onChanged: controller.onRadioValueChange,
                        activeColor: primaryColor,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                      RadioListTile(
                        title: Text(spanish,
                            style: themeController.isDarkMode.value
                                ? dark.heading6
                                : light.heading6),
                        value: 4,
                        groupValue: controller.selectedRadioButton.value,
                        onChanged: controller.onRadioValueChange,
                        activeColor: primaryColor,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                      RadioListTile(
                        title: Text(french,
                            style: themeController.isDarkMode.value
                                ? dark.heading6
                                : light.heading6),
                        value: 5,
                        groupValue: controller.selectedRadioButton.value,
                        onChanged: controller.onRadioValueChange,
                        activeColor: primaryColor,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                      RadioListTile(
                        title: Text(arabic,
                            style: themeController.isDarkMode.value
                                ? dark.heading6
                                : light.heading6),
                        value: 6,
                        groupValue: controller.selectedRadioButton.value,
                        onChanged: controller.onRadioValueChange,
                        activeColor: primaryColor,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                      RadioListTile(
                        title: Text(bengali,
                            style: themeController.isDarkMode.value
                                ? dark.heading6
                                : light.heading6),
                        value: 7,
                        groupValue: controller.selectedRadioButton.value,
                        onChanged: controller.onRadioValueChange,
                        activeColor: primaryColor,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                      RadioListTile(
                        title: Text(russian,
                            style: themeController.isDarkMode.value
                                ? dark.heading6
                                : light.heading6),
                        value: 8,
                        groupValue: controller.selectedRadioButton.value,
                        onChanged: controller.onRadioValueChange,
                        activeColor: primaryColor,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                      RadioListTile(
                        title: Text(indonesia,
                            style: themeController.isDarkMode.value
                                ? dark.heading6
                                : light.heading6),
                        value: 9,
                        groupValue: controller.selectedRadioButton.value,
                        onChanged: controller.onRadioValueChange,
                        activeColor: primaryColor,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
