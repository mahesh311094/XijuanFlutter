import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/account_setup/height_controller.dart';
import '../../controller/theme_controller.dart';
import '../../utils/colors.dart';
import '../../utils/strings.dart';
import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;
import '../widgets/common_app_bar.dart';
import '../widgets/custom_button.dart';
import 'others_screen.dart';

// HeightScreen
class HeightScreen extends StatelessWidget {
  HeightScreen({super.key});

  final HeightController controller = Get.put(HeightController());
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: CommonAppBar(title: fillYourProfile),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                whatIsYourHeight,
                style: themeController.isDarkMode.value
                    ? dark.heading5
                    : light.heading5,
              ),
              const SizedBox(height: 10.0),
              Expanded(
                child: SizedBox(
                  height: 200,
                  child: CupertinoPicker(
                    itemExtent: 52,
                    scrollController: FixedExtentScrollController(
                      initialItem: controller.selectedHeightIndex.value,
                    ),
                    children: controller.heightItems
                        .map(
                          (item) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                            child: Text(
                              item,
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: fontFamily,
                                  color: themeController.isDarkMode.value
                                      ? whiteColor
                                      : blackColor),
                            ),
                          ),
                        )
                        .toList(),
                    onSelectedItemChanged: (int index) {
                      controller.onHeightSelectionChange(
                          index, controller.heightItems[index]);
                    },
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20.0),
                child: SizedBox(
                  width: Get.width,
                  child: CustomButton(
                    bgColor: primaryColor,
                    buttonText: continueText,
                    textColor: whiteColor,
                    cornerRadius: 100.0,
                    onPress: () {
                      controller
                              .accountSetupController.userProfileMap['height'] =
                          controller.selectedHeight.value.toString();
                      Get.to(OtherScreen());
                    },
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  controller.accountSetupController.userProfileMap['height'] =
                      controller.selectedHeight.value.toString();

                  Get.to(OtherScreen());
                },
                child: Text(
                  skipNow,
                  textAlign: TextAlign.center,
                  style: themeController.isDarkMode.value
                      ? dark.customFont
                      : light.customFont,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
