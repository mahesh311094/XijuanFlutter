import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/account_setup/zodiac_controller.dart';
import '../../controller/theme_controller.dart';
import '../../model/account_setup/app_initial_model.dart';
import '../../utils/colors.dart';
import '../../utils/strings.dart';
import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;
import '../widgets/common_app_bar.dart';
import '../widgets/custom_button.dart';
import 'chinese_zodiac_screen.dart';

// ZodiacScreen
class ZodiacScreen extends StatelessWidget {
  ZodiacScreen({super.key});

  final ZodiacController controller = Get.put(ZodiacController());
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: fillYourProfile),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Text(
                  whatsYourZodiac,
                  style: themeController.isDarkMode.value
                      ? dark.heading5
                      : light.heading5,
                ),
              ),
              const SizedBox(height: 10.0),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.accountSetupController.appInitialModel
                          .value.zodiac?.length ??
                      0,
                  itemBuilder: (BuildContext context, int index) {
                    Zodiac zodiac = controller.accountSetupController
                        .appInitialModel.value.zodiac![index];
                    return Obx(
                      () => RadioListTile(
                        title: Text(
                          zodiac.zodiacName ?? "",
                          style: themeController.isDarkMode.value
                              ? dark.heading6
                              : light.heading6,
                        ),
                        value: zodiac.id,
                        groupValue: controller.selectedZodiacId.value != 0
                            ? controller.selectedZodiacId.value
                            : controller.accountSetupController.appInitialModel
                                .value.zodiac![1].id,
                        onChanged: (value) {
                          controller.onRadioValueChange(
                              zodiac.zodiacName!, zodiac.id!);
                        },
                        activeColor: primaryColor,
                        contentPadding: EdgeInsets.zero,
                        visualDensity: const VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                          vertical: -2.0,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: CustomButton(
                  bgColor: primaryColor,
                  buttonText: continueText,
                  textColor: whiteColor,
                  cornerRadius: 100.0,
                  onPress: () {
                    controller.accountSetupController.zodiacMap['id'] =
                        controller.selectedZodiacId.toInt();
                    controller.accountSetupController.zodiacMap['zodiac_name'] =
                        controller.selectedZodiac.toString();

                    Get.to(ChineseZodiacScreen());
                  },
                ),
              ),
              GestureDetector(
                onTap: () {
                  controller.accountSetupController.zodiacMap['id'] =
                      controller.selectedZodiacId.toInt();
                  controller.accountSetupController.zodiacMap['zodiac_name'] =
                      controller.selectedZodiac.toString();

                  Get.to(ChineseZodiacScreen());
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
