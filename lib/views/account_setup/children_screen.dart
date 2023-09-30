import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../controller/account_setup/account_setup_controller.dart';
import '../../controller/account_setup/profile_children_controller.dart';
import '../../controller/theme_controller.dart';
import '../../model/account_setup/app_initial_model.dart';
import '../../utils/colors.dart';
import '../../utils/strings.dart';
import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;
import '../widgets/common_app_bar.dart';
import '../widgets/custom_button.dart';

// ChildrenScreen
class ChildrenScreen extends StatelessWidget {
  ChildrenScreen({super.key});

  final ProfileChildrenController controller =
      Get.put(ProfileChildrenController());
  final ThemeController themeController = Get.find();
  final AccountSetupController accountSetupController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ModalProgressHUD(
        inAsyncCall: false,
        child: Scaffold(
          appBar: CommonAppBar(title: fillYourProfile),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    wouldYouLikeToHaveChildren,
                    style: themeController.isDarkMode.value
                        ? dark.heading5
                        : light.heading5,
                  ),
                ),
                const SizedBox(height: 10.0),
                Expanded(
                  child: ListView.builder(
                    itemCount: accountSetupController
                            .appInitialModel.value.toHaveChildren?.length ??
                        0,
                    itemBuilder: (BuildContext context, int index) {
                      ToHaveChildren toHaveChildren = accountSetupController
                          .appInitialModel.value.toHaveChildren![index];
                      return Obx(
                        () => RadioListTile(
                          title: Text(
                            toHaveChildren.childrenQueryType ?? "",
                            style: themeController.isDarkMode.value
                                ? dark.heading6
                                : light.heading6,
                          ),
                          value: toHaveChildren.id,
                          groupValue: controller.selectedChildrenId.value != 0
                              ? controller.selectedChildrenId.value
                              : accountSetupController
                                  .appInitialModel.value.zodiac![1].id,
                          onChanged: (value) {
                            controller.onRadioValueChange(
                              toHaveChildren.childrenQueryType!,
                              toHaveChildren.id!,
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
                      accountSetupController.toHaveChildrenMap['id'] =
                          controller.selectedChildrenId.toInt();
                      accountSetupController
                              .toHaveChildrenMap['children_query_type'] =
                          controller.selectedChildren.toString();

                      accountSetupController.updateUserProfileData();
                    },
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    accountSetupController.toHaveChildrenMap['id'] =
                        controller.selectedChildrenId.toInt();
                    accountSetupController
                            .toHaveChildrenMap['children_query_type'] =
                        controller.selectedChildren.toString();

                    accountSetupController.updateUserProfileData();
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
      ),
    );
  }
}
