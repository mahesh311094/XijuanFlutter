import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../controller/dashboard/main_controller.dart';
import '../../controller/theme_controller.dart';
import '../../utils/colors.dart';
import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;

// MainScreen
class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final MainController controller = Get.put(MainController());
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: controller.screens[controller.currentIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor:
              themeController.isDarkMode.value ? dark4Color : whiteColor,
          currentIndex: controller.currentIndex.value,
          onTap: (int index) {
            controller.currentIndex.value = index;
          },
          elevation: 0,
          selectedItemColor: primaryColor,
          unselectedItemColor:
              themeController.isDarkMode.value ? whiteColor : greyScale500Color,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          items: _buildBottomNavigationBarItems(),
          selectedLabelStyle: themeController.isDarkMode.value
              ? dark.bodyXSmallMedium
              : light.bodyXSmallMedium,
          unselectedLabelStyle: themeController.isDarkMode.value
              ? dark.bodyXSmallMedium
              : light.bodyXSmallMedium,
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> _buildBottomNavigationBarItems() {
    List<BottomNavigationBarItem> items = [];

    for (int i = 0; i < controller.menuItems.length; i++) {
      items.add(
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(bottom: 2.0),
            child: SvgPicture.asset(
              controller.inactiveMenuIcons[i],
              width: 20.0,
              height: 20.0,
              colorFilter: ColorFilter.mode(
                controller.currentIndex.value == i
                    ? primaryColor
                    : greyScale500Color,
                BlendMode.srcIn,
              ),
            ),
          ),
          activeIcon: Padding(
            padding: const EdgeInsets.only(bottom: 2.0),
            child: SvgPicture.asset(
              controller.activeMenuIcons[i],
              width: 20.0,
              height: 20.0,
              colorFilter: ColorFilter.mode(
                controller.currentIndex.value == i
                    ? primaryColor
                    : greyScale500Color,
                BlendMode.srcIn,
              ),
            ),
          ),
          label: controller.menuItems[i],
        ),
      );
    }

    return items;
  }
}
