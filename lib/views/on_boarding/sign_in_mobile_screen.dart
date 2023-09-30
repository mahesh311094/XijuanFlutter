import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../controller/on_boarding/sign_in_mobile_controller.dart';
import '../../controller/theme_controller.dart';
import '../../utils/colors.dart';
import '../../utils/strings.dart';
import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;
import '../widgets/common_app_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/social_button.dart';
import 'signup_screen.dart';

// SignInMobile
class SignInMobile extends StatelessWidget {
  SignInMobile({super.key});

  final SignInMobileController controller = Get.put(SignInMobileController());
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
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: controller.signInMobileKey,
                child: Column(
                  children: [
                    SvgPicture.asset(
                      themeController.isDarkMode.value
                          ? 'assets/images/light_logo.svg'
                          : 'assets/images/logo.svg',
                      width: Get.width / 1.8,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 30.0),
                    Text(
                      loginToMobile,
                      style: themeController.isDarkMode.value
                          ? dark.heading4
                          : light.heading4,
                    ),
                    const SizedBox(height: 50.0),
                    SizedBox(
                      width: Get.width,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 58.0,
                              decoration: BoxDecoration(
                                color: themeController.isDarkMode.value
                                    ? controller.backDarkColor.value
                                    : controller.backColor.value,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(16.0),
                                  bottomLeft: Radius.circular(16.0),
                                ),
                              ),
                              child: CountryListPick(
                                theme: CountryTheme(
                                  isShowCode: false,
                                  isDownIcon: true,
                                  isShowFlag: true,
                                  isShowTitle: false,
                                ),
                                initialSelection:
                                    controller.selectedCountryCode.value,
                                onChanged: (value) {
                                  controller.onCountryCodeValueChange(
                                      value.toString());
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: SizedBox(
                              height: 58.0,
                              child: TextFormField(
                                controller: controller.mobileController,
                                validator: MultiValidator([
                                  RequiredValidator(
                                      errorText: phoneNumberRequired),
                                ]),
                                obscureText: false,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9]'),
                                  ),
                                ],
                                style: themeController.isDarkMode.value
                                    ? dark.customFont6
                                    : light.customFont6,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 22.0),
                                  hintText: phoneNumber,
                                  hintStyle: themeController.isDarkMode.value
                                      ? dark.customFont5
                                      : light.customFont5,
                                  border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(16.0),
                                      bottomRight: Radius.circular(16.0),
                                    ),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(16.0),
                                      bottomRight: Radius.circular(16.0),
                                    ),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(16.0),
                                      bottomRight: Radius.circular(16.0),
                                    ),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: themeController.isDarkMode.value
                                      ? controller.backDarkColor.value
                                      : controller.backColor.value,
                                ),
                                onTap: () {
                                  if (themeController.isDarkMode.value) {
                                    controller.backDarkColor.value =
                                        primary4Color;
                                  } else {
                                    controller.backColor.value = primary4Color;
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50.0),
                    SizedBox(
                      width: Get.width,
                      child: CustomButton(
                        bgColor: primaryColor,
                        buttonText: signIn,
                        textColor: whiteColor,
                        cornerRadius: 100.0,
                        onPress: () {
                          if (controller.signInMobileKey.currentState!
                              .validate()) {
                            controller.logInUserWithMobile(
                              controller.mobileController.text.toString(),
                              controller.selectedCountryCode.value,
                            );
                          }
                        },
                        //Get.to(MainScreen());
                      ),
                    ),
                    const SizedBox(height: 50.0),
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
                    const SizedBox(height: 30.0),
                    SocialButton(),
                    const SizedBox(height: 42.0),
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
