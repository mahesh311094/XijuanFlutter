import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../controller/account_setup/interests_controller.dart';
import '../../controller/theme_controller.dart';
import '../../model/account_setup/app_initial_model.dart';
import '../../model/interests_model.dart';
import '../../utils/colors.dart';
import '../../utils/strings.dart';

import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;
import 'ideal_match_screen.dart';
import '../widgets/common_app_bar.dart';
import '../widgets/custom_button.dart';

// Interests Screen
class InterestsScreen extends StatelessWidget {
  InterestsScreen({super.key});

  final InterestController controller = Get.put(InterestController());
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: selectYourInterests),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 12.0,
              ),
              child: Obx(
                () => Text(
                  selectYourInterestsMessage,
                  style: themeController.isDarkMode.value
                      ? dark.bodyXLargeMedium900
                      : light.bodyXLargeMedium900,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 14.0,
                vertical: 10.0,
              ),
              child: Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: List<Widget>.generate(
                    controller.accountSetupController.appInitialModel.value
                            .interestType?.length ??
                        0, (int index) {
                  return Obx(() {
                    InterestType interestType = controller
                        .accountSetupController
                        .appInitialModel
                        .value
                        .interestType![index];
                    return ChipTheme(
                      data: ChipTheme.of(context).copyWith(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                          side: const BorderSide(
                            color: primaryColor,
                            width: 1.5,
                          ),
                        ),
                      ),
                      child: ActionChip(
                        padding: const EdgeInsets.all(8.0),
                        label: Text(
                          "${interestType.icon ?? ""} ${interestType.interestName ?? ""}",
                          style: interestType.isSelected.value == true
                              ? themeController.isDarkMode.value
                                  ? dark.bodyLargeBoldWhite
                                  : light.bodyLargeBoldWhite
                              : themeController.isDarkMode.value
                                  ? dark.bodyLargeBoldPrimary
                                  : light.bodyLargeBoldPrimary,
                        ),
                        backgroundColor: interestType.isSelected.value == true
                            ? primaryColor
                            : whiteColor,
                        onPressed: () {
                          interestType.isSelected.toggle();
                          controller.onInterestValuesChange(interestType.id,
                              interestType.interestName, interestType.icon);
                        },
                      ),
                    );
                  });
                }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 8.0,
                left: 16.0,
                right: 16.0,
                bottom: 42.0,
              ),
              child: SizedBox(
                width: Get.width,
                child: CustomButton(
                  bgColor: primaryColor,
                  buttonText: continueText,
                  textColor: whiteColor,
                  cornerRadius: 100.0,
                  onPress: () {
                    myInterestList.isNotEmpty
                        ? Get.to(IdealMatchScreen())
                        : Fluttertoast.showToast(
                            msg: pleaseSelectAnyInterest,
                          );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
