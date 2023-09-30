import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../controller/account_setup/ideal_match_controller.dart';
import '../../controller/theme_controller.dart';
import '../../model/account_setup/app_initial_model.dart';
import '../../model/ideal_match_model.dart';
import '../../utils/colors.dart';
import '../../utils/strings.dart';
import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;
import '../widgets/common_app_bar.dart';
import '../widgets/custom_button.dart';
import 'gender_screen.dart';

// IdealMatchScreen
class IdealMatchScreen extends StatelessWidget {
  IdealMatchScreen({super.key});

  final IdealMatchController controller = Get.put(IdealMatchController());
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    final double itemHeight = (Get.height - kToolbarHeight - 24) / 7;
    final double itemWidth = Get.width / 2;

    return Obx(
      () => Scaffold(
        appBar: CommonAppBar(title: selectYourIdealMatch),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                selectYourIdealMatchMessage,
                style: themeController.isDarkMode.value
                    ? dark.bodyXLargeMedium900
                    : light.bodyXLargeMedium900,
              ),
            ),
            Expanded(
              child: Obx(
                () => GridView.count(
                  padding: const EdgeInsets.all(8.0),
                  crossAxisCount: 2,
                  childAspectRatio: (itemWidth / itemHeight),
                  shrinkWrap: true,
                  children: List.generate(
                      controller.accountSetupController.appInitialModel.value
                              .idealMatch?.length ??
                          0, (index) {
                    IdealMatch idealMatch = controller.accountSetupController
                        .appInitialModel.value.idealMatch![index];
                    return GestureDetector(
                      onTap: () {
                        idealMatch.isSelected.toggle();
                        controller.onIdealMatchSelectionChange(
                          idealMatch.id,
                          idealMatch.idealMatchName,
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: idealMatch.isSelected.value == true
                              ? Border.all(color: primaryColor, width: 3.0)
                              : Border.all(
                                  color: greyScale200Color, width: 2.0),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        margin: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            idealMatch.idealMatchName ?? "",
                            style: idealMatch.isSelected.value == true
                                ? themeController.isDarkMode.value
                                    ? dark.heading6Primary
                                    : light.heading6Primary
                                : themeController.isDarkMode.value
                                    ? dark.heading6
                                    : light.heading6,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Container(
              margin: const EdgeInsets.only(
                top: 10.0,
                bottom: 48.0,
                left: 16.0,
                right: 16.0,
              ),
              child: SizedBox(
                width: Get.width,
                child: CustomButton(
                  bgColor: primaryColor,
                  buttonText: continueText,
                  textColor: whiteColor,
                  cornerRadius: 100.0,
                  onPress: () {
                    idealMatchList.isNotEmpty
                        ? Get.to(GenderScreen())
                        : Fluttertoast.showToast(
                            msg: pleaseSelectAnyIdealMatch,
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
