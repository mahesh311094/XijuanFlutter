import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'colors.dart';
import 'constants.dart';

final box = GetStorage();

// Swipe
enum Swipe { left, right, none }

// This function is use for hide characters
String hideCharacters(String input) {
  String firstTwo = input.substring(0, 4);
  String lastTwo = input.substring(input.length - 2);

  String hiddenCharacters = '';
  for (int i = 2; i < input.length - 2; i++) {
    hiddenCharacters += '*';
  }

  return firstTwo + hiddenCharacters + lastTwo;
}

// This function is use for change status bar color
void changeTransparentStatusBar() {
  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
  } else if (Platform.isIOS) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
    ));
  }
}

// This function is use for set status bar color
void changeStatusBarColor(bool isDarkMode) {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: isDarkMode ? dark4Color : whiteColor,
      statusBarBrightness: isDarkMode ? Brightness.light : Brightness.dark,
      statusBarIconBrightness: isDarkMode ? Brightness.light : Brightness.dark,
    ),
  );
}

// This function is use for request notification permissions
Future<PermissionStatus> checkNotificationPermissions() async {
  PermissionStatus status = await Permission.notification.request();
  debugPrint("===========requestNotificationPermissions===$status");
  return status;
}

// This function is use for check location permissions
Future<LocationPermission?> checkLocationPermissions() async {
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (serviceEnabled) {
    LocationPermission permission = await Geolocator.checkPermission();
    return permission;
  } else {
    return null;
  }
}

void getDeviceInfo() async {
  WidgetsFlutterBinding.ensureInitialized();

  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  PackageInfo packageInfo = await PackageInfo.fromPlatform();

  var appVersion = packageInfo.version;
  var deviceName = "";
  final deviceType = Platform.operatingSystem;
  final deviceVersion = Platform.operatingSystemVersion;

  // Method to save a value in shared preferences
  void setDeviceInfo(
      String dName, String dType, String dVersion, String aVersion) {
    box.write(sharedPrefDeviceName, dName);
    box.write(sharedPrefDeviceType, dType);
    box.write(sharedPrefDeviceVersion, dVersion);
    box.write(sharedPrefAppVersion, aVersion);
  }

  if (Platform.isAndroid) {
    AndroidDeviceInfo info = await deviceInfo.androidInfo;
    deviceName = info.model;
  } else if (Platform.isIOS) {
    IosDeviceInfo info = await deviceInfo.iosInfo;
    deviceName = info.model;
    // print(info.toMap());
  }

  setDeviceInfo(deviceName, deviceType, deviceVersion, appVersion);
}

void storeDataInSharedPref(
    String accessToken, String refreshToken, String? userId) {
  box.write(sharedPrefAccessToken, "Bearer $accessToken");
  box.write(sharedPrefRefreshToken, refreshToken);

  if (userId != null) {
    box.write(sharedPrefUserId, userId);
  }
}

void rememberMeInSharedPref(String emailId, String password) {
  box.write(sharedPrefEmailId, emailId);
  box.write(sharedPrefPassword, password);
}

void removeRememberMeSharedPref() {
  box.remove(sharedPrefEmailId);
  box.remove(sharedPrefPassword);
}

void clearSharedPrefOnLogout() {
  box.remove(sharedPrefRefreshToken);
  box.remove(sharedPrefAccessToken);
  box.remove(sharedPrefUserId);
}

// For responsive text size
double sdp(double dp) {
  return (dp / 300) * Get.width;
}
