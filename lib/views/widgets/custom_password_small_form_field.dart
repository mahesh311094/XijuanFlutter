import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import '../../controller/theme_controller.dart';
import '../../utils/colors.dart';
import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;

// This widget for Custom small password form field
class CustomSmallPasswordFormField extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isObscure;
  final VoidCallback onTap;
  final Color backGroundColor;

  CustomSmallPasswordFormField({
    Key? key,
    required this.textEditingController,
    required this.isObscure,
    required this.onTap,
    required this.backGroundColor,
  }) : super(key: key);

  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Expanded(
        flex: 1,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 60.0,
            child: TextFormField(
              controller: textEditingController,
              validator: MultiValidator([
                RequiredValidator(errorText: ""),
              ]),
              maxLength: 1,
              obscureText: isObscure,
              textAlign: TextAlign.center,
              textAlignVertical: TextAlignVertical.center,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              style: themeController.isDarkMode.value
                  ? dark.heading4Dark
                  : light.heading4,
              decoration: InputDecoration(
                counterText: "",
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
                fillColor: backGroundColor,
              ),
              onTap: onTap,
            ),
          ),
        ),
      ),
    );
  }
}
