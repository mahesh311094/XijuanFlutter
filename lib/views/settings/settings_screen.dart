import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../controller/theme_controller.dart';
import '../../utils/colors.dart';
import '../../utils/strings.dart';
import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;
import '../widgets/gradient_circle_avatar.dart';
import 'change_password_screen.dart';
import 'discovery_settings_screen.dart';
import 'language_screen.dart';
import 'notifications_screen.dart';
import 'personal_information_screen.dart';
import '../widgets/common_app_bar.dart';

// SettingsScreen
class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: settings),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(
            () => Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(PersonalInformationScreen());
                  },
                  child: Row(
                    children: [
                      GradientCircleAvatar(
                        linearGradient: purpleGradient,
                        child: SvgPicture.asset(
                          'assets/icons/profile_bold.svg',
                          colorFilter: const ColorFilter.mode(
                            whiteColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      const SizedBox(width: 24.0),
                      Expanded(
                        child: Text(
                          personalInformation,
                          style: themeController.isDarkMode.value
                              ? dark.bodyXLargeSemiBold900
                              : light.bodyXLargeSemiBold900,
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/icons/arrow_right.svg',
                        colorFilter: ColorFilter.mode(
                          themeController.isDarkMode.value
                              ? whiteColor
                              : greyScale900Color,
                          BlendMode.srcIn,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                GestureDetector(
                  onTap: () {
                    Get.to(DiscoverySettingsScreen());
                  },
                  child: Row(
                    children: [
                      GradientCircleAvatar(
                        linearGradient: orangeGradient,
                        child: SvgPicture.asset(
                          'assets/icons/discovery.svg',
                          colorFilter: const ColorFilter.mode(
                            whiteColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      const SizedBox(width: 24.0),
                      Expanded(
                        child: Text(
                          discoverySettings,
                          style: themeController.isDarkMode.value
                              ? dark.bodyXLargeSemiBold900
                              : light.bodyXLargeSemiBold900,
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/icons/arrow_right.svg',
                        colorFilter: ColorFilter.mode(
                          themeController.isDarkMode.value
                              ? whiteColor
                              : greyScale900Color,
                          BlendMode.srcIn,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      GradientCircleAvatar(
                        linearGradient: blueGradient,
                        child: SvgPicture.asset(
                          'assets/icons/lock.svg',
                          colorFilter: const ColorFilter.mode(
                            whiteColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      const SizedBox(width: 24.0),
                      Expanded(
                        child: Text(
                          privacyPermissions,
                          style: themeController.isDarkMode.value
                              ? dark.bodyXLargeSemiBold900
                              : light.bodyXLargeSemiBold900,
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/icons/arrow_right.svg',
                        colorFilter: ColorFilter.mode(
                          themeController.isDarkMode.value
                              ? whiteColor
                              : greyScale900Color,
                          BlendMode.srcIn,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                GestureDetector(
                  onTap: () {
                    Get.to(NotificationsScreen());
                  },
                  child: Row(
                    children: [
                      GradientCircleAvatar(
                        linearGradient: redGradient,
                        child: SvgPicture.asset(
                          'assets/icons/notification_bold.svg',
                          colorFilter: const ColorFilter.mode(
                            whiteColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      const SizedBox(width: 24.0),
                      Expanded(
                        child: Text(
                          notifications,
                          style: themeController.isDarkMode.value
                              ? dark.bodyXLargeSemiBold900
                              : light.bodyXLargeSemiBold900,
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/icons/arrow_right.svg',
                        colorFilter: ColorFilter.mode(
                          themeController.isDarkMode.value
                              ? whiteColor
                              : greyScale900Color,
                          BlendMode.srcIn,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                GestureDetector(
                  onTap: () {
                    Get.to(ChangePasswordScreen());
                  },
                  child: Row(
                    children: [
                      GradientCircleAvatar(
                        linearGradient: greenGradient,
                        child: SvgPicture.asset(
                          'assets/icons/lock.svg',
                          colorFilter: const ColorFilter.mode(
                            whiteColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      const SizedBox(width: 24.0),
                      Expanded(
                        child: Text(
                          changePassword,
                          style: themeController.isDarkMode.value
                              ? dark.bodyXLargeSemiBold900
                              : light.bodyXLargeSemiBold900,
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/icons/arrow_right.svg',
                        colorFilter: ColorFilter.mode(
                          themeController.isDarkMode.value
                              ? whiteColor
                              : greyScale900Color,
                          BlendMode.srcIn,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      GradientCircleAvatar(
                        linearGradient: yellowGradient,
                        child: SvgPicture.asset(
                          'assets/icons/folder.svg',
                          colorFilter: const ColorFilter.mode(
                            whiteColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      const SizedBox(width: 24.0),
                      Expanded(
                        child: Text(
                          dataStorage,
                          style: themeController.isDarkMode.value
                              ? dark.bodyXLargeSemiBold900
                              : light.bodyXLargeSemiBold900,
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/icons/arrow_right.svg',
                        colorFilter: ColorFilter.mode(
                          themeController.isDarkMode.value
                              ? whiteColor
                              : greyScale900Color,
                          BlendMode.srcIn,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 22.0,
                        backgroundColor: tealColor,
                        child: SvgPicture.asset(
                          'assets/icons/edit_square.svg',
                          colorFilter: const ColorFilter.mode(
                            whiteColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      const SizedBox(width: 24.0),
                      Expanded(
                        child: Text(
                          feedback,
                          style: themeController.isDarkMode.value
                              ? dark.bodyXLargeSemiBold900
                              : light.bodyXLargeSemiBold900,
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/icons/arrow_right.svg',
                        colorFilter: ColorFilter.mode(
                          themeController.isDarkMode.value
                              ? whiteColor
                              : greyScale900Color,
                          BlendMode.srcIn,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                GestureDetector(
                  onTap: () {
                    Get.to(LanguageScreen());
                  },
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 22.0,
                        backgroundColor: blueColor,
                        child: SvgPicture.asset(
                          'assets/icons/document.svg',
                          colorFilter: const ColorFilter.mode(
                            whiteColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      const SizedBox(width: 24.0),
                      Expanded(
                        child: Text(
                          language,
                          style: themeController.isDarkMode.value
                              ? dark.bodyXLargeSemiBold900
                              : light.bodyXLargeSemiBold900,
                        ),
                      ),
                      Text(
                        englishUS,
                        style: themeController.isDarkMode.value
                            ? dark.bodyXLargeSemiBold900
                            : light.bodyXLargeSemiBold900,
                      ),
                      const SizedBox(width: 20.0),
                      SvgPicture.asset(
                        'assets/icons/arrow_right.svg',
                        colorFilter: ColorFilter.mode(
                          themeController.isDarkMode.value
                              ? whiteColor
                              : greyScale900Color,
                          BlendMode.srcIn,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 22.0,
                        backgroundColor: blueGreyColor,
                        child: SvgPicture.asset(
                          'assets/icons/info_square_bold.svg',
                          colorFilter: const ColorFilter.mode(
                            whiteColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      const SizedBox(width: 24.0),
                      Expanded(
                        child: Text(
                          aboutHume,
                          style: themeController.isDarkMode.value
                              ? dark.bodyXLargeSemiBold900
                              : light.bodyXLargeSemiBold900,
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/icons/arrow_right.svg',
                        colorFilter: ColorFilter.mode(
                          themeController.isDarkMode.value
                              ? whiteColor
                              : greyScale900Color,
                          BlendMode.srcIn,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
