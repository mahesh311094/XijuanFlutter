import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../controller/theme_controller.dart';
import '../../utils/colors.dart';
import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;

// This widget for Custom Password Form field
class CustomPasswordFormField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String iconPath;
  final String text;
  final bool prefixIconShow;
  final bool suffixIconShow;
  final String? Function(String? value)? validator;
  final bool isObscure;
  final VoidCallback onTap;
  final VoidCallback onVisibility;
  final Color backGroundColor;
  final Color iconColor;

  CustomPasswordFormField({
    Key? key,
    required this.textEditingController,
    required this.iconPath,
    required this.text,
    required this.prefixIconShow,
    required this.suffixIconShow,
    this.validator,
    required this.isObscure,
    required this.onTap,
    required this.onVisibility,
    required this.backGroundColor,
    required this.iconColor,
  }) : super(key: key);

  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextFormField(
        controller: textEditingController,
        validator: validator,
        style: themeController.isDarkMode.value
            ? dark.customFont6
            : light.customFont6,
        obscureText: isObscure,
        decoration: InputDecoration(
            prefixIcon: prefixIconShow
                ? Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: SvgPicture.asset(
                      iconPath,
                      height: 16.0,
                      width: 16.0,
                      colorFilter: ColorFilter.mode(
                        iconColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  )
                : Container(),
            hintText: text,
            hintStyle: themeController.isDarkMode.value
                ? dark.bodyMediumRegular500
                : light.bodyMediumRegular500,
            contentPadding: const EdgeInsets.all(20.0),
            suffixIcon: suffixIconShow
                ? GestureDetector(
                    onTap: onVisibility,
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: isObscure
                          ? SvgPicture.asset(
                              'assets/icons/hide.svg',
                              height: 16.0,
                              width: 16.0,
                              colorFilter: ColorFilter.mode(
                                iconColor,
                                BlendMode.srcIn,
                              ),
                            )
                          : SvgPicture.asset(
                              'assets/icons/show.svg',
                              height: 16.0,
                              width: 16.0,
                              colorFilter: ColorFilter.mode(
                                iconColor,
                                BlendMode.srcIn,
                              ),
                            ),
                    ),
                  )
                : Container(),
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
            fillColor: backGroundColor),
        onTap: onTap,
      ),
    );
  }
}
