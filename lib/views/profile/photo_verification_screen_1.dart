import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/colors.dart';
import '../../utils/strings.dart';
import '../../utils/utils.dart';
import '../widgets/custom_button_with_icon.dart';
import 'photo_verification_screen_2.dart';

// PhotoVerificationScreen1
class PhotoVerificationScreen1 extends StatelessWidget {
  const PhotoVerificationScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    changeTransparentStatusBar();
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/girl_1.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomButtonWithIcon(
                textColor: whiteColor,
                buttonText: firstPose,
                bgColor: primaryColor,
                cornerRadius: 100.0,
                onPress: () {
                  Get.to(const PhotoVerificationScreen2());
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
