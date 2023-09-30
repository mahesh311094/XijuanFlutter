import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import '../../controller/account_setup/contact_controller.dart';
import '../../controller/theme_controller.dart';
import '../../utils/colors.dart';
import '../../utils/strings.dart';
import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;
import '../widgets/common_app_bar.dart';
import '../widgets/image_load.dart';
import 'height_screen.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_form_field.dart';
import 'select_country_screen.dart';

// Fill Contact Screen
class ContactScreen extends StatelessWidget {
  ContactScreen({super.key});

  final ContactController controller = Get.put(ContactController());
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: CommonAppBar(title: fillYourProfile),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: controller.contactKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      CustomTextFormField(
                        textEditingController: controller.emailController,
                        validator: MultiValidator([
                          EmailValidator(errorText: invalidEmail),
                        ]),
                        hintText: email,
                        suffixIconPath: 'assets/icons/curved_msg.svg',
                        backGroundColor: themeController.isDarkMode.value
                            ? controller.emailBackDarkColor.value
                            : controller.emailBackColor.value,
                        iconColor: controller.emailIconColor.value,
                        onTap: () {
                          if (themeController.isDarkMode.value) {
                            controller.changeEmailBackDarkColor(primary4Color);
                          } else {
                            controller.changeEmailBackColor(primary4Color);
                          }
                          controller.changeEmailIconColor(primaryColor);
                        },
                      ),
                      const SizedBox(height: 20.0),
                      SizedBox(
                        width: Get.width,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 1,
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(SelectCountryScreen(page: "Contact"));
                                },
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
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 14.0, horizontal: 10.0),
                                    child: Row(
                                      children: [
                                        ImageLoad(
                                          imagePath: controller
                                              .accountSetupController
                                              .selectedCountryImage
                                              .value,
                                        ),
                                        const SizedBox(width: 10.0),
                                        SvgPicture.asset(
                                          'assets/icons/down.svg',
                                          width: 8.0,
                                          height: 8.0,
                                          colorFilter: ColorFilter.mode(
                                            themeController.isDarkMode.value
                                                ? whiteColor
                                                : greyScale500Color,
                                            BlendMode.srcIn,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // child: CountryListPick(
                                  //   theme: CountryTheme(
                                  //     isShowCode: false,
                                  //     isDownIcon: true,
                                  //     isShowFlag: true,
                                  //     isShowTitle: false,
                                  //   ),
                                  //   initialSelection:
                                  //       controller.selectedCountryCode.value,
                                  //   onChanged: (value) {
                                  //     controller.onCountryCodeValueChange(
                                  //         value.toString());
                                  //   },
                                  // ),
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
                                    MinLengthValidator(9,
                                        errorText: minimumMobileDigitsRequired),
                                  ]),
                                  maxLength: 15,
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
                                    counterText: "",
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 22.0,
                                    ),
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
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20.0),
                  child: CustomButton(
                    bgColor: primaryColor,
                    buttonText: continueText,
                    textColor: whiteColor,
                    cornerRadius: 100.0,
                    onPress: () {
                      if (controller.contactKey.currentState!.validate()) {
                        controller.accountSetupController
                                .userProfileMap['email'] =
                            controller.emailController.text.toString();
                        controller.accountSetupController
                                .userProfileMap['country_cell_code'] =
                            controller.selectedCountryCode.value.toString();
                        controller.accountSetupController
                                .userProfileMap['mobile'] =
                            controller.mobileController.text.toString();

                        Get.to(HeightScreen());
                      }
                    },
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controller.accountSetupController.userProfileMap['email'] =
                        controller.emailController.text.toString();
                    controller.accountSetupController
                            .userProfileMap['country_cell_code'] =
                        // controller.selectedCountryCode.value.toString();
                        controller
                            .accountSetupController.selectedCountryCode.value
                            .toString();
                    controller.accountSetupController.userProfileMap['mobile'] =
                        controller.mobileController.text.toString();

                    Get.to(HeightScreen());
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
