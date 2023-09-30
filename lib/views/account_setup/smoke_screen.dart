import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/account_setup/smoke_controller.dart';
import '../../controller/theme_controller.dart';
import '../../model/account_setup/app_initial_model.dart';
import '../../utils/colors.dart';
import '../../utils/strings.dart';
import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;
import '../widgets/common_app_bar.dart';
import '../widgets/custom_button.dart';
import 'workout_screen.dart';

// SmokeScreen
class SmokeScreen extends StatelessWidget {
  SmokeScreen({super.key});

  final SmokeController controller = Get.put(SmokeController());
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
                  doYouSmoke,
                  style: themeController.isDarkMode.value
                      ? dark.heading5
                      : light.heading5,
                ),
              ),
              const SizedBox(height: 10.0),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.accountSetupController.appInitialModel
                          .value.smokeDurationType?.length ??
                      0,
                  itemBuilder: (BuildContext context, int index) {
                    SmokeDurationType smokeDurationType = controller
                        .accountSetupController
                        .appInitialModel
                        .value
                        .smokeDurationType![index];
                    return Obx(
                      () => RadioListTile(
                        title: Text(
                          smokeDurationType.smokeDurationType ?? "",
                          style: themeController.isDarkMode.value
                              ? dark.heading6
                              : light.heading6,
                        ),
                        value: smokeDurationType.id,
                        groupValue: controller.selectedSmokeTypeId.value != 0
                            ? controller.selectedSmokeTypeId.value
                            : controller.accountSetupController.appInitialModel
                                .value.smokeDurationType![1].id,
                        onChanged: (value) {
                          controller.onRadioValueChange(
                              smokeDurationType.smokeDurationType!,
                              smokeDurationType.id!);
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
                    controller
                            .accountSetupController.smokeDurationTypeMap['id'] =
                        controller.selectedSmokeTypeId.toInt();
                    controller.accountSetupController
                            .smokeDurationTypeMap['smoke_duration_type'] =
                        controller.selectedSmokeType.toString();

                    Get.to(WorkOutScreen());
                  },
                ),
              ),
              GestureDetector(
                onTap: () {
                  controller.accountSetupController.smokeDurationTypeMap['id'] =
                      controller.selectedSmokeTypeId.toInt();
                  controller.accountSetupController
                          .smokeDurationTypeMap['smoke_duration_type'] =
                      controller.selectedSmokeType.toString();

                  Get.to(WorkOutScreen());
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
