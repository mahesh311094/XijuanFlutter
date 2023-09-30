import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/theme_controller.dart';
import '../../utils/colors.dart';
import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;
import '../../utils/utils.dart';
import '../../utils/strings.dart';
import '../dashboard/main_screen.dart';
import '../widgets/common_app_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_dialog.dart';

// GuidelinesScreen
class GuidelinesScreen extends StatelessWidget {
  GuidelinesScreen({super.key});

  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: CommonAppBar(title: ourGuidelines),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 48),
              Text(
                welcomeToXiJuan,
                style: themeController.isDarkMode.value
                    ? dark.customFont2
                    : light.customFont2,
              ),
              const SizedBox(height: 20.0),
              Text(
                guidelinesMessage,
                textAlign: TextAlign.center,
                style: themeController.isDarkMode.value
                    ? dark.customFont3
                    : light.customFont3,
              ),
              const SizedBox(height: 20.0),
              SizedBox(
                width: Get.width,
                child: CustomButton(
                  bgColor: primaryColor,
                  buttonText: continueText,
                  textColor: whiteColor,
                  cornerRadius: 100.0,
                  onPress: () {
                    changeTransparentStatusBar();
                    customDialog(
                      mainImage: 'assets/images/dialog_welcome.svg',
                      title: welcome,
                      content: welcomeMessage,
                      buttonText: done,
                      screen: MainScreen(),
                    );
                  },
                ),
              ),
              const SizedBox(height: 48.0),
              Text(
                haveFunDateSafely,
                textAlign: TextAlign.center,
                style: themeController.isDarkMode.value
                    ? dark.customFont2
                    : light.customFont2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
