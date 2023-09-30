import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../controller/theme_controller.dart';
import '../../utils/colors.dart';
import '../../utils/strings.dart';
import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;
import '../../utils/utils.dart';
import '../on_boarding/signup_as_screen.dart';
import 'custom_button.dart';

// This widget for Logout sheet modal
class LogoutSheetModal extends StatelessWidget {
  LogoutSheetModal({super.key});

  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: 240.0,
        decoration: BoxDecoration(
          color:
              themeController.isDarkMode.value ? dark2Color : greyScale100Color,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
                child: Center(
                  child: SvgPicture.asset('assets/icons/divider.svg'),
                ),
              ),
              Center(
                child: Text(
                  logout,
                  textAlign: TextAlign.center,
                  style: themeController.isDarkMode.value
                      ? dark.heading4Error
                      : light.heading4Error,
                ),
              ),
              const SizedBox(height: 24.0),
              Text(
                logoutText,
                textAlign: TextAlign.start,
                style: themeController.isDarkMode.value
                    ? dark.heading5
                    : light.heading5,
              ),
              const SizedBox(height: 24.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: Get.width / 2.3,
                    child: CustomButton(
                      buttonText: cancel,
                      cornerRadius: 100.0,
                      textColor: primaryColor,
                      bgColor: primary4Color,
                      onPress: () {
                        Get.back();
                      },
                    ),
                  ),
                  const SizedBox(width: 12.0),
                  SizedBox(
                    width: Get.width / 2.3,
                    child: CustomButton(
                      buttonText: yesLogout,
                      cornerRadius: 100.0,
                      textColor: whiteColor,
                      bgColor: primaryColor,
                      onPress: () {
                        clearSharedPrefOnLogout();
                        Get.offAll(SignupAs());
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
