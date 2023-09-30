import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../controller/theme_controller.dart';
import '../../utils/colors.dart';
import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;
import '../../utils/utils.dart';
import '../../utils/strings.dart';
import '../dashboard/help_center_screen.dart';
import '../dashboard/view_profile_screen.dart';
import '../settings/settings_screen.dart';
import '../widgets/custom_dialog.dart';
import '../widgets/logout_bottom_sheet_modal.dart';
import '../widgets/toggle_switch.dart';
import 'invite_friends_screen.dart';
import 'subscription_screen.dart';

// ProfileScreen
class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor:
              themeController.isDarkMode.value ? dark4Color : whiteColor,
          elevation: 0,
          title: Text(
            profile,
            style: themeController.isDarkMode.value
                ? dark.heading5
                : light.heading5,
          ),
          leading: IconButton(
            icon: SvgPicture.asset(
              'assets/icons/app.svg',
              colorFilter: const ColorFilter.mode(
                primaryColor,
                BlendMode.srcIn,
              ),
            ),
            onPressed: () {
              Get.back();
            },
          ),
          actions: [
            IconButton(
              icon: SvgPicture.asset(
                'assets/icons/circle.svg',
                colorFilter: ColorFilter.mode(
                  themeController.isDarkMode.value
                      ? whiteColor
                      : greyScale900Color,
                  BlendMode.srcIn,
                ),
              ),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(ViewProfileScreen(isEdit: true));
                },
                child: SizedBox(
                  width: 132,
                  height: 132,
                  child: Stack(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          'assets/images/girl_2.png',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                      Positioned(
                        top: 5,
                        right: 2,
                        child: SvgPicture.asset(
                          'assets/icons/premium.svg',
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Container(
                decoration: const BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 6.0,
                    horizontal: 10.0,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      changeTransparentStatusBar();
                      customDialog(
                        mainImage: 'assets/icons/premium.svg',
                        title: howItWorks,
                        content: howItWorksText1,
                        buttonText: next,
                        isFrom: 'Profile Screen',
                        openDialog: true,
                      );
                    },
                    child: Text(
                      photoVerification,
                      style: themeController.isDarkMode.value
                          ? dark.bodyMediumSemiWhite
                          : light.bodyMediumSemiWhite,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(SubscriptionScreen());
                },
                child: Image.asset(
                  'assets/images/promo_discount.png',
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(SettingsScreen());
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/setting.svg',
                            colorFilter: ColorFilter.mode(
                              themeController.isDarkMode.value
                                  ? whiteColor
                                  : blackColor,
                              BlendMode.srcIn,
                            ),
                          ),
                          const SizedBox(width: 24.0),
                          Expanded(
                            child: Text(settings,
                                style: themeController.isDarkMode.value
                                    ? dark.bodyXLargeSemiBold900
                                    : light.bodyXLargeSemiBold900),
                          ),
                          SvgPicture.asset(
                            'assets/icons/arrow_right.svg',
                            colorFilter: ColorFilter.mode(
                              themeController.isDarkMode.value
                                  ? whiteColor
                                  : blackColor,
                              BlendMode.srcIn,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 18.0),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/show_curved.svg',
                          colorFilter: ColorFilter.mode(
                            themeController.isDarkMode.value
                                ? whiteColor
                                : blackColor,
                            BlendMode.srcIn,
                          ),
                        ),
                        const SizedBox(width: 24.0),
                        Expanded(
                          child: Text(darkMode,
                              style: themeController.isDarkMode.value
                                  ? dark.bodyXLargeSemiBold900
                                  : light.bodyXLargeSemiBold900),
                        ),
                        ToggleSwitch(
                            flag: themeController.isDarkMode.value,
                            onChanged: (value) {
                              themeController.onDarkModeValueChange(value);
                            }),
                      ],
                    ),
                    const SizedBox(height: 18.0),
                    GestureDetector(
                      onTap: () {
                        Get.to(const HelpCenterScreen());
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/info_square.svg',
                            colorFilter: ColorFilter.mode(
                              themeController.isDarkMode.value
                                  ? whiteColor
                                  : blackColor,
                              BlendMode.srcIn,
                            ),
                          ),
                          const SizedBox(width: 24.0),
                          Expanded(
                            child: Text(helpCenter,
                                style: themeController.isDarkMode.value
                                    ? dark.bodyXLargeSemiBold900
                                    : light.bodyXLargeSemiBold900),
                          ),
                          SvgPicture.asset(
                            'assets/icons/arrow_right.svg',
                            colorFilter: ColorFilter.mode(
                              themeController.isDarkMode.value
                                  ? whiteColor
                                  : blackColor,
                              BlendMode.srcIn,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    GestureDetector(
                      onTap: () {
                        Get.to(InviteFriendScreen());
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/users_curved.svg',
                            colorFilter: ColorFilter.mode(
                              themeController.isDarkMode.value
                                  ? whiteColor
                                  : blackColor,
                              BlendMode.srcIn,
                            ),
                          ),
                          const SizedBox(width: 24.0),
                          Expanded(
                            child: Text(inviteFriends,
                                style: themeController.isDarkMode.value
                                    ? dark.bodyXLargeSemiBold900
                                    : light.bodyXLargeSemiBold900),
                          ),
                          SvgPicture.asset(
                            'assets/icons/arrow_right.svg',
                            colorFilter: ColorFilter.mode(
                              themeController.isDarkMode.value
                                  ? whiteColor
                                  : blackColor,
                              BlendMode.srcIn,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    GestureDetector(
                      onTap: () {
                        _showBottomSheet();
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/logout.svg',
                            colorFilter: const ColorFilter.mode(
                              errorColor,
                              BlendMode.srcIn,
                            ),
                          ),
                          const SizedBox(width: 24.0),
                          Text(logout,
                              style: themeController.isDarkMode.value
                                  ? dark.bodyXLargeSemiBoldError
                                  : light.bodyXLargeSemiBoldError)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showBottomSheet() {
    changeTransparentStatusBar();
    Get.bottomSheet(
      LogoutSheetModal(),
      elevation: 0,
      backgroundColor: Colors.transparent,
    ).then((value) {
      changeStatusBarColor(themeController.isDarkMode.value);
    });
  }
}
