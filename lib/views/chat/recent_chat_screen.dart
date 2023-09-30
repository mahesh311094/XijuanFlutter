import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/theme_controller.dart';
import '../../utils/colors.dart';
import '../../utils/strings.dart';
import '../profile/invite_friends_screen.dart';
import 'chat_screen.dart';
import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;
import '../widgets/app_bar_with_action_buttons.dart';

// RecentChatScreen
class ChatList {
  final String profilePic;
  final String contactName;
  final String lastMessage;
  final int unReadMsgCount;
  final String timeAgo;

  ChatList({
    required this.profilePic,
    required this.contactName,
    required this.lastMessage,
    required this.unReadMsgCount,
    required this.timeAgo,
  });
}

class RecentChatScreen extends StatelessWidget {
  RecentChatScreen({super.key});

  final ThemeController themeController = Get.find();

  final List<ChatList> lastChats = [
    ChatList(
      profilePic: 'assets/images/girl_2.png',
      contactName: dummyText11,
      lastMessage: dummyText12,
      unReadMsgCount: 2,
      timeAgo: '20.00',
    ),
    ChatList(
      profilePic: 'assets/images/girl_2.png',
      contactName: dummyText11,
      lastMessage: dummyText12,
      unReadMsgCount: 10,
      timeAgo: '06.36',
    ),
    ChatList(
      profilePic: 'assets/images/girl_2.png',
      contactName: dummyText11,
      lastMessage: dummyText12,
      unReadMsgCount: 3,
      timeAgo: '10.55',
    ),
    ChatList(
      profilePic: 'assets/images/girl_2.png',
      contactName: dummyText11,
      lastMessage: dummyText12,
      unReadMsgCount: 1,
      timeAgo: 'Yesterday',
    ),
    ChatList(
      profilePic: 'assets/images/girl_2.png',
      contactName: dummyText11,
      lastMessage: dummyText12,
      unReadMsgCount: 0,
      timeAgo: 'May 20, 2023',
    ),
    ChatList(
      profilePic: 'assets/images/girl_2.png',
      contactName: dummyText11,
      lastMessage: dummyText12,
      unReadMsgCount: 0,
      timeAgo: 'Apr 1, 2023',
    ),
    ChatList(
      profilePic: 'assets/images/girl_2.png',
      contactName: dummyText11,
      lastMessage: dummyText12,
      unReadMsgCount: 2,
      timeAgo: '00.30',
    ),
  ];

  List<String> imageUrls = [
    'assets/images/girl_3.png',
    'assets/images/girl_2.png',
    'assets/images/girl_3.png',
    'assets/images/girl_1.png',
    'assets/images/girl_3.png',
    'assets/images/girl_2.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithActionButtons(title: chats),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(nowActive,
                        style: themeController.isDarkMode.value
                            ? dark.heading5
                            : light.heading5),
                    GestureDetector(
                      onTap: () {
                        Get.to(InviteFriendScreen());
                      },
                      child: Text(seeAll,
                          style: themeController.isDarkMode.value
                              ? dark.bodyLargeBoldPrimary
                              : light.bodyLargeBoldPrimary),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: SizedBox(
                  height: 100.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: imageUrls.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        child: CircleAvatar(
                          radius: 40.0,
                          backgroundImage: AssetImage(
                            imageUrls[index],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: lastChats.length,
                  itemBuilder: (BuildContext context, int index) {
                    final contact = lastChats[index];
                    return GestureDetector(
                      onTap: () {
                        Get.to(ChatScreen());
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 24.0,
                          backgroundImage: AssetImage(contact.profilePic),
                        ),
                        title: Text(contact.contactName,
                            style: themeController.isDarkMode.value
                                ? dark.heading6
                                : light.heading6),
                        subtitle: Text(contact.lastMessage,
                            style: themeController.isDarkMode.value
                                ? dark.bodyMediumMedium700
                                : light.bodyMediumMedium700),
                        trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            contact.unReadMsgCount > 0
                                ? Container(
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: purpleGradient,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        contact.unReadMsgCount.toString(),
                                        style: themeController.isDarkMode.value
                                            ? dark.bodyXSmallRegularWhite
                                            : light.bodyXSmallRegularWhite,
                                      ),
                                    ),
                                  )
                                : Container(
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.transparent,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Text(
                                        '',
                                        style: themeController.isDarkMode.value
                                            ? dark.bodyXSmallRegularWhite
                                            : light.bodyXSmallRegularWhite,
                                      ),
                                    ),
                                  ),
                            Text(
                              contact.timeAgo,
                              style: themeController.isDarkMode.value
                                  ? dark.bodyMediumMedium700
                                  : light.bodyMediumMedium700,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
