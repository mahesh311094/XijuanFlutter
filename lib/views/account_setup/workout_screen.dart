import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/account_setup/workout_controller.dart';
import '../../controller/theme_controller.dart';
import '../../model/account_setup/app_initial_model.dart';
import '../../utils/colors.dart';
import '../../utils/strings.dart';
import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;
import '../widgets/common_app_bar.dart';
import '../widgets/custom_button.dart';
import 'alcohol_screen.dart';

// WorkOutScreen
class WorkOutScreen extends StatelessWidget {
  WorkOutScreen({super.key});

  final WorkoutController controller = Get.put(WorkoutController());
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
                  doYouWorkout,
                  style: themeController.isDarkMode.value
                      ? dark.heading5
                      : light.heading5,
                ),
              ),
              const SizedBox(height: 20.0),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.accountSetupController.appInitialModel
                          .value.workoutDurationType?.length ??
                      0,
                  itemBuilder: (BuildContext context, int index) {
                    WorkoutDurationType workoutDurationType = controller
                        .accountSetupController
                        .appInitialModel
                        .value
                        .workoutDurationType![index];
                    return Obx(
                      () => RadioListTile(
                        title: Text(
                          workoutDurationType.workoutDurationType ?? "",
                          style: themeController.isDarkMode.value
                              ? dark.heading6
                              : light.heading6,
                        ),
                        value: workoutDurationType.id,
                        groupValue: controller.selectedWorkOutId.value != 0
                            ? controller.selectedWorkOutId.value
                            : controller.accountSetupController.appInitialModel
                                .value.workoutDurationType![1].id,
                        onChanged: (value) {
                          controller.onRadioValueChange(
                              workoutDurationType.workoutDurationType!,
                              workoutDurationType.id!);
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
                    controller.accountSetupController
                            .workoutDurationTypeMap['id'] =
                        controller.selectedWorkOutId.toInt();
                    controller.accountSetupController
                            .workoutDurationTypeMap['workout_duration_type'] =
                        controller.selectedWorkOut.toString();

                    Get.to(AlcoholScreen());
                  },
                ),
              ),
              GestureDetector(
                onTap: () {
                  controller
                          .accountSetupController.workoutDurationTypeMap['id'] =
                      controller.selectedWorkOutId.toInt();
                  controller.accountSetupController
                          .workoutDurationTypeMap['workout_duration_type'] =
                      controller.selectedWorkOut.toString();

                  Get.to(AlcoholScreen());
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
