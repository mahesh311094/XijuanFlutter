import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../controller/theme_controller.dart';
import '../../utils/colors.dart';
import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;

// AudioCallScreen
class AudioCallScreen extends StatelessWidget {
  AudioCallScreen({Key? key}) : super(key: key);

  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          Image.asset(
            height: Get.height,
            width: Get.width,
            "assets/images/call_background.png",
            fit: BoxFit.fill,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SizedBox(
              width: Get.width,
              height: Get.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage('assets/images/add_user.png'),
                  ),
                  const SizedBox(height: 16),
                  Text("Natasha Winkles",
                      style: themeController.isDarkMode.value
                          ? dark.heading3White
                          : light.heading3White),
                  const SizedBox(height: 16),
                  Text("04:35 minutes",
                      style: themeController.isDarkMode.value
                          ? dark.bodyXLargeMediumWhite
                          : light.bodyXLargeMediumWhite),
                ],
              ),
            ),
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
                      colorFilter:
                          const ColorFilter.mode(whiteColor, BlendMode.srcIn),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 32,
            child: SizedBox(
              width: Get.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: CircleAvatar(
                      radius: 28,
                      backgroundColor: grey32Transparent,
                      child: SvgPicture.asset(
                        'assets/icons/ic_volume_up.svg',
                        height: 22,
                      ),
                    ),
                  ),
                  const SizedBox(width: 18),
                  GestureDetector(
                    onTap: () {},
                    child: CircleAvatar(
                      radius: 28,
                      backgroundColor: grey32Transparent,
                      child: SvgPicture.asset(
                        'assets/icons/ic_mic.svg',
                        height: 22,
                      ),
                    ),
                  ),
                  const SizedBox(width: 18),
                  GestureDetector(
                    onTap: () {},
                    child: CircleAvatar(
                      radius: 28,
                      backgroundColor: errorColor,
                      child: SvgPicture.asset(
                        'assets/icons/ic_call_missed.svg',
                        height: 22,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
