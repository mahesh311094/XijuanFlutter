import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../controller/on_boarding/sign_up_as_controller.dart';
import '../../controller/theme_controller.dart';
import '../../utils/colors.dart';
import '../../utils/strings.dart';
import '../widgets/common_app_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/sign_in_button.dart';
import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;
import 'sign_in_mobile_screen.dart';
import 'sign_in_screen.dart';
import 'signup_screen.dart';

// SignupAs
class SignupAs extends StatelessWidget {
  SignupAs({super.key});

  final bool isControllerRegistered = Get.isRegistered<SignUpAsController>();
  final ThemeController themeController = Get.find();
  final SignUpAsController controller = Get.put(SignUpAsController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ModalProgressHUD(
        inAsyncCall: controller.showSpinner.value,
        child: Scaffold(
          appBar: CommonAppBar(title: ''),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SvgPicture.asset(
                    themeController.isDarkMode.value
                        ? 'assets/images/light_logo.svg'
                        : 'assets/images/logo.svg',
                    width: Get.width / 1.4,
                  ),
                  const SizedBox(height: 30.0),
                  Text(
                    signupAs,
                    textAlign: TextAlign.center,
                    style: themeController.isDarkMode.value
                        ? dark.heading4
                        : light.heading4,
                  ),
                  const SizedBox(height: 30.0),
                  SignInButton(
                    imagePath: 'assets/icons/facebook.svg',
                    bgColor: whiteColor,
                    text: continueWithFacebook,
                    onPress: () {
                      if (!isControllerRegistered) {
                        Get.put<SignUpAsController>(SignUpAsController());
                      }
                      controller.facebookLogin();
                    },
                    showIcon: true,
                  ),
                  const SizedBox(height: 14.0),
                  SignInButton(
                    imagePath: 'assets/icons/google.svg',
                    text: continueWithGoogle,
                    bgColor: whiteColor,
                    onPress: () {
                      if (!isControllerRegistered) {
                        Get.put<SignUpAsController>(SignUpAsController());
                      }
                      controller.googleLogin();
                    },
                    showIcon: true,
                  ),
                  const SizedBox(height: 14.0),
                  SignInButton(
                    imagePath: 'assets/icons/apple.svg',
                    text: continueWithApple,
                    bgColor: whiteColor,
                    onPress: () {
                      if (!isControllerRegistered) {
                        Get.put<SignUpAsController>(SignUpAsController());
                      }
                      controller.appleLogin();
                    },
                    showIcon: true,
                  ),
                  const SizedBox(height: 18.0),
                  Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          color: greyScale200Color,
                          thickness: 1.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          or,
                          style: themeController.isDarkMode.value
                              ? dark.bodyXLargeSemiBold700
                              : light.bodyXLargeSemiBold700,
                        ),
                      ),
                      const Expanded(
                        child: Divider(
                          color: greyScale200Color,
                          thickness: 1.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14.0),
                  SignInButton(
                    imagePath: '',
                    bgColor: whiteColor,
                    text: signInWithMobile,
                    onPress: () async {
                      if (!isControllerRegistered) {
                        Get.put<SignUpAsController>(SignUpAsController());
                      }
                      Get.to(SignInMobile());
                    },
                    showIcon: false,
                  ),
                  const SizedBox(height: 16.0),
                  CustomButton(
                    bgColor: primaryColor,
                    buttonText: signInWithPassword,
                    textColor: whiteColor,
                    cornerRadius: 100.0,
                    onPress: () {
                      if (!isControllerRegistered) {
                        Get.put<SignUpAsController>(SignUpAsController());
                      }
                      Get.to(SignInScreen());
                    },
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        doNotHaveAccount,
                        style: themeController.isDarkMode.value
                            ? dark.bodyMediumRegular500
                            : light.bodyMediumRegular500,
                      ),
                      TextButton(
                        onPressed: () {
                          if (!isControllerRegistered) {
                            Get.put<SignUpAsController>(SignUpAsController());
                          }
                          Get.to(SignUpScreen());
                        },
                        child: Text(
                          signUp,
                          style: themeController.isDarkMode.value
                              ? dark.bodyMediumSemiBoldPrimary
                              : light.bodyMediumSemiBoldPrimary,
                        ),
                      ),
                    ],
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
