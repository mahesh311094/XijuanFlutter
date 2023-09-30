import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../controller/theme_controller.dart';
import '../../utils/colors.dart';
import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;

// This widget for App bar with action button
class AppBarWithActionButtons extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onPressBack;
  final VoidCallback? onPressSearch;
  final VoidCallback? onPressOptions;

  AppBarWithActionButtons(
      {Key? key,
      required this.title,
      this.onPressBack,
      this.onPressSearch,
      this.onPressOptions})
      : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AppBar(
        backgroundColor:
            themeController.isDarkMode.value ? dark4Color : whiteColor,
        elevation: 0,
        title: Text(
          title,
          style:
              themeController.isDarkMode.value ? dark.heading5 : light.heading5,
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
              'assets/icons/search.svg',
              colorFilter: ColorFilter.mode(
                themeController.isDarkMode.value
                    ? whiteColor
                    : greyScale900Color,
                BlendMode.srcIn,
              ),
            ),
            onPressed: () {
              onPressSearch;
            },
          ),
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
              onPressOptions;
            },
          ),
        ],
      ),
    );
  }
}
