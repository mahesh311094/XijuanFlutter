import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../controller/theme_controller.dart';
import '../../utils/colors.dart';
import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;
import '../../utils/utils.dart';
import '../../utils/strings.dart';
import '../profile/photo_verification_screen_1.dart';
import 'custom_button.dart';

// This widget for Custom Dialog
Future customDialog({
  required String mainImage,
  required String title,
  required String content,
  required String buttonText,
  Widget? screen,
  String? isFrom,
  bool? openDialog,
}) {
  final ThemeController themeController = Get.find();

  return Get.dialog(
    Obx(
      () => Dialog(
        backgroundColor:
            themeController.isDarkMode.value ? dark2Color : whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 28.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(48.0),
            color: themeController.isDarkMode.value ? dark2Color : whiteColor,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                mainImage,
                height: isFrom == "Profile Screen" ? 72.0 : 150.0,
                width: isFrom == "Profile Screen" ? 72.0 : 150.0,
              ),
              const SizedBox(height: 20.0),
              Text(title,
                  style: isFrom == "Profile Screen"
                      ? themeController.isDarkMode.value
                          ? dark.heading4
                          : light.heading4
                      : themeController.isDarkMode.value
                          ? dark.heading4Primary
                          : light.heading4Primary),
              const SizedBox(height: 16.0),
              Text(
                content,
                textAlign: TextAlign.center,
                style: themeController.isDarkMode.value
                    ? dark.bodyLargeRegular900
                    : light.bodyLargeRegular900,
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                width: Get.width,
                child: CustomButton(
                  buttonText: buttonText,
                  cornerRadius: 100,
                  textColor: whiteColor,
                  bgColor: primaryColor,
                  onPress: () {
                    if (openDialog ?? false) {
                      customDialog(
                        mainImage: 'assets/icons/premium.svg',
                        title: howItWorks,
                        content: howItWorksText2,
                        buttonText: verifyMe,
                        isFrom: 'Profile Screen',
                        screen: const PhotoVerificationScreen1(),
                      );
                    } else {
                      Get.to(screen);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  ).then(
    (value) => changeStatusBarColor(themeController.isDarkMode.value),
  );
}
