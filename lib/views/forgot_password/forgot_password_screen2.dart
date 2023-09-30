import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../controller/forgot_password/forgot_password2_controller.dart';
import '../../controller/theme_controller.dart';
import '../../utils/colors.dart';
import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;
import '../../utils/utils.dart';
import '../../utils/strings.dart';
import '../widgets/common_app_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_password_small_form_field.dart';
import 'create_new_password_screen.dart';

// ForgotPasswordScreen2
class ForgotPasswordScreen2 extends StatelessWidget {
  final String? mobileNo;
  final String? countryCode;
  final String? email;
  final String? selectedValue;

  ForgotPasswordScreen2({
    super.key,
    this.mobileNo,
    this.countryCode,
    this.email,
    this.selectedValue,
  });

  final ForgotPassword2Controller controller =
      Get.put(ForgotPassword2Controller());
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ModalProgressHUD(
        inAsyncCall: controller.showSpinner.value,
        child: Scaffold(
          appBar: CommonAppBar(title: forgotPassword),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child: Form(
                    key: controller.forgotOtpFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Wrap(
                            children: [
                              Text(
                                textAlign: TextAlign.center,
                                codeHasBeenSentTo,
                                style: themeController.isDarkMode.value
                                    ? dark.bodyXLargeMedium900
                                    : light.bodyXLargeMedium900,
                              ),
                              const SizedBox(width: 8.0),
                              Text(
                                textAlign: TextAlign.center,
                                selectedValue == "Mobile"
                                    ? hideCharacters(
                                        "${countryCode!} ${mobileNo!}")
                                    : hideCharacters(email!),
                                style: themeController.isDarkMode.value
                                    ? dark.bodyXLargeMedium900
                                    : light.bodyXLargeMedium900,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 60.0),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomSmallPasswordFormField(
                              textEditingController:
                                  controller.otpCode1Controller,
                              isObscure: false,
                              backGroundColor: themeController.isDarkMode.value
                                  ? controller.backDarkColor1.value
                                  : controller.backColor1.value,
                              onTap: () {
                                if (themeController.isDarkMode.value) {
                                  controller.changeBackDarkColor(
                                      primary4Color, 1);
                                } else {
                                  controller.changeBackColor(primary4Color, 1);
                                }
                              },
                            ),
                            CustomSmallPasswordFormField(
                              textEditingController:
                                  controller.otpCode2Controller,
                              isObscure: false,
                              backGroundColor: themeController.isDarkMode.value
                                  ? controller.backDarkColor2.value
                                  : controller.backColor2.value,
                              onTap: () {
                                if (themeController.isDarkMode.value) {
                                  controller.changeBackDarkColor(
                                      primary4Color, 2);
                                } else {
                                  controller.changeBackColor(primary4Color, 2);
                                }
                              },
                            ),
                            CustomSmallPasswordFormField(
                              textEditingController:
                                  controller.otpCode3Controller,
                              isObscure: false,
                              backGroundColor: themeController.isDarkMode.value
                                  ? controller.backDarkColor3.value
                                  : controller.backColor3.value,
                              onTap: () {
                                if (themeController.isDarkMode.value) {
                                  controller.changeBackDarkColor(
                                      primary4Color, 3);
                                } else {
                                  controller.changeBackColor(primary4Color, 3);
                                }
                              },
                            ),
                            CustomSmallPasswordFormField(
                              textEditingController:
                                  controller.otpCode4Controller,
                              isObscure: false,
                              backGroundColor: themeController.isDarkMode.value
                                  ? controller.backDarkColor4.value
                                  : controller.backColor4.value,
                              onTap: () {
                                if (themeController.isDarkMode.value) {
                                  controller.changeBackDarkColor(
                                      primary4Color, 4);
                                } else {
                                  controller.changeBackColor(primary4Color, 4);
                                }
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 60.0),
                        Visibility(
                          visible: controller.isTimerRunning.value,
                          child: Wrap(
                            children: [
                              Text(
                                textAlign: TextAlign.center,
                                resendCodeIn,
                                style: themeController.isDarkMode.value
                                    ? dark.bodyXLargeMedium900
                                    : light.bodyXLargeMedium900,
                              ),
                              const SizedBox(width: 8.0),
                              Text(
                                "${controller.seconds.value.toString()} s",
                                textAlign: TextAlign.center,
                                style: themeController.isDarkMode.value
                                    ? dark.bodyXLargeMediumPrimary
                                    : light.bodyXLargeMediumPrimary,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Obx(
                          () => Visibility(
                            visible: !controller.isTimerRunning.value,
                            child: GestureDetector(
                              onTap: () {
                                controller.forgetPassword(
                                    email: email,
                                    countryCode: countryCode,
                                    mobile: mobileNo);

                                controller.startTimer();
                              },
                              child: Text(
                                resendCode,
                                style: themeController.isDarkMode.value
                                    ? dark.bodyXLargeMediumPrimary
                                    : light.bodyXLargeMediumPrimary,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: Get.width,
                  child: CustomButton(
                    bgColor: primaryColor,
                    buttonText: verify,
                    textColor: whiteColor,
                    cornerRadius: 100.0,
                    onPress: () {
                      if (controller.forgotOtpFormKey.currentState!
                          .validate()) {
                        controller.code =
                            '${controller.otpCode1Controller.text.toString()}${controller.otpCode2Controller.text.toString()}${controller.otpCode3Controller.text.toString()}${controller.otpCode4Controller.text.toString()}';
                        Get.to(CreateNewPasswordScreen(
                          email: email,
                          mobileNo: mobileNo,
                          countryCode: countryCode,
                          code: controller.code,
                        ));
                      }
                    },
                  ),
                ),
                const SizedBox(height: 28.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
