import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../controller/theme_controller.dart';
import '../../utils/colors.dart';
import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;

// This widget for Sign in Buttons
class SignInButton extends StatelessWidget {
  final String imagePath;
  final String text;
  final Color bgColor;
  final VoidCallback? onPress;
  final bool showIcon;

  SignInButton({
    Key? key,
    required this.imagePath,
    required this.text,
    required this.bgColor,
    required this.onPress,
    required this.showIcon,
  }) : super(key: key);
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => MaterialButton(
        height: 52.0,
        onPressed: onPress,
        color: themeController.isDarkMode.value ? dark2Color : bgColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
          side: BorderSide(
            color: themeController.isDarkMode.value
                ? dark3Color
                : greyScale200Color,
            width: 1.0,
          ),
        ),
        padding: const EdgeInsets.all(14.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            showIcon
                ? SvgPicture.asset(
                    imagePath,
                    colorFilter: imagePath == 'assets/icons/apple.svg'
                        ? ColorFilter.mode(
                            themeController.isDarkMode.value
                                ? whiteColor
                                : blackColor,
                            BlendMode.srcIn)
                        : null,
                  )
                : Container(),
            const SizedBox(width: 8.0),
            Text(
              text,
              style: themeController.isDarkMode.value
                  ? dark.bodyLargeSemiBold900
                  : light.bodyLargeSemiBold900,
            ),
          ],
        ),
      ),
    );
  }
}
