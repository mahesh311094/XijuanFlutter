import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../controller/theme_controller.dart';
import '../../controller/widgets/filter_bottom_sheet_controller.dart';
import '../../utils/colors.dart';
import '../../utils/strings.dart';
import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;
import 'custom_button.dart';

// This widget for Filter bottom sheet modal
final List<MyChip> _myChips = [
  const MyChip(label: male),
  const MyChip(label: female),
  const MyChip(label: all),
];

class FilterBottomSheetModal extends StatelessWidget {
  FilterBottomSheetModal({super.key});

  final FilterBottomSheetController controller =
      Get.put(FilterBottomSheetController());
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Obx(
        () => Container(
          decoration: BoxDecoration(
            color: themeController.isDarkMode.value
                ? dark2Color
                : greyScale100Color,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 22.0, bottom: 18.0),
                  child: Center(
                    child: SvgPicture.asset('assets/icons/divider.svg'),
                  ),
                ),
                Center(
                  child: Text(
                    filter,
                    textAlign: TextAlign.center,
                    style: themeController.isDarkMode.value
                        ? dark.heading4
                        : light.heading4,
                  ),
                ),
                const SizedBox(height: 12.0),
                const Divider(
                  thickness: 1.2,
                  color: greyScale200Color,
                ),
                const SizedBox(height: 12.0),
                Text(
                  gender,
                  textAlign: TextAlign.start,
                  style: themeController.isDarkMode.value
                      ? dark.heading6
                      : light.heading6,
                ),
                const SizedBox(height: 8.0),
                Wrap(
                  spacing: 8.0,
                  children: _myChips.map((chip) {
                    final isSelected = controller.selectedGender.contains(chip);
                    return ChipTheme(
                      data: ChipTheme.of(context).copyWith(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                          side: const BorderSide(
                            color: primaryColor,
                            width: 1.5,
                          ),
                        ),
                      ),
                      child: ActionChip(
                        label: SizedBox(
                          width: 75.0,
                          child: Center(
                            child: Text(chip.label,
                                style: isSelected
                                    ? themeController.isDarkMode.value
                                        ? dark.bodyLargeBoldWhite
                                        : light.bodyLargeBoldWhite
                                    : themeController.isDarkMode.value
                                        ? dark.bodyLargeBoldPrimary
                                        : light.bodyLargeBoldPrimary),
                          ),
                        ),
                        backgroundColor: isSelected ? primaryColor : whiteColor,
                        onPressed: () {
                          controller.onGenderValueChange;
                        },
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 18.0),
                Text(
                  age,
                  textAlign: TextAlign.start,
                  style: themeController.isDarkMode.value
                      ? dark.heading6
                      : light.heading6,
                ),
                const SizedBox(height: 18.0),
                SliderTheme(
                  data: SliderThemeData(
                    valueIndicatorColor: primaryColor,
                    valueIndicatorTextStyle: themeController.isDarkMode.value
                        ? dark.bodyMediumSemiWhite
                        : light.bodyMediumSemiWhite,
                  ),
                  child: RangeSlider(
                    activeColor: primaryColor,
                    min: 1,
                    max: 60,
                    divisions: 59,
                    values: controller.selectedAge.value,
                    labels: RangeLabels(
                      controller.selectedAge.value.start.round().toString(),
                      controller.selectedAge.value.end.round().toString(),
                    ),
                    onChanged: (values) {
                      controller.selectedAge.value = values;
                    },
                  ),
                ),
                const SizedBox(height: 18.0),
                Text(
                  location,
                  textAlign: TextAlign.start,
                  style: themeController.isDarkMode.value
                      ? dark.heading6
                      : light.heading6,
                ),
                const SizedBox(height: 18.0),
                SliderTheme(
                  data: SliderThemeData(
                    valueIndicatorColor: primaryColor,
                    valueIndicatorTextStyle: themeController.isDarkMode.value
                        ? dark.bodyMediumSemiWhite
                        : light.bodyMediumSemiWhite,
                  ),
                  child: RangeSlider(
                    activeColor: primaryColor,
                    min: 0,
                    max: 60,
                    divisions: 60,
                    values: controller.selectedLocation.value,
                    labels: RangeLabels(
                      "${controller.selectedLocation.value.start.round().toString()} KM",
                      "${controller.selectedLocation.value.end.round().toString()} KM",
                    ),
                    onChanged: (values) {
                      controller.selectedLocation.value = values;
                    },
                  ),
                ),
                const Divider(
                  thickness: 1.2,
                  color: greyScale200Color,
                ),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: Get.width / 2.3,
                      child: CustomButton(
                        buttonText: reset,
                        cornerRadius: 100.0,
                        textColor: primaryColor,
                        bgColor: primary4Color,
                        onPress: () {
                          controller.selectedAge.value =
                              const RangeValues(18, 30);
                          controller.selectedLocation.value =
                              const RangeValues(18, 30);
                        },
                      ),
                    ),
                    const SizedBox(width: 12.0),
                    SizedBox(
                      width: Get.width / 2.3,
                      child: CustomButton(
                        buttonText: apply,
                        cornerRadius: 100.0,
                        textColor: whiteColor,
                        bgColor: primaryColor,
                        onPress: () {},
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
