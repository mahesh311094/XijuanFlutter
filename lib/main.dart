import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'controller/theme_controller.dart';
import 'utils/colors.dart';
import 'utils/strings.dart';
import 'utils/utils.dart';
import 'views/on_boarding/splash_screen.dart';

void main() async {
  await GetStorage.init();
  await Firebase.initializeApp();
  getDeviceInfo();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final ThemeController controller = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    changeStatusBarColor(controller.isDarkMode.value);
    return GetMaterialApp(
      defaultTransition: Transition.rightToLeft,
      title: appName,
      debugShowCheckedModeBanner: false,
      themeMode: controller.theme,
      theme: ThemeData(
        fontFamily: fontFamily,
      ).copyWith(
        scaffoldBackgroundColor: whiteColor,
        unselectedWidgetColor: primaryColor,
        colorScheme:
            ThemeData().colorScheme.copyWith(primary: greyScale500Color),
      ),
      darkTheme: ThemeData(
        fontFamily: fontFamily,
      ).copyWith(
        scaffoldBackgroundColor: dark4Color,
        unselectedWidgetColor: primaryColor,
        colorScheme:
            ThemeData().colorScheme.copyWith(primary: greyScale500Color),
      ),
      home: const SplashScreen(),
    );
  }
}
