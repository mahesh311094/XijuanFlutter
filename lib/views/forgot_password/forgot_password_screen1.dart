import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../controller/forgot_password/forgot_password1_controller.dart';
import '../../controller/theme_controller.dart';
import '../../utils/colors.dart';
import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;
import '../../utils/strings.dart';
import '../widgets/common_app_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_form_field.dart';

// ForgotPasswordScreen1
class ForgotPasswordScreen1 extends StatelessWidget {
  ForgotPasswordScreen1({super.key});

  final ForgotPassword1Controller controller =
      Get.put(ForgotPassword1Controller());
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ModalProgressHUD(
        inAsyncCall: controller.showSpinner.value,
        child: Scaffold(
          appBar: CommonAppBar(title: forgotPassword),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: controller.forgotPasswordKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SvgPicture.asset(
                      'assets/images/forgot_password.svg',
                      height: 212.0,
                    ),
                    const SizedBox(height: 32.0),
                    Text(
                      forgotPasswordText,
                      style: themeController.isDarkMode.value
                          ? dark.bodyXLargeMedium900
                          : light.bodyXLargeMedium900,
                    ),
                    const SizedBox(height: 16.0),
                    GestureDetector(
                      onTap: () {
                        controller.onSMSValueChange();
                        controller.emailController.clear();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: themeController.isDarkMode.value
                              ? dark2Color
                              : whiteColor,
                          border: controller.smsSelected.value
                              ? Border.all(color: primaryColor, width: 3.0)
                              : Border.all(
                                  color: greyScale200Color, width: 1.0),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(36.0),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: primary4Color,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(24.0),
                                child: SvgPicture.asset(
                                  'assets/icons/chat_bold.svg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 15.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  viaSMS,
                                  style: themeController.isDarkMode.value
                                      ? dark.bodyMediumMedium600
                                      : light.bodyMediumMedium600,
                                ),
                                const SizedBox(height: 6.0),
                                SizedBox(
                                  width: Get.width / 1.75,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          height: 58.0,
                                          decoration: BoxDecoration(
                                            color: themeController
                                                    .isDarkMode.value
                                                ? controller.backDarkColor.value
                                                : controller.backColor.value,
                                            borderRadius:
                                                const BorderRadius.only(
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
                                            initialSelection: controller
                                                .selectedCountryCode.value,
                                            onChanged: (value) {
                                              controller
                                                  .onCountryCodeValueChange(
                                                      value.toString());
                                            },
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: SizedBox(
                                          height: 58.0,
                                          child: TextFormField(
                                            controller:
                                                controller.mobileController,
                                            validator: MultiValidator([
                                              MinLengthValidator(
                                                9,
                                                errorText:
                                                    minimumMobileDigitsRequired,
                                              ),
                                            ]),
                                            maxLength: 15,
                                            keyboardType: TextInputType.number,
                                            inputFormatters: <
                                                TextInputFormatter>[
                                              FilteringTextInputFormatter.allow(
                                                RegExp(r'[0-9]'),
                                              ),
                                            ],
                                            style:
                                                themeController.isDarkMode.value
                                                    ? dark.customFont6
                                                    : light.customFont6,
                                            decoration: InputDecoration(
                                              counterText: "",
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                vertical: 22.0,
                                              ),
                                              hintText: phoneNumber,
                                              hintStyle: themeController
                                                      .isDarkMode.value
                                                  ? dark.customFont5
                                                  : light.customFont5,
                                              border: const OutlineInputBorder(
                                                borderRadius: BorderRadius.only(
                                                  topRight:
                                                      Radius.circular(16.0),
                                                  bottomRight:
                                                      Radius.circular(16.0),
                                                ),
                                              ),
                                              focusedBorder:
                                                  const OutlineInputBorder(
                                                borderRadius: BorderRadius.only(
                                                  topRight:
                                                      Radius.circular(16.0),
                                                  bottomRight:
                                                      Radius.circular(16.0),
                                                ),
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                ),
                                              ),
                                              enabledBorder:
                                                  const OutlineInputBorder(
                                                borderRadius: BorderRadius.only(
                                                  topRight:
                                                      Radius.circular(16.0),
                                                  bottomRight:
                                                      Radius.circular(16.0),
                                                ),
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                ),
                                              ),
                                              filled: true,
                                              fillColor: themeController
                                                      .isDarkMode.value
                                                  ? controller
                                                      .backDarkColor.value
                                                  : controller.backColor.value,
                                            ),
                                            onTap: () {
                                              if (themeController
                                                  .isDarkMode.value) {
                                                controller.backDarkColor.value =
                                                    primary4Color;
                                              } else {
                                                controller.backColor.value =
                                                    primary4Color;
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    GestureDetector(
                      onTap: () {
                        controller.onEmailValueChange();
                        controller.mobileController.clear();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: themeController.isDarkMode.value
                              ? dark2Color
                              : whiteColor,
                          border: controller.emailSelected.value
                              ? Border.all(color: primaryColor, width: 3.0)
                              : Border.all(
                                  color: greyScale200Color, width: 1.0),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(36.0),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: primary4Color,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(24.0),
                                child: SvgPicture.asset(
                                  'assets/icons/message.svg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 15.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  viaEmail,
                                  style: themeController.isDarkMode.value
                                      ? dark.bodyMediumMedium600
                                      : light.bodyMediumMedium600,
                                ),
                                const SizedBox(height: 6.0),
                                SizedBox(
                                  width: Get.width / 1.75,
                                  child: CustomTextFormField(
                                    textEditingController:
                                        controller.emailController,
                                    validator: MultiValidator([
                                      EmailValidator(errorText: invalidEmail),
                                    ]),
                                    hintText: email,
                                    suffixIconPath:
                                        'assets/icons/curved_msg.svg',
                                    backGroundColor: themeController
                                            .isDarkMode.value
                                        ? controller.emailBackDarkColor.value
                                        : controller.emailBackColor.value,
                                    iconColor: controller.emailIconColor.value,
                                    onTap: () {
                                      if (themeController.isDarkMode.value) {
                                        controller.changeEmailBackDarkColor(
                                            primary4Color);
                                      } else {
                                        controller.changeEmailBackColor(
                                            primary4Color);
                                      }
                                      controller
                                          .changeEmailIconColor(primaryColor);
                                    },
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 28.0),
                    SizedBox(
                      width: Get.width,
                      child: CustomButton(
                        buttonText: continueText,
                        cornerRadius: 100.0,
                        textColor: whiteColor,
                        bgColor: primaryColor,
                        onPress: () {
                          if (controller.emailController.text.toString() !=
                              "") {
                            controller.forgetPassword(
                                email:
                                    controller.emailController.text.toString());
                          } else if (controller.mobileController.text
                                  .toString() !=
                              "") {
                            controller.forgetPassword(
                                mobile:
                                    controller.mobileController.text.toString(),
                                countryCode:
                                    controller.selectedCountryCode.value);
                          } else {
                            Fluttertoast.showToast(
                                msg: pleaseEnterYourMobileOrEmail);
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
        ),
      ),
    );
  }
}
