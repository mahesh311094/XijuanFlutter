import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../controller/on_boarding/sign_in_controller.dart';
import '../../controller/theme_controller.dart';
import '../../utils/colors.dart';
import '../../utils/strings.dart';
import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;
import '../forgot_password/forgot_password_screen1.dart';
import '../widgets/common_app_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_checkbox.dart';
import '../widgets/custom_password_form_field.dart';
import '../widgets/custom_text_form_field.dart';
import '../widgets/social_button.dart';
import 'signup_screen.dart';

// SignInScreen
class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final SignInController controller = Get.put(SignInController());
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ModalProgressHUD(
        inAsyncCall: controller.showSpinner.value,
        child: Scaffold(
          appBar: CommonAppBar(title: ''),
          body: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
              child: Form(
                key: controller.signInKey,
                child: Column(
                  children: [
                    SvgPicture.asset(
                      themeController.isDarkMode.value
                          ? 'assets/images/light_logo.svg'
                          : 'assets/images/logo.svg',
                      width: Get.width / 1.8,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 22.0),
                    Text(
                      loginToYourAccount,
                      style: themeController.isDarkMode.value
                          ? dark.heading4
                          : light.heading4,
                    ),
                    const SizedBox(height: 22.0),
                    CustomTextFormField(
                      textEditingController: controller.emailController,
                      validator: MultiValidator([
                        RequiredValidator(errorText: emailRequired),
                        EmailValidator(errorText: invalidEmail),
                        MinLengthValidator(10, errorText: minimumEmailRequired),
                      ]),
                      prefixIconPath: 'assets/icons/message.svg',
                      hintText: email,
                      iconColor: controller.iconColor.value,
                      backGroundColor: themeController.isDarkMode.value
                          ? controller.backDarkColor.value
                          : controller.backColor.value,
                      onTap: () {
                        if (themeController.isDarkMode.value) {
                          controller.changeBackDarkColor(primary4Color, 1);
                        } else {
                          controller.changeBackColor(primary4Color, 1);
                        }
                        controller.changeIconColor(primaryColor, 1);
                      },
                    ),
                    const SizedBox(height: 14.0),
                    CustomPasswordFormField(
                      textEditingController: controller.passwordController,
                      validator: MultiValidator([
                        RequiredValidator(errorText: passwordRequired),
                        MinLengthValidator(6,
                            errorText: minimumPasswordRequired),
                      ]),
                      iconPath: 'assets/icons/lock.svg',
                      text: password,
                      prefixIconShow: true,
                      suffixIconShow: true,
                      iconColor: controller.iconColor2.value,
                      backGroundColor: themeController.isDarkMode.value
                          ? controller.backDarkColor2.value
                          : controller.backColor2.value,
                      isObscure: controller.isObscure.value,
                      onTap: () {
                        if (themeController.isDarkMode.value) {
                          controller.changeBackDarkColor(primary4Color, 2);
                        } else {
                          controller.changeBackColor(primary4Color, 2);
                        }
                        controller.changeIconColor(primaryColor, 2);
                      },
                      onVisibility: () {
                        controller
                            .onChangeVisibility(controller.isObscure.value);
                      },
                    ),
                    const SizedBox(height: 14.0),
                    CustomCheckbox(
                      value: controller.selectedCheckbox.value,
                      label: rememberMe,
                      onChanged: (value) {
                        if (controller.signInKey.currentState!.validate()) {
                          controller.onCheckboxValueChange(
                            value,
                            controller.emailController.text.toString(),
                            controller.passwordController.text.toString(),
                          );
                        }
                      },
                      flag: true,
                    ),
                    const SizedBox(height: 14.0),
                    SizedBox(
                      width: Get.width,
                      child: CustomButton(
                        bgColor: controller.selectedCheckbox.value
                            ? primaryColor
                            : disabledButtonColor,
                        buttonText: signIn,
                        textColor: whiteColor,
                        cornerRadius: 100.0,
                        onPress: () {
                          if (controller.signInKey.currentState!.validate()) {
                            controller.logInUserWithEmail(
                              controller.emailController.text.toString().trim(),
                              controller.passwordController.text.toString(),
                            );
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 22.0),
                    GestureDetector(
                      onTap: () {
                        Get.to(ForgotPasswordScreen1());
                      },
                      child: Text(
                        forgotThePassword,
                        style: themeController.isDarkMode.value
                            ? dark.bodyLargeSemiBoldPrimary
                            : light.bodyLargeSemiBoldPrimary,
                      ),
                    ),
                    const SizedBox(height: 22.0),
                    Row(
                      children: [
                        const Expanded(
                          child: Divider(
                            color: greyScale200Color,
                            thickness: 1.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            orContinueWith,
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
                    const SizedBox(height: 22.0),
                    SocialButton(),
                    const SizedBox(height: 18.0),
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
      ),
    );
  }
}
