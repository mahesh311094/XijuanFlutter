import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/theme_controller.dart';
import '../../utils/colors.dart';

// This widget for background box
class BackgroundBox extends StatelessWidget {
  final Widget child;

  BackgroundBox({required this.child, Key? key}) : super(key: key);
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color:
              themeController.isDarkMode.value ? dark2Color : greyScale50Color,
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(
            color: themeController.isDarkMode.value
                ? dark2Color
                : greyScale100Color,
          ),
        ),
        child: child,
      ),
    );
  }
}
