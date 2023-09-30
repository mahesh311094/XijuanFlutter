import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../controller/settings/discovery_settings_controller.dart';
import '../../controller/theme_controller.dart';
import '../../utils/colors.dart';
import '../../utils/strings.dart';
import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;
import '../widgets/common_app_bar.dart';

// Discovery Settings Screen
class DiscoverySettingsScreen extends StatelessWidget {
  DiscoverySettingsScreen({super.key});

  final DiscoverySettingsController controller =
      Get.put(DiscoverySettingsController());
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ModalProgressHUD(
        inAsyncCall: controller.showSpinner.value,
        child: Scaffold(
          appBar: CommonAppBar(title: discoverySettings),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                location,
                                style: themeController.isDarkMode.value
                                    ? dark.bodyXLargeSemiBold900
                                    : light.bodyXLargeSemiBold900,
                              ),
                            ),
                            Text(
                              controller.currentLocation.value,
                              style: themeController.isDarkMode.value
                                  ? dark.bodyXLargeSemiBold900
                                  : light.bodyXLargeSemiBold900,
                            ),
                            const SizedBox(width: 10.0),
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
                    ),
                    const SizedBox(height: 30.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        age,
                        textAlign: TextAlign.start,
                        style: themeController.isDarkMode.value
                            ? dark.heading6
                            : light.heading6,
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    SliderTheme(
                      data: SliderThemeData(
                        valueIndicatorColor: primaryColor,
                        valueIndicatorTextStyle:
                            themeController.isDarkMode.value
                                ? dark.bodyMediumSemiWhite
                                : light.bodyMediumSemiWhite,
                      ),
                      child: RangeSlider(
                        activeColor: primaryColor,
                        min: 1,
                        max: 60,
                        divisions: 59,
                        values: controller.selectedAge,
                        labels: RangeLabels(
                          controller.selectedAge.start.round().toString(),
                          controller.selectedAge.end.round().toString(),
                        ),
                        onChanged: (RangeValues value) {},
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        distanceInKm,
                        textAlign: TextAlign.start,
                        style: themeController.isDarkMode.value
                            ? dark.heading6
                            : light.heading6,
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    SliderTheme(
                      data: SliderThemeData(
                        valueIndicatorColor: primaryColor,
                        valueIndicatorTextStyle:
                            themeController.isDarkMode.value
                                ? dark.bodyMediumSemiWhite
                                : light.bodyMediumSemiWhite,
                      ),
                      child: RangeSlider(
                        activeColor: primaryColor,
                        min: 0,
                        max: 100,
                        divisions: 100,
                        values: controller.selectedLocation,
                        labels: RangeLabels(
                          "${controller.selectedLocation.start.round().toString()} KM",
                          "${controller.selectedLocation.end.round().toString()} KM",
                        ),
                        onChanged: (RangeValues value) {},
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        expandSearchArea,
                        style: themeController.isDarkMode.value
                            ? dark.bodyXLargeSemiBold900
                            : light.bodyXLargeSemiBold900,
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                showMe,
                                style: themeController.isDarkMode.value
                                    ? dark.bodyXLargeSemiBold900
                                    : light.bodyXLargeSemiBold900,
                              ),
                            ),
                            Text(
                              womenOnly,
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
                    ),
                    const SizedBox(height: 30.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        hideLastSeen,
                        style: themeController.isDarkMode.value
                            ? dark.bodyXLargeSemiBold900
                            : light.bodyXLargeSemiBold900,
                      ),
                    ),
                    const SizedBox(height: 30.0),
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
