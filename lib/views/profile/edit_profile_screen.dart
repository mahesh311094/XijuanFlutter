import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../controller/profile/edit_profile_controller.dart';
import '../../controller/theme_controller.dart';
import '../../utils/colors.dart';
import '../../utils/strings.dart';
import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;
import '../widgets/common_app_bar.dart';
import '../widgets/custom_text_form_field.dart';

// EditProfileScreen
class MyChip {
  final String label;
  final String iconPath;

  const MyChip({required this.label, required this.iconPath});
}

final List<MyChip> _myChips = [
  const MyChip(label: 'Fashion', iconPath: 'assets/images/india.png'),
  const MyChip(label: 'Movie', iconPath: 'assets/images/india.png'),
  const MyChip(label: 'Travel', iconPath: 'assets/images/india.png'),
  const MyChip(label: 'Art ', iconPath: 'assets/images/india.png'),
  const MyChip(label: 'Design ', iconPath: 'assets/images/india.png'),
];

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  final List<String> imageUrls = [
    'assets/images/girl_3.png',
    'assets/images/girl_3.png',
    'assets/images/girl_3.png',
    'assets/images/girl_3.png',
  ];

  final ThemeController themeController = Get.find();
  final EditProfileController controller = Get.put(EditProfileController());

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController occupationController = TextEditingController();
  final TextEditingController aboutMeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: editProfile),
      body: Obx(
        () => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 16.0,
              bottom: 16.0,
              left: 16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  yourBestPhotos,
                  style: themeController.isDarkMode.value
                      ? dark.heading5
                      : light.heading5,
                ),
                SizedBox(
                  height: 180.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: imageUrls.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Stack(
                          fit: StackFit.passthrough,
                          children: [
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(24.0),
                                child: Image.asset(
                                  imageUrls[index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 16.0,
                              right: 16.0,
                              child: GestureDetector(
                                onTap: () {},
                                child: SvgPicture.asset(
                                  "assets/icons/edit_curved.svg",
                                  colorFilter: const ColorFilter.mode(
                                    whiteColor,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      yourInterest,
                      style: themeController.isDarkMode.value
                          ? dark.heading5
                          : light.heading5,
                    ),
                    const SizedBox(height: 24.0),
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(
                          'assets/icons/edit_curved.svg',
                          colorFilter: const ColorFilter.mode(
                            primaryColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10.0),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 6.0,
                  children: _myChips.map((chip) {
                    return ChipTheme(
                      data: ChipTheme.of(context).copyWith(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                          side: const BorderSide(
                            color: primaryColor,
                            width: 2.0,
                          ),
                        ),
                      ),
                      child: Chip(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 20.0,
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
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(myBasicInfo,
                        style: themeController.isDarkMode.value
                            ? dark.heading5
                            : light.heading5),
                    const SizedBox(height: 20.0),
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(
                          'assets/icons/edit_curved.svg',
                          colorFilter: const ColorFilter.mode(
                            primaryColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10.0),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 6.0,
                  children: _myChips.map((chip) {
                    return ChipTheme(
                      data: ChipTheme.of(context).copyWith(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                          side: const BorderSide(
                            color: primaryColor,
                            width: 2.0,
                          ),
                        ),
                      ),
                      child: Chip(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 20.0,
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
                const SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        yourProfile,
                        style: themeController.isDarkMode.value
                            ? dark.heading5
                            : light.heading5,
                      ),
                      const SizedBox(height: 20.0),
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
                      CustomTextFormField(
                        textEditingController: occupationController,
                        hintText: occupation,
                        backGroundColor: themeController.isDarkMode.value
                            ? controller.occupationBackDarkColor.value
                            : controller.occupationBackColor.value,
                        onTap: () {
                          if (themeController.isDarkMode.value) {
                            controller
                                .changeOccupationBackDarkColor(primary4Color);
                          } else {
                            controller.changeOccupationBackColor(primary4Color);
                          }
                        },
                      ),
                      const SizedBox(height: 20.0),
                      CustomTextFormField(
                        textEditingController: aboutMeController,
                        hintText: aboutMe,
                        showMaxLines: true,
                        backGroundColor: themeController.isDarkMode.value
                            ? controller.aboutMeBackDarkColor.value
                            : controller.aboutMeBackColor.value,
                        onTap: () {
                          if (themeController.isDarkMode.value) {
                            controller
                                .changeAboutMeBackDarkColor(primary4Color);
                          } else {
                            controller.changeAboutMeBackColor(primary4Color);
                          }
                        },
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
