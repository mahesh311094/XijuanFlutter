import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../controller/theme_controller.dart';
import '../../controller/widgets/date_controller.dart';
import '../../model/account_setup/app_initial_model.dart';
import '../../model/interested_gender_model.dart';
import '../../utils/colors.dart';
import '../../utils/strings.dart';
import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;
import '../widgets/common_app_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_checkbox.dart';
import 'contact_screen.dart';

// DateScreen
class DateScreen extends StatelessWidget {
  DateScreen({super.key});

  final DateController controller = Get.put(DateController());
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
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Obx(
                () => Text(
                  whatGenderWouldYouLikeToDate,
                  style: themeController.isDarkMode.value
                      ? dark.heading5
                      : light.heading5,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: controller.accountSetupController
                        .appInitialModel.value.gender?.length ??
                    0,
                itemBuilder: (context, index) {
                  return Obx(() {
                    Gender gender = controller.accountSetupController
                        .appInitialModel.value.gender![index];
                    return CustomCheckbox(
                      label: gender.gender ?? "",
                      value: gender.isSelected.value,
                      onChanged: (bool value) {
                        gender.isSelected.toggle();
                        controller.onSelectionChange(
                          gender.id,
                          gender.gender,
                        );
                      },
                    );
                  });
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0, bottom: 32.0),
              child: CustomButton(
                bgColor: disabledButtonColor,
                buttonText: continueText,
                textColor: whiteColor,
                cornerRadius: 100.0,
                onPress: () {
                  interestedGenderList.isNotEmpty
                      ? Get.to(ContactScreen())
                      : Fluttertoast.showToast(msg: pleaseSelectAnyInterestedGender);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
