import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/account_setup/account_setup_controller.dart';
import '../../controller/account_setup/chinese_zodiac_controller.dart';
import '../../controller/theme_controller.dart';
import '../../model/account_setup/app_initial_model.dart';
import '../../utils/colors.dart';
import '../../utils/strings.dart';
import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;
import '../widgets/common_app_bar.dart';
import '../widgets/custom_button.dart';
import 'smoke_screen.dart';

// ChineseZodiacScreen
class ChineseZodiacScreen extends StatelessWidget {
  ChineseZodiacScreen({super.key});

  final ChineseZodiacController controller = Get.put(ChineseZodiacController());
  final ThemeController themeController = Get.find();
  final AccountSetupController accountSetupController = Get.find();

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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Text(
                  whatsYourChineseZodiac,
                  style: themeController.isDarkMode.value
                      ? dark.heading5
                      : light.heading5,
                ),
              ),
              const SizedBox(height: 10.0),
              Expanded(
                child: ListView.builder(
                  itemCount: accountSetupController
                          .appInitialModel.value.chineseZodiac?.length ??
                      0,
                  itemBuilder: (BuildContext context, int index) {
                    ChineseZodiac chineseZodiac = accountSetupController
                        .appInitialModel.value.chineseZodiac![index];
                    return Obx(
                      () => RadioListTile(
                        title: Text(
                          chineseZodiac.chineseZodiacName ?? "",
                          style: themeController.isDarkMode.value
                              ? dark.heading6
                              : light.heading6,
                        ),
                        value: chineseZodiac.id,
                        groupValue:
                            controller.selectedChineseZodiacId.value != 0
                                ? controller.selectedChineseZodiacId.value
                                : accountSetupController
                                    .appInitialModel.value.chineseZodiac![1].id,
                        onChanged: (value) {
                          controller.onRadioValueChange(
                              chineseZodiac.chineseZodiacName!,
                              chineseZodiac.id!);
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
                    accountSetupController.chineseZodiacMap['id'] =
                        controller.selectedChineseZodiacId.toInt();
                    accountSetupController
                            .chineseZodiacMap['chinese_zodiac_name'] =
                        controller.selectedChineseZodiac.toString();
                    Get.to(SmokeScreen());
                  },
                ),
              ),
              GestureDetector(
                onTap: () {
                  accountSetupController.chineseZodiacMap['id'] =
                      controller.selectedChineseZodiacId.toInt();
                  accountSetupController
                          .chineseZodiacMap['chinese_zodiac_name'] =
                      controller.selectedChineseZodiac.toString();

                  Get.to(SmokeScreen());
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
