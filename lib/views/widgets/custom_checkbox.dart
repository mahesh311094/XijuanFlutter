import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/theme_controller.dart';
import '../../utils/colors.dart';
import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;

// This widget for Custom Checkbox
class CustomCheckbox extends StatelessWidget {
  final bool value;
  final String label;
  final Function(bool) onChanged;
  final bool? flag;

  CustomCheckbox({
    Key? key,
    required this.value,
    required this.label,
    required this.onChanged,
    this.flag,
  }) : super(key: key);

  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          flag ?? false ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        Checkbox(
          value: value,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          activeColor: primaryColor,
          onChanged: (value) {
            onChanged(value ?? false);
          },
        ),
        Obx(
          () => Text(
            label,
            style: flag ?? false
                ? themeController.isDarkMode.value
                    ? dark.bodyMediumSemiBold900
                    : light.bodyMediumSemiBold900
                : themeController.isDarkMode.value
                    ? dark.heading6
                    : light.heading6,
          ),
        ),
      ],
    );
  }
}
