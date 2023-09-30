import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../controller/theme_controller.dart';
import '../../utils/colors.dart';
import '../../utils/shared_preference.dart';
import '../../utils/strings.dart';
import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;
import '../dashboard/main_screen.dart';
import 'intro_slider_screen.dart';

// SplashScreen
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  final ThemeController themeController = Get.find();

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () async {
      String? userId = SharedPreference().getUserId();
      if (userId == null) {
        Get.off(() => IntroSlider());
      } else {
        Get.off(() => MainScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Obx(
              () => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 64),
                  SvgPicture.asset(
                    themeController.isDarkMode.value
                        ? 'assets/images/light_logo.svg'
                        : 'assets/images/logo.svg',
                    height: 120.0,
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    splashScreenText,
                    textAlign: TextAlign.center,
                    style: themeController.isDarkMode.value
                        ? dark.customFont4
                        : light.customFont4,
                  ),
                  const SizedBox(height: 78.0),
                  const SpinKitCircle(
                    color: primaryColor,
                    size: 60.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
