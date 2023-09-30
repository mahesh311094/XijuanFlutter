import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/settings/change_password_controller.dart';
import '../../controller/theme_controller.dart';
import '../../utils/colors.dart';
import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;
import '../../utils/utils.dart';
import '../../utils/strings.dart';
import '../dashboard/main_screen.dart';
import '../widgets/common_app_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_dialog.dart';
import '../widgets/custom_password_form_field.dart';

// Change Password Screen
class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});

  final ThemeController themeController = Get.find();
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController =
      TextEditingController();
  final ChangePasswordController controller =
      Get.put(ChangePasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: changePassword),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    oldPassword,
                    textAlign: TextAlign.start,
                    style: themeController.isDarkMode.value
                        ? dark.bodyXLargeMedium900
                        : light.bodyXLargeMedium900,
                  ),
                  const SizedBox(height: 20.0),
                  CustomPasswordFormField(
                    textEditingController: oldPasswordController,
                    iconPath: 'assets/icons/lock.svg',
                    text: '',
                    prefixIconShow: true,
                    suffixIconShow: true,
                    iconColor: controller.iconColor1.value,
                    backGroundColor: themeController.isDarkMode.value
                        ? controller.backDarkColor1.value
                        : controller.backColor1.value,
                    isObscure: controller.isObscure1.value,
                    onTap: () {
                      if (themeController.isDarkMode.value) {
                        controller.changeBackDarkColor(primary4Color, 1);
                      } else {
                        controller.changeBackColor(primary4Color, 1);
                      }
                      controller.changeIconColor(primaryColor, 1);
                    },
                    onVisibility: () {
                      controller.onChangeVisibility(
                          controller.isObscure1.value, 1);
                    },
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    newPassword,
                    textAlign: TextAlign.start,
                    style: themeController.isDarkMode.value
                        ? dark.bodyXLargeMedium900
                        : light.bodyXLargeMedium900,
                  ),
                  const SizedBox(height: 20.0),
                  CustomPasswordFormField(
                    textEditingController: newPasswordController,
                    iconPath: 'assets/icons/lock.svg',
                    text: '',
                    prefixIconShow: true,
                    suffixIconShow: true,
                    iconColor: controller.iconColor2.value,
                    backGroundColor: themeController.isDarkMode.value
                        ? controller.backDarkColor2.value
                        : controller.backColor2.value,
                    isObscure: controller.isObscure2.value,
                    onTap: () {
                      if (themeController.isDarkMode.value) {
                        controller.changeBackDarkColor(primary4Color, 2);
                      } else {
                        controller.changeBackColor(primary4Color, 2);
                      }
                      controller.changeIconColor(primaryColor, 2);
                    },
                    onVisibility: () {
                      controller.onChangeVisibility(
                          controller.isObscure2.value, 2);
                    },
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    confirmPassword,
                    textAlign: TextAlign.start,
                    style: themeController.isDarkMode.value
                        ? dark.bodyXLargeMedium900
                        : light.bodyXLargeMedium900,
                  ),
                  const SizedBox(height: 20.0),
                  CustomPasswordFormField(
                    textEditingController: confirmNewPasswordController,
                    iconPath: 'assets/icons/lock.svg',
                    text: '',
                    prefixIconShow: true,
                    suffixIconShow: true,
                    iconColor: controller.iconColor3.value,
                    backGroundColor: themeController.isDarkMode.value
                        ? controller.backDarkColor3.value
                        : controller.backColor3.value,
                    isObscure: controller.isObscure3.value,
                    onTap: () {
                      if (themeController.isDarkMode.value) {
                        controller.changeBackDarkColor(primary4Color, 3);
                      } else {
                        controller.changeBackColor(primary4Color, 3);
                      }
                      controller.changeIconColor(primaryColor, 3);
                    },
                    onVisibility: () {
                      controller.onChangeVisibility(
                          controller.isObscure3.value, 3);
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 32.0),
                child: CustomButton(
                  bgColor: primaryColor,
                  buttonText: update,
                  textColor: whiteColor,
                  cornerRadius: 100.0,
                  onPress: () {
                    changeTransparentStatusBar();
                    customDialog(
                      mainImage: 'assets/images/dialog_congratulation.svg',
                      title: congratulations,
                      content: congratulationsMessage,
                      buttonText: done,
                      screen: MainScreen(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
