import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/strings.dart';
import '../../views/chat/recent_chat_screen.dart';
import '../../views/dashboard/home_screen.dart';
import '../../views/dashboard/match_screen.dart';
import '../../views/profile/profile_screen.dart';

class MainController extends GetxController {
  final RxInt _currentIndex = 0.obs;

  RxInt get currentIndex => _currentIndex;

  final List<String> menuItems = [home, match, chats, profile];

  final List<String> inactiveMenuIcons = [
    'assets/icons/home_light.svg',
    'assets/icons/heart_light.svg',
    'assets/icons/chat_light.svg',
    'assets/icons/profile_light.svg',
  ];

  final List<String> activeMenuIcons = [
    'assets/icons/home_bold.svg',
    'assets/icons/heart_bold.svg',
    'assets/icons/chat_bold.svg',
    'assets/icons/profile_bold.svg',
  ];

  final List<Widget> screens = [
    HomeScreen(),
    MatchScreen(),
    RecentChatScreen(),
    ProfileScreen(),
  ];
}
