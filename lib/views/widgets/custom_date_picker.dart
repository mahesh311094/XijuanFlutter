import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controller/theme_controller.dart';
import '../../controller/widgets/custom_date_controller.dart';
import '../../utils/colors.dart';
import '../../utils/strings.dart';
import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;

// This widget for Custom Date Picker
class DatePicker extends StatelessWidget {
  DatePicker({super.key});

  final CustomDateController controller = Get.put(CustomDateController());
    String _getFormattedDate(DateTime dateTime) {
    return DateFormat('dd-MM-yyyy').format(dateTime);
  }

  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () => controller.selectDate(),
        child: Row(
          children: [
            Expanded(
              child: Text(
                controller.selectedDate.value == null
                    ? dateOfBirth
                    : _getFormattedDate(controller.selectedDate.value),
                style: themeController.isDarkMode.value
                    ? dark.bodyMediumRegular
                    : light.bodyMediumRegular,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14.0),
              child: SvgPicture.asset(
                'assets/icons/calendar.svg',
                colorFilter: const ColorFilter.mode(
                  greyScale500Color,
                  BlendMode.srcIn,
                ),
                height: 20.0,
                width: 20.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
