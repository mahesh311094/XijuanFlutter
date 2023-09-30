import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/theme_controller.dart';
import '../../utils/colors.dart';
import '../../utils/strings.dart';
import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;
import '../widgets/app_bar_with_action_buttons.dart';
import 'new_match_screen.dart';

// MatchScreen
class ImageWithText {
  final String image;
  final String title;
  final String subTitle;

  ImageWithText(this.image, this.title, this.subTitle);
}

class MatchScreen extends StatelessWidget {
  MatchScreen({super.key});

  List<String> imageUrls = [
    'assets/images/girl_3.png',
    'assets/images/girl_2.png',
    'assets/images/girl_3.png',
    'assets/images/girl_1.png',
  ];

  final List<ImageWithText> imageUrls1 = [
    ImageWithText('assets/images/girl_2.png', 'Jannete', '23'),
    ImageWithText('assets/images/girl_3.png', 'Sarah', '25'),
    ImageWithText('assets/images/girl_1.png', 'Riana', '28'),
    ImageWithText('assets/images/girl_2.png', 'Jannete', '23'),
    ImageWithText('assets/images/girl_3.png', 'Sarah', '25'),
    ImageWithText('assets/images/girl_1.png', 'Riana', '28'),
    ImageWithText('assets/images/girl_3.png', 'Sarah', '25'),
  ];

  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithActionButtons(title: match),
      body: Obx(
        () => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 16.0, bottom: 16.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(newMatch,
                          style: themeController.isDarkMode.value
                              ? dark.heading5
                              : light.heading5),
                      GestureDetector(
                        onTap: () {
                          Get.to(NewMatchScreen());
                        },
                        child: Text(seeAll,
                            style: themeController.isDarkMode.value
                                ? dark.bodyLargeBoldPrimary
                                : light.bodyLargeBoldPrimary),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 300.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: imageUrls.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Stack(
                          fit: StackFit.passthrough,
                          children: [
                            Card(
                              color: themeController.isDarkMode.value
                                  ? dark4Color
                                  : primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(28.0),
                              ),
                              child: ShaderMask(
                                shaderCallback: (Rect bounds) {
                                  return const LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.center,
                                    colors: [
                                      primaryColor,
                                      Color(0X8C9610FF),
                                      Color(0X009610FF)
                                    ],
                                  ).createShader(bounds);
                                },
                                blendMode: BlendMode.srcATop,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(28.0),
                                  child: Image.asset(
                                    imageUrls[index],
                                    width: 200.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 16.0,
                              left: 16.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(dummyText8,
                                      style: themeController.isDarkMode.value
                                          ? dark.heading5White
                                          : light.heading5White),
                                  SizedBox(height: 4.0),
                                  Text(dummyText5,
                                      style: themeController.isDarkMode.value
                                          ? dark.bodyMediumMediumWhite
                                          : light.bodyMediumMediumWhite),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(yourMatch,
                          style: themeController.isDarkMode.value
                              ? dark.heading5
                              : light.heading5),
                      GestureDetector(
                        onTap: () {},
                        child: Text(seeAll,
                            style: themeController.isDarkMode.value
                                ? dark.bodyLargeBoldPrimary
                                : light.bodyLargeBoldPrimary),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 250.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: imageUrls1.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RoundedImageWithText(
                          imagePath: imageUrls1[index].image,
                          title: imageUrls1[index].title,
                          subtitle: imageUrls1[index].subTitle,
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RoundedImageWithText extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;

  RoundedImageWithText({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(24.0),
          child: Image.asset(
            imagePath,
            width: 140,
            height: 180,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 8.0),
        Text(title,
            style: themeController.isDarkMode.value
                ? dark.heading6
                : light.heading6),
        const SizedBox(height: 6.0),
        Text(subtitle,
            style: themeController.isDarkMode.value
                ? dark.bodyMediumSemiBold900
                : light.bodyMediumSemiBold900),
      ],
    );
  }
}
