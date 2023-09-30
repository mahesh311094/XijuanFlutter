import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../utils/utils.dart';
import '../../utils/strings.dart';
import '../dashboard/main_screen.dart';
import '../widgets/custom_button_with_icon.dart';
import '../widgets/custom_dialog.dart';

// PhotoVerificationScreen2
class PhotoVerificationScreen2 extends StatelessWidget {
  const PhotoVerificationScreen2({super.key});

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
                buttonText: secondPose,
                bgColor: primaryColor,
                cornerRadius: 100.0,
                onPress: () {
                  customDialog(
                    mainImage: 'assets/icons/premium.svg',
                    title: verified,
                    content: yourPhotoVerificationHasBeenDone,
                    buttonText: next,
                    isFrom: "Profile Screen",
                    screen: MainScreen(),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
