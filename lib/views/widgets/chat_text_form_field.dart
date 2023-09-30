import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../controller/theme_controller.dart';
import '../../controller/widgets/chat_text_form_field_controller.dart';
import '../../utils/colors.dart';
import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;

// This widget for chat text form field
class ChatTextFormField extends StatelessWidget {
  final String prefixIconPath;
  final String suffixIconPath1;
  final String suffixIconPath2;
  final String text;

  ChatTextFormField({
    Key? key,
    required this.prefixIconPath,
    required this.suffixIconPath1,
    required this.suffixIconPath2,
    required this.text,
  }) : super(key: key);

  final ChatTextFormFieldController controller =
      Get.put(ChatTextFormFieldController());
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextFormField(
        obscureText: false,
        style: themeController.isDarkMode.value
            ? dark.bodyMediumSemiBoldTextField
            : light.bodyMediumSemiBoldTextField,
        maxLines: 1,
        decoration: InputDecoration(
          hintText: text,
          hintStyle: themeController.isDarkMode.value
              ? dark.bodyMediumRegular500
              : light.bodyMediumRegular500,
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: SvgPicture.asset(
              prefixIconPath,
              width: 16.0,
              height: 16.0,
              fit: BoxFit.scaleDown,
              colorFilter: ColorFilter.mode(
                controller.iconColor.value,
                BlendMode.srcIn,
              ),
            ),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  suffixIconPath1,
                  width: 16.0,
                  height: 16.0,
                  fit: BoxFit.scaleDown,
                  colorFilter: ColorFilter.mode(
                    controller.iconColor.value,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(width: 14),
                SvgPicture.asset(
                  suffixIconPath2,
                  width: 16.0,
                  height: 16.0,
                  fit: BoxFit.scaleDown,
                  colorFilter: ColorFilter.mode(
                    controller.iconColor.value,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: const BorderSide(color: greyScale200Color),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: const BorderSide(color: primaryColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: BorderSide(
                color: themeController.isDarkMode.value
                    ? Colors.transparent
                    : greyScale100Color),
          ),
          filled: true,
          fillColor: themeController.isDarkMode.value
              ? controller.backDarkColor.value
              : controller.backColor.value,
        ),
        onTap: () {
          if (themeController.isDarkMode.value) {
            controller.backDarkColor.value = primary4Color;
          } else {
            controller.backColor.value = primary4Color;
          }
          controller.iconColor.value = primaryColor;
        },
      ),
    );
  }
}
