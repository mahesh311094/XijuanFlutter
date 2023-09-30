import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/on_boarding/intro_slider_controller.dart';
import '../../controller/theme_controller.dart';
import '../../utils/colors.dart';
import '../../utils/strings.dart';
import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;
import '../widgets/custom_button.dart';
import 'signup_as_screen.dart';

// IntroSlider
class IntroSlider extends StatelessWidget {
  IntroSlider({super.key});

  final IntroSliderController controller = Get.put(IntroSliderController());
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: PageView.builder(
                    itemCount: controller.imageList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: controller.imageList[index],
                            height: 300.0,
                          ),
                          const SizedBox(height: 20.0),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                              left: 18,
                              right: 18,
                            ),
                            child: Text(
                              controller.textList[index],
                              textAlign: TextAlign.center,
                              style: themeController.isDarkMode.value
                                  ? dark.heading3
                                  : light.heading3,
                            ),
                          )
                        ],
                      );
                    },
                    onPageChanged: (int index) {
                      controller.onImageIndexChange(index);
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildIndicators(),
                ),
                Container(
                  width: Get.width,
                  padding: const EdgeInsets.only(bottom: 20.0, top: 32.0),
                  child: CustomButton(
                    bgColor: primaryColor,
                    buttonText: next,
                    cornerRadius: 100.0,
                    textColor: whiteColor,
                    onPress: () {
                      Get.to(SignupAs());
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildIndicators() {
    List<Widget> indicators = [];
    for (int i = 0; i < controller.imageList.length; i++) {
      indicators.add(
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: Container(
            width: controller.currentImageIndex.value == i ? 28.0 : 8.0,
            height: 8.0,
            decoration: controller.currentImageIndex.value == i
                ? BoxDecoration(
                    gradient: purpleGradient,
                    borderRadius: BorderRadius.circular(5.0),
                  )
                : BoxDecoration(
                    color: greyScale300Color,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
          ),
        ),
      );
    }
    return indicators;
  }
}
