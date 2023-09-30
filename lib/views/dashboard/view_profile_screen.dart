import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../controller/dashboard/view_profile_controller.dart';
import '../../controller/theme_controller.dart';
import '../../utils/colors.dart';
import '../../utils/strings.dart';
import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;
import '../profile/edit_profile_screen.dart';

// ViewProfileScreen
class MyChip {
  final String label;
  final String iconPath;

  const MyChip({required this.label, required this.iconPath});
}

final List<MyChip> _myChips = [
  const MyChip(label: 'Gym & Fitness', iconPath: 'assets/images/india.png'),
  const MyChip(label: 'Food & Drink', iconPath: 'assets/images/india.png'),
  const MyChip(label: 'Travel', iconPath: 'assets/images/india.png'),
  const MyChip(label: 'Art ', iconPath: 'assets/images/india.png'),
  const MyChip(label: 'Design ', iconPath: 'assets/images/india.png'),
];

class ViewProfileScreen extends StatelessWidget {
  final bool? isEdit;

  ViewProfileScreen({super.key, this.isEdit});

  final ViewProfileController controller = Get.put(ViewProfileController());
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Stack(
          children: [
            PageView.builder(
              controller: controller.pageController,
              itemCount: controller.imageList.length,
              onPageChanged: (index) {
                controller.onImageIndexChange(index);
              },
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Image.asset(
                      controller.imageList[index],
                      height: Get.height / 1.6,
                      width: Get.width,
                      fit: BoxFit.fill,
                    ),
                  ],
                );
              },
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: SvgPicture.asset(
                        'assets/icons/left_arrow.svg',
                        colorFilter: const ColorFilter.mode(
                          greyScale900Color,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: Get.height / 1.8,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: themeController.isDarkMode.value
                      ? dark2Color
                      : whiteColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(28.0),
                    topRight: Radius.circular(28.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  dummyText4,
                                  style: themeController.isDarkMode.value
                                      ? dark.heading3small
                                      : light.heading3small,
                                ),
                                const SizedBox(height: 10.0),
                                Row(
                                  children: [
                                    Text(
                                      dummyText5,
                                      style: themeController.isDarkMode.value
                                          ? dark.bodyLargeMedium900
                                          : light.bodyLargeMedium900,
                                    ),
                                    const SizedBox(width: 16.0),
                                    Container(
                                      decoration: const BoxDecoration(
                                        color: primary4Color,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8.0),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 6.0,
                                          horizontal: 8.0,
                                        ),
                                        child: Text(
                                          sagittarius,
                                          style: themeController
                                                  .isDarkMode.value
                                              ? dark.bodyXSmallSemiBoldPrimary
                                              : light.bodyXSmallSemiBoldPrimary,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            isEdit ?? false
                                ? GestureDetector(
                                    onTap: () {
                                      Get.to(EditProfileScreen());
                                    },
                                    child: SvgPicture.asset(
                                      'assets/icons/edit_curved.svg',
                                      colorFilter: const ColorFilter.mode(
                                        primaryColor,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                      color: whiteColor,
                                      border: Border.all(
                                        color: primaryColor,
                                        width: 1.5,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(80.0),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 3.0,
                                        horizontal: 10.0,
                                      ),
                                      child: Text(
                                        dummyText6,
                                        style: themeController.isDarkMode.value
                                            ? dark.bodyMediumSemiBoldPrimary
                                            : light.bodyMediumSemiBoldPrimary,
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                        const SizedBox(height: 16.0),
                        Text(
                          about,
                          style: themeController.isDarkMode.value
                              ? dark.heading5
                              : light.heading5,
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          dummyText7,
                          style: themeController.isDarkMode.value
                              ? dark.bodyLargeMedium900
                              : light.bodyLargeMedium900,
                        ),
                        const SizedBox(height: 16.0),
                        Text(
                          interest,
                          style: themeController.isDarkMode.value
                              ? dark.heading5
                              : light.heading5,
                        ),
                        const SizedBox(height: 8.0),
                        Wrap(
                          spacing: 8.0,
                          runSpacing: 2.0,
                          children: _myChips.map((chip) {
                            return ChipTheme(
                              data: ChipTheme.of(context).copyWith(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100.0),
                                  side: const BorderSide(
                                    color: primaryColor,
                                    width: 1.5,
                                  ),
                                ),
                              ),
                              child: Chip(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8.0,
                                  horizontal: 12.0,
                                ),
                                label: Text(
                                  chip.label,
                                  style: themeController.isDarkMode.value
                                      ? dark.bodyLargeSemiBoldWhite
                                      : light.bodyLargeSemiBoldWhite,
                                ),
                                avatar: Image.asset(
                                  chip.iconPath,
                                  width: 16,
                                ),
                                backgroundColor: primaryColor,
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 20.0),
                        Text(
                          myBasicInfo,
                          style: themeController.isDarkMode.value
                              ? dark.heading5
                              : light.heading5,
                        ),
                        const SizedBox(height: 8.0),
                        Wrap(
                          spacing: 8.0,
                          runSpacing: 2.0,
                          children: _myChips.map((chip) {
                            return ChipTheme(
                              data: ChipTheme.of(context).copyWith(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100.0),
                                  side: const BorderSide(
                                    color: primaryColor,
                                    width: 1.5,
                                  ),
                                ),
                              ),
                              child: Chip(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8.0,
                                  horizontal: 12.0,
                                ),
                                label: Text(
                                  chip.label,
                                  style: themeController.isDarkMode.value
                                      ? dark.bodyLargeSemiBoldWhite
                                      : light.bodyLargeSemiBoldWhite,
                                ),
                                avatar: Image.asset(chip.iconPath),
                                backgroundColor: primaryColor,
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: Get.height / 1.9,
              left: 0,
              right: 0,
              child: Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildIndicator(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < controller.imageList.length; i++) {
      indicators.add(
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: Obx(
            () => Container(
              width: controller.currentImageIndex == i ? 16.0 : 6.0,
              height: 6.0,
              decoration: controller.currentImageIndex == i
                  ? BoxDecoration(
                      gradient: purpleGradient,
                      borderRadius: BorderRadius.circular(5.0),
                    )
                  : BoxDecoration(
                      color: greyScale300Color,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
            ),
          ),
        ),
      );
    }
    return indicators;
  }
}
