import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../controller/theme_controller.dart';
import '../../utils/colors.dart';
import '../../utils/strings.dart';
import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;
import 'match_accept_screen.dart';

// NewMatchScreen
class NewMatchScreen extends StatelessWidget {
  NewMatchScreen({super.key});

  final List<String> imageUrls = [
    'assets/images/girl_2.png',
    'assets/images/girl_3.png',
    'assets/images/girl_1.png',
    'assets/images/girl_2.png',
    'assets/images/girl_3.png',
    'assets/images/girl_1.png',
    'assets/images/girl_2.png',
    'assets/images/girl_3.png',
  ];
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor:
              themeController.isDarkMode.value ? dark4Color : whiteColor,
          elevation: 0,
          title: Text(
            newMatch,
            style: themeController.isDarkMode.value
                ? dark.heading5
                : light.heading5,
          ),
          leading: IconButton(
            icon: SvgPicture.asset(
              'assets/icons/left_arrow.svg',
              colorFilter: ColorFilter.mode(
                themeController.isDarkMode.value
                    ? whiteColor
                    : greyScale900Color,
                BlendMode.srcIn,
              ),
            ),
            onPressed: () {
              Get.back();
            },
          ),
          actions: [
            IconButton(
              icon: SvgPicture.asset(
                'assets/icons/search.svg',
                colorFilter: ColorFilter.mode(
                  themeController.isDarkMode.value
                      ? whiteColor
                      : greyScale900Color,
                  BlendMode.srcIn,
                ),
              ),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            children: List.generate(imageUrls.length, (index) {
              return GestureDetector(
                onTap: () {
                  Get.to(MatchAcceptScreen());
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 4.0,
                    right: 4.0,
                    bottom: 4.0,
                  ),
                  child: Stack(
                    fit: StackFit.passthrough,
                    children: [
                      Card(
                        color: primary4Color,
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
                            const SizedBox(height: 4.0),
                            Text(dummyText5,
                                style: themeController.isDarkMode.value
                                    ? dark.bodyMediumMediumWhite
                                    : light.bodyMediumMediumWhite),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
