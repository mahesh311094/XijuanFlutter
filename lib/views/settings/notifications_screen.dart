import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/settings/notifications_controller.dart';
import '../../controller/theme_controller.dart';
import '../../utils/strings.dart';
import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;
import '../widgets/common_app_bar.dart';
import '../widgets/toggle_switch.dart';

// NotificationsScreen
class NotificationsScreen extends StatelessWidget {
  NotificationsScreen({super.key});

  final NotificationsController controller = Get.put(NotificationsController());
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: notifications),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        showMessagesPreviews,
                        style: themeController.isDarkMode.value
                            ? dark.bodyXLargeSemiBold900
                            : light.bodyXLargeSemiBold900,
                      ),
                    ),
                    ToggleSwitch(
                        flag: controller.isShowMsg.value,
                        onChanged: (p0) {
                          controller.onShowMsgValueChange(p0);
                        }),
                  ],
                ),
                const SizedBox(height: 18.0),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        newMessage,
                        style: themeController.isDarkMode.value
                            ? dark.bodyXLargeSemiBold900
                            : light.bodyXLargeSemiBold900,
                      ),
                    ),
                    ToggleSwitch(
                        flag: controller.isNewMsg.value,
                        onChanged: (p0) {
                          controller.onNewMsgValueChange(p0);
                        }),
                  ],
                ),
                const SizedBox(height: 18.0),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        newMatch,
                        style: themeController.isDarkMode.value
                            ? dark.bodyXLargeSemiBold900
                            : light.bodyXLargeSemiBold900,
                      ),
                    ),
                    ToggleSwitch(
                        flag: controller.isNewMatch.value,
                        onChanged: (p0) {
                          controller.onNewMatchValueChange(p0);
                        }),
                  ],
                ),
                const SizedBox(height: 28.0),
                Text(
                  matchAroundMe,
                  style: themeController.isDarkMode.value
                      ? dark.bodyXLargeSemiBold900
                      : light.bodyXLargeSemiBold900,
                ),
                const SizedBox(height: 28.0),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        youGotLikes,
                        style: themeController.isDarkMode.value
                            ? dark.bodyXLargeSemiBold900
                            : light.bodyXLargeSemiBold900,
                      ),
                    ),
                    ToggleSwitch(
                        flag: controller.isYouGotLikes.value,
                        onChanged: (p0) {
                          controller.onYouGotLikesValueChange(p0);
                        }),
                  ],
                ),
                const SizedBox(height: 18.0),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        subscription,
                        style: themeController.isDarkMode.value
                            ? dark.bodyXLargeSemiBold900
                            : light.bodyXLargeSemiBold900,
                      ),
                    ),
                    ToggleSwitch(
                        flag: controller.isSubscription.value,
                        onChanged: (p0) {
                          controller.onSubscriptionValueChange(p0);
                        }),
                  ],
                ),
                const SizedBox(height: 28.0),
                Text(
                  sound,
                  style: themeController.isDarkMode.value
                      ? dark.bodyXLargeSemiBold900
                      : light.bodyXLargeSemiBold900,
                ),
                const SizedBox(height: 32.0),
                Text(
                  vibrate,
                  style: themeController.isDarkMode.value
                      ? dark.bodyXLargeSemiBold900
                      : light.bodyXLargeSemiBold900,
                ),
                const SizedBox(height: 28.0),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        newUpdates,
                        style: themeController.isDarkMode.value
                            ? dark.bodyXLargeSemiBold900
                            : light.bodyXLargeSemiBold900,
                      ),
                    ),
                    ToggleSwitch(
                        flag: controller.isNewUpdates.value,
                        onChanged: (p0) {
                          controller.onNewUpdatesValueChange(p0);
                        }),
                  ],
                ),
                const SizedBox(height: 28.0),
                Text(
                  vIPStatus,
                  style: themeController.isDarkMode.value
                      ? dark.bodyXLargeSemiBold900
                      : light.bodyXLargeSemiBold900,
                ),
                const SizedBox(height: 32.0),
                Text(
                  newServices,
                  style: themeController.isDarkMode.value
                      ? dark.bodyXLargeSemiBold900
                      : light.bodyXLargeSemiBold900,
                ),
                const SizedBox(height: 28.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
