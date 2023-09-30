import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../controller/account_setup/per_notification_controller.dart';
import '../../controller/theme_controller.dart';
import '../../utils/colors.dart';
import '../../utils/strings.dart';
import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;
import '../widgets/common_app_bar.dart';
import '../widgets/custom_button.dart';

// Permission Notifications Screen
class PermissionNotificationsScreen extends StatelessWidget {
  final bool isFirstTimeLogin;

  PermissionNotificationsScreen({super.key, required this.isFirstTimeLogin});

  final PerNotificationController controller =
      Get.put(PerNotificationController());
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: CommonAppBar(title: notifications),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/images/notification.svg',
                      width: Get.width / 1.8,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 48.0),
                    Text(
                      allowNotifications,
                      style: themeController.isDarkMode.value
                          ? dark.heading3small
                          : light.heading3small,
                    ),
                    const SizedBox(height: 48.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        byEnablingNotificationsYouWillGetRealTimeUpdates,
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
                  buttonText: enable,
                  textColor: whiteColor,
                  cornerRadius: 100.0,
                  onPress: () async {
                    controller.checkNotificationPermissions();
                    controller.openNextScreen(isFirstTimeLogin);
                  },
                ),
              ),
              const SizedBox(height: 20.0),
              GestureDetector(
                onTap: () async {
                  // controller.checkNotificationPermissions();
                  controller.openNextScreen(isFirstTimeLogin);
                },
                child: Text(
                  notNow,
                  style: themeController.isDarkMode.value
                      ? dark.customFont
                      : light.customFont,
                ),
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
