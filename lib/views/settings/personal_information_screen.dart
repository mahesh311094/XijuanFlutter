import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../utils/strings.dart';
import '../../controller/profile/personal_information_controller.dart';
import '../../controller/theme_controller.dart';
import '../../utils/colors.dart';
import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;
import '../widgets/background_box.dart';
import '../widgets/common_app_bar.dart';
import '../widgets/custom_date_picker.dart';
import '../widgets/custom_drop_down.dart';
import '../widgets/custom_text_form_field.dart';

// Personal Information Screen
class PersonalInformationScreen extends StatelessWidget {
  PersonalInformationScreen({super.key});

  final PersonalInformationController controller =
      Get.put(PersonalInformationController());
  final ThemeController themeController = Get.find();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: personalInformation),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomTextFormField(
                  textEditingController: firstNameController,
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
                  textEditingController: lastNameController,
                  hintText: lastName,
                  backGroundColor: themeController.isDarkMode.value
                      ? controller.lNameBackDarkColor.value
                      : controller.lNameBackColor.value,
                  onTap: () {
                    if (themeController.isDarkMode.value) {
                      controller.changeLNameBackDarkColor(primary4Color);
                    } else {
                      controller.changeLNameBackColor(primary4Color);
                    }
                  },
                ),
                const SizedBox(height: 20.0),
                CustomDropdown(
                  items: controller.dropdownItems,
                  selectedValue: controller.selectedValue.value,
                  onChanged: (value) {
                    controller.onSelectedValueChange(value);
                  },
                ),
                const SizedBox(height: 20.0),
                BackgroundBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: DatePicker(),
                  ),
                ),
                const SizedBox(height: 20.0),
                CustomTextFormField(
                  textEditingController: emailController,
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
                              controller.onSelectedCountryChange(
                                value.toString(),
                              );
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: SizedBox(
                          height: 58.0,
                          child: TextFormField(
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
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 22.0),
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
                                controller.backDarkColor.value = primary4Color;
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
