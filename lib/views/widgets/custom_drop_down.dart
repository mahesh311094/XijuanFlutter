import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../controller/theme_controller.dart';
import '../../utils/colors.dart';
import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;

// This widget for Custom Dropdown
class CustomDropdown extends StatelessWidget {
  final List<String> items;
  String selectedValue;
  final Function(String) onChanged;

  CustomDropdown({
    super.key,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
  });

  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58.0,
      child: Obx(
        () => DropdownButtonFormField<String>(
          dropdownColor:
              themeController.isDarkMode.value ? dark2Color : greyScale200Color,
          decoration: InputDecoration(
            filled: true,
            fillColor: themeController.isDarkMode.value
                ? dark2Color
                : greyScale50Color,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: const BorderSide(color: greyScale50Color),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: BorderSide(
                  color: themeController.isDarkMode.value
                      ? dark4Color
                      : greyScale50Color),
            ),
          ),
          value: selectedValue,
          onChanged: (String? newValue) {
            selectedValue = newValue ?? "";
            onChanged(selectedValue);
          },
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: themeController.isDarkMode.value
                    ? dark.bodyMediumSemiBold900
                    : light.bodyMediumSemiBold900,
              ),
            );
          }).toList(),
          icon: SvgPicture.asset(
            'assets/icons/down_arrow.svg',
            width: 8.0,
            height: 8.0,
            colorFilter: ColorFilter.mode(
              themeController.isDarkMode.value ? whiteColor : greyScale500Color,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
