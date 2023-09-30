import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../controller/account_setup/fluent_controller.dart';
import '../../controller/theme_controller.dart';
import '../../model/account_setup/app_initial_model.dart';
import '../../model/fluent_languages_model.dart';
import '../../utils/colors.dart';
import '../../utils/strings.dart';
import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;
import '../widgets/common_app_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_checkbox.dart';
import 'religion_identify_screen.dart';

// FluentScreen
class FluentScreen extends StatelessWidget {
  FluentScreen({super.key});

  final FluentController controller = Get.put(FluentController());
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: fillYourProfile),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Obx(
                () => Text(
                  iAmFluentIn,
                  style: themeController.isDarkMode.value
                      ? dark.heading5
                      : light.heading5,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: controller.accountSetupController.appInitialModel
                        .value.fluentLanguageType?.length ??
                    0,
                itemBuilder: (context, index) {
                  return Obx(() {
                    FluentLanguageType fluentLanguageType = controller
                        .accountSetupController
                        .appInitialModel
                        .value
                        .fluentLanguageType![index];
                    return CustomCheckbox(
                      label: fluentLanguageType.fluentLanguageType ?? "",
                      value: fluentLanguageType.isSelected.value,
                      onChanged: (bool value) {
                        fluentLanguageType.isSelected.toggle();
                        controller.onFluentLangSelectionChange(
                          fluentLanguageType.id,
                          fluentLanguageType.fluentLanguageType,
                        );
                      },
                    );
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: CustomButton(
                bgColor: primaryColor,
                buttonText: continueText,
                textColor: whiteColor,
                cornerRadius: 100.0,
                onPress: () {
                  fluentLanguageList.isNotEmpty
                      ? Get.to(ReligionIdentifyScreen())
                      : Fluttertoast.showToast(msg: pleaseSelectAnyFluentLang);
                },
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(ReligionIdentifyScreen());
              },
              child: Obx(
                () => Text(
                  skipNow,
                  textAlign: TextAlign.center,
                  style: themeController.isDarkMode.value
                      ? dark.customFont
                      : light.customFont,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
