import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../controller/account_setup/fill_profile_sec2_controller.dart';
import '../../controller/theme_controller.dart';
import '../../utils/colors.dart';
import '../../utils/strings.dart';
import '../widgets/background_box.dart';
import '../widgets/common_app_bar.dart';
import '../widgets/custom_button.dart';
import 'add_photo_screen.dart';
import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;

// Date of birth Fill Screen
class FillProfileSec2Screen extends StatelessWidget {
  FillProfileSec2Screen({super.key});

  final FillProfileSec2Controller controller =
      Get.put(FillProfileSec2Controller());

  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: fillYourProfile),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            BackgroundBox(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Obx(
                  () => GestureDetector(
                    onTap: () => controller.selectDate(),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            controller.selectedDate.value == null
                                ? dateOfBirth
                                : controller.getDisplayDate(
                                    controller.selectedDate.value!,
                                  ),
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
                ),
              ),
            ),
            const SizedBox(height: 180.0),
            SizedBox(
              width: Get.width,
              child: CustomButton(
                bgColor: disabledButtonColor,
                buttonText: continueText,
                textColor: whiteColor,
                cornerRadius: 100.0,
                onPress: () {
                  if (controller.selectedDate.value != null) {
                    controller.accountSetupController.userProfileMap['date_of_birth'] =
                        controller
                            .getFormattedDate(controller.selectedDate.value!);
                    Get.to(AddPhotoScreen());
                  } else {
                    Fluttertoast.showToast(msg: pleaseSelectDateOfBirth);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
