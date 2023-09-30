import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../controller/theme_controller.dart';
import '../../utils/colors.dart';
import '../../utils/strings.dart';
import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;
import '../chat/chat_screen.dart';
import '../widgets/common_app_bar.dart';
import '../widgets/custom_button.dart';
import 'main_screen.dart';

// MatchAcceptScreen
class MatchAcceptScreen extends StatelessWidget {
  MatchAcceptScreen({super.key});

  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: ''),
      body: Obx(
        () => SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/match_screen.png',
                  width: Get.width / 1.5,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 8.0),
                Text(
                  itsAMatch,
                  style: themeController.isDarkMode.value
                      ? dark.customFont7
                      : light.customFont7,
                ),
                const SizedBox(height: 10.0),
                Text(
                  doNotKeepThemWaitingSayHelloNow,
                  style: themeController.isDarkMode.value
                      ? dark.customFont3
                      : light.customFont3,
                ),
                const SizedBox(height: 20.0),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: const Color(0XFFFFF0F6),
                    border: Border.all(color: const Color(0XFFFFF0F6)),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/objects.svg',
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 10.0),
                      Text(
                        dummyText9,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        style: themeController.isDarkMode.value
                            ? dark.heading4Dark
                            : light.heading4,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                  width: Get.width,
                  child: CustomButton(
                    bgColor: primary4Color,
                    buttonText: chat,
                    textColor: primaryColor,
                    cornerRadius: 100.0,
                    onPress: () {
                      Get.to(ChatScreen());
                    },
                  ),
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  width: Get.width,
                  child: CustomButton(
                    bgColor: primary4Color,
                    buttonText: keepSwiping,
                    textColor: primaryColor,
                    cornerRadius: 100.0,
                    onPress: () {
                      Get.to(MainScreen());
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
