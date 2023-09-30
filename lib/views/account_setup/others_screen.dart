import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import '../../controller/account_setup/others_controller.dart';
import '../../controller/theme_controller.dart';
import '../../utils/colors.dart';
import '../../utils/strings.dart';
import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;
import '../widgets/common_app_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_drop_down.dart';
import '../widgets/custom_text_form_field.dart';
import 'zodiac_screen.dart';

// Other Details Screen
class OtherScreen extends StatelessWidget {
  OtherScreen({super.key});

  final OthersController controller = Get.put(OthersController());
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: CommonAppBar(title: fillYourProfile),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: controller.otherKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      CustomTextFormField(
                        textEditingController: controller.occupationController,
                        validator: MultiValidator([
                          RequiredValidator(errorText: occupationRequired),
                        ]),
                        hintText: occupation,
                        backGroundColor: themeController.isDarkMode.value
                            ? controller.backDarkColor.value
                            : controller.backColor.value,
                        onTap: () {
                          if (themeController.isDarkMode.value) {
                            controller.changeBackDarkColor(primary4Color);
                          } else {
                            controller.changeBackColor(primary4Color);
                          }
                        },
                      ),
                      const SizedBox(height: 20.0),
                      Obx(
                        () => CustomDropdown(
                          items: controller.educationItems,
                          selectedValue:
                              controller.selectedEducationValue.value,
                          onChanged: (value) {
                            controller.onEducationSelectedChange(value);
                          },
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      CustomDropdown(
                        items: controller.yearItems,
                        selectedValue: controller.selectedYearValue.value,
                        onChanged: (value) {
                          controller.onYearSelectedChange(value);
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20.0),
                  child: SizedBox(
                    width: Get.width,
                    child: CustomButton(
                      bgColor: primaryColor,
                      buttonText: continueText,
                      textColor: whiteColor,
                      cornerRadius: 100.0,
                      onPress: () {
                        if (controller.otherKey.currentState!.validate()) {
                          controller.accountSetupController
                                  .userProfileMap['occupation'] =
                              controller.occupationController.text.toString();
                          controller.accountSetupController
                                  .userProfileMap['year'] =
                              int.parse(controller.selectedYearValue.value);
                          controller.accountSetupController
                                  .educationalDegreeMap['id'] =
                              controller.selectedEducationId;
                          controller.accountSetupController
                                  .educationalDegreeMap['educational_degree'] =
                              controller.selectedEducationValue.value;

                          Get.to(ZodiacScreen());
                        }
                      },
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controller.accountSetupController
                            .userProfileMap['occupation'] =
                        controller.occupationController.text.toString();
                    controller
                            .accountSetupController.educationalDegreeMap['id'] =
                        controller.selectedEducationId;
                    controller.accountSetupController
                            .educationalDegreeMap['educational_degree'] =
                        controller.selectedEducationValue.value;

                    Get.to(ZodiacScreen());
                  },
                  child: Text(
                    skipNow,
                    textAlign: TextAlign.center,
                    style: themeController.isDarkMode.value
                        ? dark.customFont
                        : light.customFont,
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
