import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/account_setup/gender_controller.dart';
import '../../controller/theme_controller.dart';
import '../../model/account_setup/app_initial_model.dart';
import '../../utils/colors.dart';
import '../../utils/strings.dart';
import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;
import '../widgets/common_app_bar.dart';
import '../widgets/custom_button.dart';
import 'date_screen.dart';

// GenderScreen
class GenderScreen extends StatelessWidget {
  GenderScreen({super.key});

  final GenderController controller = Get.put(GenderController());
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: fillYourProfile),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Obx(
                () => Text(
                  gender,
                  style: themeController.isDarkMode.value
                      ? dark.heading5
                      : light.heading5,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: ListView.builder(
                itemCount: controller.accountSetupController.appInitialModel
                        .value.gender?.length ??
                    0,
                itemBuilder: (BuildContext context, int index) {
                  Gender gender = controller.accountSetupController
                      .appInitialModel.value.gender![index];
                  return Obx(
                    () => RadioListTile(
                      title: Text(
                        gender.gender ?? "",
                        style: themeController.isDarkMode.value
                            ? dark.heading6
                            : light.heading6,
                      ),
                      value: gender.id,
                      groupValue: controller.selectedGenderId.value != 0
                          ? controller.selectedGenderId.value
                          : controller.accountSetupController.appInitialModel
                              .value.gender![1].id,
                      onChanged: (value) {
                        controller.onRadioValueChange(
                          gender.gender!,
                          gender.id!,
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
            Container(
              margin: const EdgeInsets.only(
                top: 10.0,
                bottom: 32.0,
              ),
              child: CustomButton(
                bgColor: disabledButtonColor,
                buttonText: continueText,
                textColor: whiteColor,
                cornerRadius: 100.0,
                onPress: () {
                  controller.accountSetupController.genderMap['id'] =
                      controller.selectedGenderId.toInt();
                  controller.accountSetupController.genderMap['gender'] =
                      controller.selectedGender.toString();

                  Get.to(DateScreen());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
