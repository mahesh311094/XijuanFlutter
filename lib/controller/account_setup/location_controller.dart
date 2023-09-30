import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../../views/account_setup/privacy_screen.dart';
import '../../views/dashboard/main_screen.dart';
import 'account_setup_controller.dart';

class LocationController extends GetxController {
  final AccountSetupController accountSetupController =
      Get.put(AccountSetupController());
  final RxBool _showSpinner = false.obs;

  RxBool get showSpinner => _showSpinner;

  Future getCurrentLocation(bool isFirstTimeLogin) async {
    _showSpinner.value = true;
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (serviceEnabled) {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      } else if (permission == LocationPermission.deniedForever) {
        _showSpinner.value = false;
        return null;
      }
      return await getLocation(isFirstTimeLogin);
    }
    return null;
  }

  Future getLocation(bool isFirstTimeLogin) async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      double latitude = position.latitude;
      double longitude = position.longitude;
      accountSetupController.userProfileMap['last_latitude'] = latitude;
      accountSetupController.userProfileMap['last_longitude'] = longitude;

      debugPrint("=======lat:$latitude====long:$longitude");
      _showSpinner.value = false;
      if (isFirstTimeLogin) {
        Get.to(PrivacyScreen());
      } else {
        Get.to(MainScreen());
      }

      return position;
    } catch (e) {
      debugPrint("$e");
      return null;
    }
  }
}
