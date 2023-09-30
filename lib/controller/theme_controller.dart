import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../utils/utils.dart';

class ThemeController extends GetxController {
  final _box = GetStorage();
  final _key = "isDarkMode";

  @override
  void onInit() {
    _isDarkMode.value = getThemeMode();
    super.onInit();
  }

  ThemeMode get theme => getThemeMode() ? ThemeMode.dark : ThemeMode.light;

  final RxBool _isDarkMode = false.obs;

  RxBool get isDarkMode => _isDarkMode;

  bool getThemeMode() {
    return _box.read(_key) ?? false;
  }

  void onDarkModeValueChange(bool isDark) {
    isDarkMode.value = isDark;
    setThemeMode(isDark);
    changeTheme();
    changeStatusBarColor(isDark);
  }

  void setThemeMode(bool isDarkMode) {
    _box.write(_key, isDarkMode);
  }

  void changeTheme() {
    Get.changeThemeMode(getThemeMode() ? ThemeMode.dark : ThemeMode.light);
  }
}
