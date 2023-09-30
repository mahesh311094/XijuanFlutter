import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../controller/theme_controller.dart';
import '../../model/chat_model.dart';
import '../../utils/colors.dart';
import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;
import '../../utils/utils.dart';
import '../../utils/strings.dart';
import '../widgets/chat_app_bar.dart';
import '../widgets/chat_text_form_field.dart';
import '../widgets/message_widget.dart';
import 'audio_call_screen.dart';
import 'video_call_screen.dart';

// ChatScreen
class ChatScreen extends StatelessWidget {
  ChatScreen({Key? key}) : super(key: key);

  final ThemeController themeController = Get.find();
  final List<ChatModel> chatList = [
    ChatModel(
      message: "Hi, good evening Natasha... 😁😁",
      time: "20:00",
      userId: "1",
    ),
    ChatModel(
      message:
          "It seems we have a lot in common & have a lot of interest in each other 😂",
      time: "20:00",
      userId: "1",
    ),
    ChatModel(
      message: "Hello, evening too Andrew",
      time: "20:01",
      userId: "2",
    ),
    ChatModel(
      message: "Haha, yes I've seen your profile and I'm a perfect match 🤗🤗",
      time: "20:01",
      userId: "3",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatAppBar(
        title: "Natasha Winkles",
        onCallClick: () {
          changeTransparentStatusBar();
          Get.to(AudioCallScreen());
        },
        onVideoClick: () {
          changeTransparentStatusBar();
          Get.to(const VideoCallScreen());
        },
        onMoreClick: () {},
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                flex: 9,
                child: ListView.builder(
                  itemCount: chatList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Column(
                        crossAxisAlignment: chatList[index].userId == "1"
                            ? CrossAxisAlignment.end
                            : CrossAxisAlignment.start,
                        children: [
                          Obx(
                            () => MessageWidget(
                              isLeft: chatList[index].userId != "1",
                              color: chatList[index].userId == "1"
                                  ? primary5Color
                                  : greyScale100Color,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Expanded(
                                    flex: 85,
                                    child: Text(
                                      chatList[index].message,
                                      style: themeController.isDarkMode.value
                                          ? dark.bodyXLargeMediumBlack
                                          : light.bodyXLargeMediumBlack,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 15,
                                    child: Center(
                                      child: Text(
                                        chatList[index].time,
                                        style: chatList[index].userId == "1"
                                            ? themeController.isDarkMode.value
                                                ? dark.bodySmallMediumBlack
                                                : light.bodySmallMediumBlack
                                            : themeController.isDarkMode.value
                                                ? dark.bodySmallMedium500
                                                : light.bodySmallMedium500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      flex: 9,
                      child: ChatTextFormField(
                        prefixIconPath: "assets/icons/ic_smily.svg",
                        suffixIconPath1: "assets/icons/ic_attachment.svg",
                        suffixIconPath2: "assets/icons/ic_camera.svg",
                        text: "Type a message ...",
                      ),
                    ),
                    const SizedBox(width: 16),
                    SizedBox(
                      height: 52,
                      width: 52,
                      child: FittedBox(
                        child: FloatingActionButton(
                          backgroundColor: primaryColor,
                          child: GestureDetector(
                            onTap: () {
                              _showBottomSheet();
                            },
                            child: SvgPicture.asset(
                              "assets/icons/ic_mic.svg",
                              width: 18.0,
                              height: 18.0,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _showBottomSheet() {
  Get.generalDialog(
    barrierLabel: "Label",
    barrierDismissible: true,
    barrierColor: Colors.transparent,
    pageBuilder: (context, anim1, anim2) {
      final ThemeController themeController = Get.find();
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 200.0,
          margin: const EdgeInsets.only(bottom: 70),
          decoration: const BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(80.0),
              topRight: Radius.circular(80.0),
            ),
          ),
          child: Material(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 36.0,
                          backgroundColor: orangeColor,
                          child: SvgPicture.asset(
                            'assets/icons/document.svg',
                            colorFilter: const ColorFilter.mode(
                                whiteColor, BlendMode.srcIn),
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          document,
                          style: themeController.isDarkMode.value
                              ? dark.bodyLargeSemiBold800
                              : light.bodyLargeSemiBold800,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 36.0,
                          backgroundColor: primaryColor,
                          child: SvgPicture.asset(
                            'assets/icons/image.svg',
                            colorFilter: const ColorFilter.mode(
                                whiteColor, BlendMode.srcIn),
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          gallery,
                          style: themeController.isDarkMode.value
                              ? dark.bodyLargeSemiBold800
                              : light.bodyLargeSemiBold800,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 36.0,
                          backgroundColor: greenColor,
                          child: SvgPicture.asset(
                            'assets/icons/audio.svg',
                            colorFilter: const ColorFilter.mode(
                                whiteColor, BlendMode.srcIn),
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          audio,
                          style: themeController.isDarkMode.value
                              ? dark.bodyLargeSemiBold800
                              : light.bodyLargeSemiBold800,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}
