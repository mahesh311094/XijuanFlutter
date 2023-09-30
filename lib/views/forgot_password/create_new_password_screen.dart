import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../controller/forgot_password/create_new_password_controller.dart';
import '../../controller/theme_controller.dart';
import '../../utils/colors.dart';
import '../../utils/strings.dart';
import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;
import '../widgets/common_app_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_checkbox.dart';
import '../widgets/custom_password_form_field.dart';

// CreateNewPasswordScreen
class CreateNewPasswordScreen extends StatelessWidget {
  final String? mobileNo;
  final String? countryCode;
  final String? email;
  final String? code;

  CreateNewPasswordScreen({
    super.key,
    this.mobileNo,
    this.countryCode,
    this.email,
    this.code,
  });

  final CreateNewPasswordController controller =
      Get.put(CreateNewPasswordController());
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ModalProgressHUD(
        inAsyncCall: controller.showSpinner.value,
        child: Scaffold(
          appBar: CommonAppBar(title: createNewPassword),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 32.0),
                    Center(
                      child: SvgPicture.asset(
                        'assets/images/create_new_password.svg',
                        height: 212,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 32.0),
                    Text(
                      createYourNewPassword,
                      textAlign: TextAlign.start,
                      style: themeController.isDarkMode.value
                          ? dark.bodyXLargeMedium900
                          : light.bodyXLargeMedium900,
                    ),
                    const SizedBox(height: 28.0),
                    CustomPasswordFormField(
                      textEditingController: controller.newPasswordController,
                      validator: MultiValidator([
                        RequiredValidator(errorText: pleaseEnterPassword),
                      ]),
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
                    const SizedBox(height: 18.0),
                    CustomPasswordFormField(
                      textEditingController:
                          controller.confirmNewPasswordController,
                      validator: MultiValidator([
                        RequiredValidator(errorText: pleaseReEnterPassword),
                      ]),
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
                    const SizedBox(height: 18.0),
                    CustomCheckbox(
                      value: controller.selectedCheckbox.value,
                      label: rememberMe,
                      onChanged: (bool value) {
                        if (controller.formKey.currentState!.validate()) {
                          if (controller.newPasswordController.text ==
                              controller.confirmNewPasswordController.text) {
                            controller.onCheckboxValueChange(
                                value, controller.newPasswordController.text);
                          } else {
                            Fluttertoast.showToast(msg: passwordMismatched);
                          }
                        }
                      },
                      flag: true,
                    ),
                    const SizedBox(height: 32.0),
                    SizedBox(
                      width: Get.width,
                      child: CustomButton(
                          bgColor: controller.selectedCheckbox.value
                              ? primaryColor
                              : disabledButtonColor,
                          buttonText: continueText,
                          textColor: whiteColor,
                          cornerRadius: 100.0,
                          onPress: () {
                            if (controller.formKey.currentState!.validate()) {
                              if (controller.newPasswordController.text ==
                                  controller
                                      .confirmNewPasswordController.text) {
                                controller.resetPassword(
                                  countryCode: countryCode,
                                  mobile: mobileNo,
                                  email: email,
                                  password:
                                      controller.newPasswordController.text,
                                  verificationCode: code,
                                );
                              } else {
                                Fluttertoast.showToast(msg: passwordMismatched);
                              }
                            }
                          }),
                    ),
                    const SizedBox(height: 28.0),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
