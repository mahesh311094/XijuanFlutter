import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/account_setup/identify_controller.dart';
import '../../controller/theme_controller.dart';
import '../../model/account_setup/app_initial_model.dart';
import '../../utils/colors.dart';
import '../../utils/strings.dart';
import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;
import '../widgets/common_app_bar.dart';
import '../widgets/custom_button.dart';
import 'fluent_screen.dart';

// Identify Screen
class IdentifyScreen extends StatelessWidget {
  IdentifyScreen({super.key});

  final IdentifyController controller = Get.put(IdentifyController());
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28.0),
                child: Text(
                  whichOfTheseDoYouIdentifyWith,
                  style: themeController.isDarkMode.value
                      ? dark.heading5
                      : light.heading5,
                ),
              ),
              const SizedBox(height: 10.0),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.accountSetupController.appInitialModel
                          .value.identifyWith?.length ??
                      0,
                  itemBuilder: (BuildContext context, int index) {
                    IdentifyWith identifyWith = controller
                        .accountSetupController
                        .appInitialModel
                        .value
                        .identifyWith![index];
                    return Obx(
                      () => RadioListTile(
                        title: Text(
                          identifyWith.identifyWithName ?? "",
                          style: themeController.isDarkMode.value
                              ? dark.heading6
                              : light.heading6,
                        ),
                        value: identifyWith.id,
                        groupValue: controller.selectedIdentifyId.value != 0
                            ? controller.selectedIdentifyId.value
                            : controller.accountSetupController.appInitialModel
                                .value.identifyWith![1].id,
                        onChanged: (value) {
                          controller.onRadioValueChange(
                            identifyWith.identifyWithName!,
                            identifyWith.id!,
                          );
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
                    controller.accountSetupController.identifyWithMap['id'] =
                        controller.selectedIdentifyId.toInt();
                    controller.accountSetupController
                            .identifyWithMap['identify_with_name'] =
                        controller.selectedIdentify.toString();

                    Get.to(FluentScreen());
                  },
                ),
              ),
              GestureDetector(
                onTap: () {
                  controller.accountSetupController.identifyWithMap['id'] =
                      controller.selectedIdentifyId.toInt();
                  controller.accountSetupController
                          .identifyWithMap['identify_with_name'] =
                      controller.selectedIdentify.toString();

                  Get.to(FluentScreen());
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
