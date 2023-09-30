import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../controller/account_setup/account_setup_controller.dart';
import '../../controller/theme_controller.dart';
import '../../utils/colors.dart';
import '../../utils/strings.dart';
import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;
import '../widgets/common_app_bar.dart';
import '../widgets/custom_button.dart';
import 'select_country_screen.dart';

// PrivacyScreen
class PrivacyScreen extends StatelessWidget {
  PrivacyScreen({super.key});

  final ThemeController themeController = Get.find();
  final bool isControllerRegistered =
      Get.isRegistered<AccountSetupController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: privacy),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/images/privacy.svg',
                      width: Get.width / 2.2,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 40.0),
                    Text(
                      weCareAboutYourPrivacy,
                      textAlign: TextAlign.center,
                      style: themeController.isDarkMode.value
                          ? dark.heading3small
                          : light.heading3small,
                    ),
                    const SizedBox(height: 40.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        privacyMessage,
                        textAlign: TextAlign.center,
                        style: themeController.isDarkMode.value
                            ? dark.bodyXLargeRegular900
                            : light.bodyXLargeRegular900,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: Get.width,
                child: CustomButton(
                  bgColor: primaryColor,
                  buttonText: accept,
                  textColor: whiteColor,
                  cornerRadius: 100.0,
                  onPress: () {
                    if (!isControllerRegistered) {
                      Get.put<AccountSetupController>(AccountSetupController());
                    }
                    Get.to(SelectCountryScreen());
                  },
                ),
              ),
              const SizedBox(height: 64.0),
            ],
          ),
        ),
      ),
    );
  }
}
