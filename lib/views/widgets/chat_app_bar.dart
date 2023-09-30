import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../controller/theme_controller.dart';
import '../../utils/colors.dart';
import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;

// This widget for chat app bar
class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onCallClick;
  final VoidCallback? onVideoClick;
  final VoidCallback? onMoreClick;

  ChatAppBar({
    Key? key,
    required this.title,
    this.onCallClick,
    this.onVideoClick,
    this.onMoreClick,
  }) : super(key: key);

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
        title: Text(title,
            style: themeController.isDarkMode.value
                ? dark.heading5
                : light.heading5),
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/left_arrow.svg',
            colorFilter: ColorFilter.mode(
              themeController.isDarkMode.value ? whiteColor : greyScale900Color,
              BlendMode.srcIn,
            ),
          ),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          IconButton(
            constraints: const BoxConstraints(),
            padding: const EdgeInsets.all(8),
            icon: SvgPicture.asset(
              'assets/icons/ic_call.svg',
              colorFilter: ColorFilter.mode(
                themeController.isDarkMode.value
                    ? whiteColor
                    : greyScale900Color,
                BlendMode.srcIn,
              ),
              height: 22,
            ),
            onPressed: onCallClick,
          ),
          IconButton(
            constraints: const BoxConstraints(),
            padding: const EdgeInsets.all(8),
            icon: SvgPicture.asset(
              'assets/icons/ic_video.svg',
              colorFilter: ColorFilter.mode(
                themeController.isDarkMode.value
                    ? whiteColor
                    : greyScale900Color,
                BlendMode.srcIn,
              ),
              height: 24,
            ),
            onPressed: onVideoClick,
          ),
          IconButton(
            constraints: const BoxConstraints(),
            padding: const EdgeInsets.only(left: 8, right: 14),
            icon: SvgPicture.asset(
              'assets/icons/ic_more.svg',
              colorFilter: ColorFilter.mode(
                themeController.isDarkMode.value
                    ? whiteColor
                    : greyScale900Color,
                BlendMode.srcIn,
              ),
              height: 22,
            ),
            onPressed: onMoreClick,
          )
        ],
      ),
    );
  }
}
