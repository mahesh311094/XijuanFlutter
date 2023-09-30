import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/account_setup/account_setup_controller.dart';
import '../../controller/account_setup/alcohol_controller.dart';
import '../../controller/theme_controller.dart';
import '../../model/account_setup/app_initial_model.dart';
import '../../utils/colors.dart';
import '../../utils/strings.dart';
import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;
import '../widgets/common_app_bar.dart';
import '../widgets/custom_button.dart';
import 'identify_screen.dart';

// AlcoholScreen
class AlcoholScreen extends StatelessWidget {
  AlcoholScreen({super.key});

  final AlcoholController controller = Get.put(AlcoholController());
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
                  doYouDrinkAlcohol,
                  style: themeController.isDarkMode.value
                      ? dark.heading5
                      : light.heading5,
                ),
              ),
              const SizedBox(height: 10.0),
              Expanded(
                child: ListView.builder(
                  itemCount: accountSetupController.appInitialModel.value
                          .alcoholDrinkDurationType?.length ??
                      0,
                  itemBuilder: (BuildContext context, int index) {
                    AlcoholDrinkDurationType alcoholDrinkDurationType =
                        accountSetupController.appInitialModel.value
                            .alcoholDrinkDurationType![index];
                    return Obx(
                      () => RadioListTile(
                        title: Text(
                          alcoholDrinkDurationType.alcoholDrinkDurationType ??
                              "",
                          style: themeController.isDarkMode.value
                              ? dark.heading6
                              : light.heading6,
                        ),
                        value: alcoholDrinkDurationType.id,
                        groupValue: controller.selectedAlcoholId.value != 0
                            ? controller.selectedAlcoholId.value
                            : accountSetupController.appInitialModel.value
                                .alcoholDrinkDurationType![1].id,
                        onChanged: (value) {
                          controller.onRadioValueChange(
                              alcoholDrinkDurationType
                                  .alcoholDrinkDurationType!,
                              alcoholDrinkDurationType.id!);
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
                    accountSetupController.alcoholDrinkDurationTypeMap['id'] =
                        controller.selectedAlcoholId.toInt();
                    accountSetupController.alcoholDrinkDurationTypeMap[
                            'alcohol_drink_duration_type'] =
                        controller.selectedAlcohol.toString();

                    Get.to(IdentifyScreen());
                  },
                ),
              ),
              GestureDetector(
                onTap: () {
                  accountSetupController.alcoholDrinkDurationTypeMap['id'] =
                      controller.selectedAlcoholId.toInt();
                  accountSetupController.alcoholDrinkDurationTypeMap[
                          'alcohol_drink_duration_type'] =
                      controller.selectedAlcohol.toString();

                  Get.to(IdentifyScreen());
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
