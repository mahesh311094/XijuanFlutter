import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../controller/dashboard/home_controller.dart';
import '../../controller/theme_controller.dart';
import '../../utils/colors.dart';
import '../../utils/strings.dart';
import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;
import '../../utils/utils.dart';
import '../forgot_password/forgot_password_screen1.dart';
import '../widgets/card_swipe/cards_stack_widget.dart';
import '../widgets/custom_dialog.dart';
import '../widgets/filter_bottom_sheet_modal.dart';
import 'view_profile_screen.dart';

// HomeScreen
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController controller = Get.put(HomeController());
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(ViewProfileScreen());
                          },
                          child: const CircleAvatar(
                            radius: 24.0,
                            backgroundImage:
                                AssetImage('assets/images/add_user.png'),
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                changeTransparentStatusBar();
                                customDialog(
                                  title: alerts,
                                  buttonText: done,
                                  content: matchesExpireAfter24Hours,
                                  mainImage: 'assets/images/alert_1.svg',
                                  screen: ForgotPasswordScreen1(),
                                );
                              },
                              child: Text(
                                controller.greetingMessage.value,
                                style: themeController.isDarkMode.value
                                    ? dark.bodyLargeRegular600
                                    : light.bodyLargeRegular600,
                              ),
                            ),
                            const SizedBox(height: 6.0),
                            GestureDetector(
                              onTap: () {
                                changeTransparentStatusBar();
                                customDialog(
                                  title: alerts,
                                  buttonText: upgradeToVip,
                                  content: alertMessage,
                                  mainImage: 'assets/images/alert_2.svg',
                                  screen: ForgotPasswordScreen1(),
                                );
                              },
                              child: Text(
                                'Andrew Ainsley',
                                style: themeController.isDarkMode.value
                                    ? dark.heading5
                                    : light.heading5,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            _showBottomSheet();
                          },
                          child: SvgPicture.asset(
                            'assets/icons/filter.svg',
                            width: 24.0,
                            height: 24.0,
                            colorFilter: ColorFilter.mode(
                              themeController.isDarkMode.value
                                  ? whiteColor
                                  : greyScale900Color,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const CardsStackWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showBottomSheet() {
    changeTransparentStatusBar();
    Get.bottomSheet(
      FilterBottomSheetModal(),
      isScrollControlled: true,
      enableDrag: true,
      isDismissible: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
    ).then((value) {
      changeStatusBarColor(themeController.isDarkMode.value);
    });
  }
}
