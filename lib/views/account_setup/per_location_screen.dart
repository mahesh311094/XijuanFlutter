import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../controller/account_setup/location_controller.dart';
import '../../controller/theme_controller.dart';
import '../../utils/colors.dart';
import '../../utils/strings.dart';
import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;
import '../widgets/common_app_bar.dart';
import '../widgets/custom_button.dart';

// Enable Location Service Screen
class PerLocationScreen extends StatelessWidget {
  final bool isFirstTimeLogin;
  PerLocationScreen({super.key, required this.isFirstTimeLogin});

  final LocationController controller = Get.put(LocationController());
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ModalProgressHUD(
        inAsyncCall: controller.showSpinner.value,
        child: Scaffold(
          appBar: CommonAppBar(title: enableLocationServices),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child: Obx(
                    () => Column(
                      children: [
                        SvgPicture.asset(
                          'assets/images/location.svg',
                          width: Get.width / 2.2,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 40.0),
                        Text(
                          enableLocation,
                          style: themeController.isDarkMode.value
                              ? dark.heading3small
                              : light.heading3small,
                        ),
                        const SizedBox(height: 40.0),
                        Text(
                          enableLocationMessage,
                          textAlign: TextAlign.center,
                          style: themeController.isDarkMode.value
                              ? dark.bodyXLargeRegular900
                              : light.bodyXLargeRegular900,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: Get.width,
                  child: CustomButton(
                    bgColor: primaryColor,
                    buttonText: enable,
                    textColor: whiteColor,
                    cornerRadius: 100.0,
                    onPress: () {
                      controller.getCurrentLocation(isFirstTimeLogin);
                    },
                  ),
                ),
                const SizedBox(height: 64.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
