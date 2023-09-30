import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../controller/profile/subscription_controller.dart';
import '../../controller/theme_controller.dart';
import '../../utils/colors.dart';
import '../../utils/strings.dart';
import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;
import '../dashboard/main_screen.dart';
import '../widgets/common_app_bar.dart';
import '../widgets/custom_dialog.dart';

// SubscriptionScreen
class SubscriptionScreen extends StatelessWidget {
  SubscriptionScreen({super.key});

  final SubscriptionController controller = Get.put(SubscriptionController());
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: ''),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          child: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  xIJuanVIP,
                  style: themeController.isDarkMode.value
                      ? dark.heading3Primary
                      : light.heading3Primary,
                ),
                const SizedBox(height: 12.0),
                Text(
                  xIJuanVIPText,
                  textAlign: TextAlign.center,
                  style: themeController.isDarkMode.value
                      ? dark.bodyXLargeMedium800
                      : light.bodyXLargeMedium800,
                ),
                const SizedBox(height: 24.0),
                GestureDetector(
                  onTap: () {
                    controller.firstPlanSelected.value =
                        !controller.firstPlanSelected.value;
                    controller.secondPlanSelected.value = false;
                    customDialog(
                      mainImage: 'assets/images/congratulations.svg',
                      title: congratulations,
                      content: congratulationMessage,
                      buttonText: ok,
                      screen: MainScreen(),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 24.0),
                    decoration: BoxDecoration(
                      color: themeController.isDarkMode.value
                          ? dark2Color
                          : greyScale50Color,
                      border: controller.firstPlanSelected.value
                          ? Border.all(color: primaryColor, width: 3.0)
                          : Border.all(color: greyScale200Color, width: 1.0),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(48.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        Center(
                          child: SvgPicture.asset(
                            'assets/icons/premium_icon.svg',
                            colorFilter: const ColorFilter.mode(
                              primaryColor,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                        const SizedBox(height: 14.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              firstPlan,
                              style: themeController.isDarkMode.value
                                  ? dark.heading3
                                  : light.heading3,
                            ),
                            const SizedBox(width: 6.0),
                            Text(
                              month,
                              style: themeController.isDarkMode.value
                                  ? dark.bodyXLargeMedium700
                                  : light.bodyXLargeMedium700,
                            ),
                          ],
                        ),
                        const SizedBox(height: 5.0),
                        const Divider(
                          thickness: 1.0,
                          color: greyScale200Color,
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/check.svg',
                              colorFilter: const ColorFilter.mode(
                                primaryColor,
                                BlendMode.srcIn,
                              ),
                            ),
                            const SizedBox(width: 24.0),
                            Text(
                              unlimitedSwipingLikes,
                              style: themeController.isDarkMode.value
                                  ? dark.bodyLargeMedium800
                                  : light.bodyLargeMedium800,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/check.svg',
                              colorFilter: const ColorFilter.mode(
                                primaryColor,
                                BlendMode.srcIn,
                              ),
                            ),
                            const SizedBox(width: 24.0),
                            Text(
                              seeWhoLikesYou,
                              style: themeController.isDarkMode.value
                                  ? dark.bodyLargeMedium800
                                  : light.bodyLargeMedium800,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/check.svg',
                              colorFilter: const ColorFilter.mode(
                                primaryColor,
                                BlendMode.srcIn,
                              ),
                            ),
                            const SizedBox(width: 24.0),
                            Text(
                              unlimitedRewinds,
                              style: themeController.isDarkMode.value
                                  ? dark.bodyLargeMedium800
                                  : light.bodyLargeMedium800,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/check.svg',
                              colorFilter: const ColorFilter.mode(
                                primaryColor,
                                BlendMode.srcIn,
                              ),
                            ),
                            const SizedBox(width: 24.0),
                            Text(
                              removeRestrictionsAds,
                              style: themeController.isDarkMode.value
                                  ? dark.bodyLargeMedium800
                                  : light.bodyLargeMedium800,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24.0),
                GestureDetector(
                  onTap: () {
                    controller.secondPlanSelected.value =
                        !controller.secondPlanSelected.value;
                    controller.firstPlanSelected.value = false;
                    customDialog(
                      mainImage: 'assets/images/congratulations.svg',
                      title: congratulations,
                      content: congratulationMessage,
                      buttonText: ok,
                      screen: MainScreen(),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 24.0),
                    decoration: BoxDecoration(
                      color: themeController.isDarkMode.value
                          ? dark2Color
                          : greyScale50Color,
                      border: controller.secondPlanSelected.value
                          ? Border.all(color: primaryColor, width: 3.0)
                          : Border.all(color: greyScale200Color, width: 1.0),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(48.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        Center(
                          child: SvgPicture.asset(
                            'assets/icons/premium_icon.svg',
                            colorFilter: const ColorFilter.mode(
                              primaryColor,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                        const SizedBox(height: 14.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              secondPlan,
                              style: themeController.isDarkMode.value
                                  ? dark.heading3
                                  : light.heading3,
                            ),
                            const SizedBox(width: 6.0),
                            Text(
                              sixMonth,
                              style: themeController.isDarkMode.value
                                  ? dark.bodyXLargeMedium700
                                  : light.bodyXLargeMedium700,
                            ),
                          ],
                        ),
                        const SizedBox(height: 5.0),
                        const Divider(
                          thickness: 1.0,
                          color: greyScale200Color,
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/check.svg',
                              colorFilter: const ColorFilter.mode(
                                primaryColor,
                                BlendMode.srcIn,
                              ),
                            ),
                            const SizedBox(width: 24.0),
                            Text(
                              unlimitedSwipingLikes,
                              style: themeController.isDarkMode.value
                                  ? dark.bodyLargeMedium800
                                  : light.bodyLargeMedium800,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/check.svg',
                              colorFilter: const ColorFilter.mode(
                                primaryColor,
                                BlendMode.srcIn,
                              ),
                            ),
                            const SizedBox(width: 24.0),
                            Text(
                              seeWhoLikesYou,
                              style: themeController.isDarkMode.value
                                  ? dark.bodyLargeMedium800
                                  : light.bodyLargeMedium800,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/check.svg',
                              colorFilter: const ColorFilter.mode(
                                primaryColor,
                                BlendMode.srcIn,
                              ),
                            ),
                            const SizedBox(width: 24.0),
                            Text(
                              unlimitedRewinds,
                              style: themeController.isDarkMode.value
                                  ? dark.bodyLargeMedium800
                                  : light.bodyLargeMedium800,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/check.svg',
                              colorFilter: const ColorFilter.mode(
                                primaryColor,
                                BlendMode.srcIn,
                              ),
                            ),
                            const SizedBox(width: 24.0),
                            Text(
                              removeRestrictionsAds,
                              style: themeController.isDarkMode.value
                                  ? dark.bodyLargeMedium800
                                  : light.bodyLargeMedium800,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
