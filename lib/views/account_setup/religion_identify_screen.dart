import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../model/account_setup/app_initial_model.dart';
import '../../controller/account_setup/religion_identify_controller.dart';
import '../../controller/theme_controller.dart';
import '../../utils/colors.dart';
import '../../utils/strings.dart';
import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;
import '../widgets/common_app_bar.dart';
import '../widgets/custom_button.dart';
import 'children_screen.dart';

// ReligionIdentifyScreen
class ReligionIdentifyScreen extends StatelessWidget {
  ReligionIdentifyScreen({super.key});

  final ReligionIdentifyController controller =
      Get.put(ReligionIdentifyController());

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
                  whatReligionDoYouIdentifyWith,
                  style: themeController.isDarkMode.value
                      ? dark.heading5
                      : light.heading5,
                ),
              ),
              const SizedBox(height: 10.0),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.accountSetupController.appInitialModel
                          .value.religion?.length ??
                      0,
                  itemBuilder: (BuildContext context, int index) {
                    Religion religion = controller.accountSetupController
                        .appInitialModel.value.religion![index];
                    return Obx(
                      () => RadioListTile(
                        title: Text(
                          religion.religionName ?? "",
                          style: themeController.isDarkMode.value
                              ? dark.heading6
                              : light.heading6,
                        ),
                        value: religion.id,
                        groupValue: controller.selectedReligionId.value != 0
                            ? controller.selectedReligionId.value
                            : controller.accountSetupController.appInitialModel
                                .value.religion![1].id,
                        onChanged: (value) {
                          controller.onRadioValueChange(
                            religion.religionName!,
                            religion.id!,
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
                    controller.accountSetupController.religionMap['id'] =
                        controller.selectedReligionId.toInt();
                    controller.accountSetupController
                            .religionMap['religion_name'] =
                        controller.selectedReligion.toString();

                    Get.to(ChildrenScreen());
                  },
                ),
              ),
              GestureDetector(
                onTap: () {
                  controller.accountSetupController.religionMap['id'] =
                      controller.selectedReligionId.toInt();
                  controller
                          .accountSetupController.religionMap['religion_name'] =
                      controller.selectedReligion.toString();

                  Get.to(ChildrenScreen());
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
