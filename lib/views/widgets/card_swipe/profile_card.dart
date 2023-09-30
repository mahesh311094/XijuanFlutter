import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/theme_controller.dart';
import '../../../model/profile.dart';
import '../../../utils/text_styles_light.dart' as light;
import '../../../utils/text_styles_dark.dart' as dark;

class ProfileCard extends StatelessWidget {
  ProfileCard({Key? key, required this.profile}) : super(key: key);
  final Profile profile;
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 1.3,
      width: Get.width,
      padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 4),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(48),
              child: Image.asset(
                profile.imageAsset,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            child: SizedBox(
              height: 80,
              width: 340,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        profile.name,
                        style: themeController.isDarkMode.value
                            ? dark.customFont8
                            : light.customFont8,
                      ),
                      Text(
                        profile.distance,
                        style: themeController.isDarkMode.value
                            ? dark.bodyMediumRegularWhite
                            : light.bodyMediumRegularWhite,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
