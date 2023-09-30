import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';

// VideoCallScreen
class VideoCallScreen extends StatelessWidget {
  const VideoCallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            height: Get.height,
            width: Get.width,
            "assets/images/video_girl.png",
            fit: BoxFit.fill,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: SvgPicture.asset(
                      'assets/icons/left_arrow.svg',
                      colorFilter:
                          const ColorFilter.mode(whiteColor, BlendMode.srcIn),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 32,
            child: SizedBox(
              width: Get.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: CircleAvatar(
                      radius: 28,
                      backgroundColor: grey32Transparent,
                      child: SvgPicture.asset(
                        'assets/icons/ic_volume_up.svg',
                        height: 22,
                      ),
                    ),
                  ),
                  const SizedBox(width: 18),
                  GestureDetector(
                    onTap: () {},
                    child: CircleAvatar(
                      radius: 28,
                      backgroundColor: grey32Transparent,
                      child: SvgPicture.asset(
                        'assets/icons/ic_video_fill.svg',
                        height: 22,
                      ),
                    ),
                  ),
                  const SizedBox(width: 18),
                  GestureDetector(
                    onTap: () {},
                    child: CircleAvatar(
                      radius: 28,
                      backgroundColor: grey32Transparent,
                      child: SvgPicture.asset(
                        'assets/icons/ic_mic.svg',
                        height: 22,
                      ),
                    ),
                  ),
                  const SizedBox(width: 18),
                  GestureDetector(
                    onTap: () {},
                    child: CircleAvatar(
                      radius: 28,
                      backgroundColor: errorColor,
                      child: SvgPicture.asset(
                        'assets/icons/ic_call_missed.svg',
                        height: 22,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            right: 16,
            child: Image.asset(
              "assets/images/add_user.png",
              height: 164,
            ),
          ),
        ],
      ),
    );
  }
}
