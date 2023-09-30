import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../controller/on_boarding/otp_controller.dart';
import '../../controller/theme_controller.dart';
import '../../utils/colors.dart';
import '../../utils/strings.dart';
import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;
import '../widgets/common_app_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_password_small_form_field.dart';

// OtpScreen
class OtpScreen extends StatelessWidget {
  final String? mobileNo;
  final String? countryCode;

  OtpScreen({super.key, this.mobileNo, this.countryCode});

  final OTPController controller = Get.put(OTPController());
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ModalProgressHUD(
        inAsyncCall: controller.showSpinner.value,
        child: Scaffold(
          appBar: CommonAppBar(title: enterOTP),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: controller.otpFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      textAlign: TextAlign.center,
                      pleaseEnterTheVerificationCodeSentToYourMobile,
                      style: themeController.isDarkMode.value
                          ? dark.bodyXLargeRegular900
                          : light.bodyXLargeRegular900,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomSmallPasswordFormField(
                        textEditingController: controller.otpCode1Controller,
                        isObscure: false,
                        backGroundColor: themeController.isDarkMode.value
                            ? controller.backDarkColor1.value
                            : controller.backColor1.value,
                        onTap: () {
                          if (themeController.isDarkMode.value) {
                            controller.changeBackDarkColor(primary4Color, 1);
                          } else {
                            controller.changeBackColor(primary4Color, 1);
                          }
                        },
                      ),
                      CustomSmallPasswordFormField(
                        textEditingController: controller.otpCode2Controller,
                        isObscure: false,
                        backGroundColor: themeController.isDarkMode.value
                            ? controller.backDarkColor2.value
                            : controller.backColor2.value,
                        onTap: () {
                          if (themeController.isDarkMode.value) {
                            controller.changeBackDarkColor(primary4Color, 2);
                          } else {
                            controller.changeBackColor(primary4Color, 2);
                          }
                        },
                      ),
                      CustomSmallPasswordFormField(
                        textEditingController: controller.otpCode3Controller,
                        isObscure: false,
                        backGroundColor: themeController.isDarkMode.value
                            ? controller.backDarkColor3.value
                            : controller.backColor3.value,
                        onTap: () {
                          if (themeController.isDarkMode.value) {
                            controller.changeBackDarkColor(primary4Color, 3);
                          } else {
                            controller.changeBackColor(primary4Color, 3);
                          }
                        },
                      ),
                      CustomSmallPasswordFormField(
                        textEditingController: controller.otpCode4Controller,
                        isObscure: false,
                        backGroundColor: themeController.isDarkMode.value
                            ? controller.backDarkColor4.value
                            : controller.backColor4.value,
                        onTap: () {
                          if (themeController.isDarkMode.value) {
                            controller.changeBackDarkColor(primary4Color, 4);
                          } else {
                            controller.changeBackColor(primary4Color, 4);
                          }
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    width: Get.width,
                    child: CustomButton(
                      bgColor: primaryColor,
                      buttonText: continueText,
                      textColor: whiteColor,
                      cornerRadius: 100.0,
                      onPress: () {
                        if (controller.otpFormKey.currentState!.validate()) {
                          controller.code =
                              '${controller.otpCode1Controller.text.toString()}${controller.otpCode2Controller.text.toString()}${controller.otpCode3Controller.text.toString()}${controller.otpCode4Controller.text.toString()}';
                          controller.mobileVerification(
                            mobileNo!,
                            countryCode!,
                            controller.code,
                          );
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
