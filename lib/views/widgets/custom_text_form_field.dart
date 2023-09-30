import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../controller/theme_controller.dart';
import '../../utils/colors.dart';
import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;

// This widget for Custom Text form field
class CustomTextFormField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final String? prefixIconPath;
  final String? suffixIconPath;
  final bool? showMaxLines;
  final String? Function(String? value)? validator;
  final VoidCallback onTap;
  final Color backGroundColor;
  final Color? iconColor;
  final Function(String)? onChanged;

  CustomTextFormField({
    Key? key,
    required this.textEditingController,
    required this.hintText,
    required this.onTap,
    required this.backGroundColor,
    this.prefixIconPath,
    this.suffixIconPath,
    this.showMaxLines,
    this.validator,
    this.iconColor,
    this.onChanged,
  }) : super(key: key);

  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextFormField(
        controller: textEditingController,
        obscureText: false,
        style: themeController.isDarkMode.value
            ? dark.bodyMediumSemiBoldTextField
            : light.bodyMediumSemiBoldTextField,
        maxLines: showMaxLines ?? false ? 5 : 1,
        validator: validator,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: themeController.isDarkMode.value
              ? dark.bodyMediumRegular500
              : light.bodyMediumRegular500,
          prefixIcon: prefixIconPath != null
              ? Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: SvgPicture.asset(
                    prefixIconPath!,
                    width: 16.0,
                    height: 16.0,
                    colorFilter: ColorFilter.mode(
                      iconColor!,
                      BlendMode.srcIn,
                    ),
                  ),
                )
              : null,
          suffixIcon: suffixIconPath != null
              ? Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: SvgPicture.asset(
                    suffixIconPath!,
                    width: 16.0,
                    height: 16.0,
                    fit: BoxFit.scaleDown,
                    colorFilter: ColorFilter.mode(
                      iconColor!,
                      BlendMode.srcIn,
                    ),
                  ),
                )
              : null,
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
                  : greyScale100Color,
            ),
          ),
          filled: true,
          fillColor: backGroundColor,
        ),
        onTap: onTap,
        onChanged: (value) {
          if (onChanged != null) {
            onChanged!(value);
          }
        },
      ),
    );
  }
}
