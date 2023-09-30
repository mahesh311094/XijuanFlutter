import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import '../../controller/account_setup/account_setup_controller.dart';
import '../../controller/account_setup/fill_profile_sec1_controller.dart';
import '../../controller/theme_controller.dart';
import '../../utils/colors.dart';
import '../../utils/shared_preference.dart';
import '../../utils/strings.dart';
import '../widgets/common_app_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_form_field.dart';
import 'fill_profile_sec2_screen.dart';

// Fill Profile section 1
class FillProfileSec1Screen extends StatelessWidget {
  FillProfileSec1Screen({super.key});

  final FillProfileSec1Controller controller =
      Get.put(FillProfileSec1Controller());
  final AccountSetupController accountSetupController = Get.find();
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    controller.firstNameController.text = accountSetupController
            .userProfileResModel.value.userProfile?.firstName ??
        "";
    controller.aboutMeController.text =
        accountSetupController.userProfileResModel.value.userProfile?.aboutMe ??
            "";
    return Scaffold(
      appBar: CommonAppBar(title: fillYourProfile),
      body: Obx(
        () => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: controller.fillProfileSec1Key,
              child: Column(
                children: [
                  CustomTextFormField(
                    textEditingController: controller.firstNameController,
                    validator: MultiValidator([
                      RequiredValidator(errorText: firstNameRequired),
                    ]),
                    hintText: firstName,
                    backGroundColor: themeController.isDarkMode.value
                        ? controller.fNameBackDarkColor.value
                        : controller.fNameBackColor.value,
                    onTap: () {
                      if (themeController.isDarkMode.value) {
                        controller.changeFNameBackDarkColor(primary4Color);
                      } else {
                        controller.changeFNameBackColor(primary4Color);
                      }
                    },
                  ),
                  const SizedBox(height: 20.0),
                  CustomTextFormField(
                    textEditingController: controller.aboutMeController,
                    hintText: aboutMe,
                    showMaxLines: true,
                    backGroundColor: themeController.isDarkMode.value
                        ? controller.aboutMeBackDarkColor.value
                        : controller.aboutMeBackColor.value,
                    onTap: () {
                      if (themeController.isDarkMode.value) {
                        controller.changeAboutMeBackDarkColor(primary4Color);
                      } else {
                        controller.changeAboutMeBackColor(primary4Color);
                      }
                    },
                  ),
                  const SizedBox(height: 30.0),
                  SizedBox(
                    width: Get.width,
                    child: CustomButton(
                      bgColor: disabledButtonColor,
                      buttonText: continueText,
                      textColor: whiteColor,
                      cornerRadius: 100.0,
                      onPress: () {
                        String? userId = SharedPreference().getUserId();

                        if (controller.fillProfileSec1Key.currentState!
                            .validate()) {
                          accountSetupController.userProfileMap['user_id'] =
                              userId;
                          accountSetupController.userProfileMap['first_name'] =
                              controller.firstNameController.text.toString();
                          accountSetupController.userProfileMap['last_name'] =
                              "";
                          accountSetupController.userProfileMap['about_me'] =
                              controller.aboutMeController.text.toString();
                          accountSetupController.userProfileMap['profile_pic'] =
                              "";

                          Get.to(FillProfileSec2Screen());
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
