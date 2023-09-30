import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../controller/profile/faq_controller.dart';
import '../../controller/theme_controller.dart';
import '../../utils/colors.dart';
import '../../utils/strings.dart';
import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;
import '../widgets/custom_text_form_field.dart';

// FAQScreen
class FAQScreen extends StatelessWidget {
  FAQScreen({super.key});

  final TextEditingController searchController = TextEditingController();
  final ThemeController themeController = Get.find();
  final FaqController controller = Get.put(FaqController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 11.0,
          vertical: 24.0,
        ),
        child: Column(
          children: [
            CustomTextFormField(
              textEditingController: searchController,
              prefixIconPath: 'assets/icons/search.svg',
              hintText: search,
              iconColor: controller.iconColor.value,
              backGroundColor: themeController.isDarkMode.value
                  ? controller.backDarkColor.value
                  : controller.backColor.value,
              onTap: () {
                if (themeController.isDarkMode.value) {
                  controller.changeBackDarkColor(primary4Color);
                } else {
                  controller.changeBackColor(primary4Color);
                }
                controller.changeIconColor(primaryColor);
              },
            ),
            const SizedBox(height: 10.0),
            Expanded(
              child: ListView(
                children: [
                  FAQItem(
                    question: howToSwipeMatch,
                    answer: dummyText10,
                  ),
                  const SizedBox(height: 16.0),
                  FAQItem(
                    question: howDoIEditMyProfile,
                    answer: dummyText10,
                  ),
                  const SizedBox(height: 16.0),
                  FAQItem(
                    question: howToGetMoreLikes,
                    answer: dummyText10,
                  ),
                  const SizedBox(height: 16.0),
                  FAQItem(
                    question: howToGetMoreMatches,
                    answer: dummyText10,
                  ),
                  const SizedBox(height: 16.0),
                  FAQItem(
                    question: iAmOutOfProfilesToSwipeThrough,
                    answer: dummyText10,
                  ),
                  const SizedBox(height: 16.0),
                  FAQItem(
                    question: howNotToMissNewMessage,
                    answer: dummyText10,
                  ),
                  const SizedBox(height: 16.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FAQItem extends StatelessWidget {
  final String question;
  final String answer;

  FAQItem({super.key, required this.question, required this.answer});

  final FaqController controller = Get.put(FaqController());
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Card(
        elevation: 2.0,
        color: themeController.isDarkMode.value ? dark2Color : whiteColor,
        shadowColor: greyScale50Color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: BorderSide(
            color: themeController.isDarkMode.value ? dark2Color : whiteColor,
            width: 1.0,
          ),
        ),
        child: ExpansionTile(
          title: Text(
            question,
            style: themeController.isDarkMode.value
                ? dark.heading6
                : light.heading6,
          ),
          onExpansionChanged: (expanded) {
            controller.onExpansionValueChange(expanded);
          },
          trailing: SvgPicture.asset(
            'assets/icons/down_arrow.svg',
            colorFilter: ColorFilter.mode(
              themeController.isDarkMode.value ? whiteColor : primaryColor,
              BlendMode.srcIn,
            ),
          ),
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Divider(
                color: greyScale200Color,
                thickness: 1.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 8.0,
                left: 24.0,
                right: 24.0,
                bottom: 24.0,
              ),
              child: Text(
                answer,
                style: themeController.isDarkMode.value
                    ? dark.bodyMediumMedium800
                    : light.bodyMediumMedium800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
