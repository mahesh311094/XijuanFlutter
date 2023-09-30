import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../model/on_boarding/common_model.dart';
import '../../network/api_services.dart';
import '../../utils/colors.dart';
import '../../utils/shared_preference.dart';
import '../../utils/strings.dart';
import '../../utils/urls.dart';
import '../../utils/utils.dart';
import '../../views/account_setup/per_location_screen.dart';
import '../../views/account_setup/per_notification_screen.dart';
import '../../views/dashboard/main_screen.dart';

class OTPController extends GetxController {
  final otpFormKey = GlobalKey<FormState>();

  final NetworkRequest networkRequest = NetworkRequest();

  final TextEditingController otpCode1Controller = TextEditingController();
  final TextEditingController otpCode2Controller = TextEditingController();
  final TextEditingController otpCode3Controller = TextEditingController();
  final TextEditingController otpCode4Controller = TextEditingController();

  final Rx<Color> _backColor1 = greyScale50Color.obs;
  final Rx<Color> _backColor2 = greyScale50Color.obs;
  final Rx<Color> _backColor3 = greyScale50Color.obs;
  final Rx<Color> _backColor4 = greyScale50Color.obs;
  final Rx<Color> _backDarkColor1 = dark2Color.obs;
  final Rx<Color> _backDarkColor2 = dark2Color.obs;
  final Rx<Color> _backDarkColor3 = dark2Color.obs;
  final Rx<Color> _backDarkColor4 = dark2Color.obs;
  final RxBool _showSpinner = false.obs;

  CommonModel? commonModel;
  String code = "";
  String refreshToken = "";
  String accessToken = "";
  String userId = "";
  bool status = false;
  bool isFirstTimeLogIn = true;

  RxBool get showSpinner => _showSpinner;

  Rx<Color> get backColor1 => _backColor1;

  Rx<Color> get backDarkColor1 => _backDarkColor1;

  Rx<Color> get backColor2 => _backColor2;

  Rx<Color> get backDarkColor2 => _backDarkColor2;

  Rx<Color> get backColor3 => _backColor3;

  Rx<Color> get backDarkColor3 => _backDarkColor3;

  Rx<Color> get backColor4 => _backColor4;

  Rx<Color> get backDarkColor4 => _backDarkColor4;

  void changeBackColor(Color color, int position) {
    if (position == 1) {
      _backColor1.value = color;
    } else if (position == 2) {
      _backColor2.value = color;
    } else if (position == 3) {
      _backColor3.value = color;
    } else if (position == 4) {
      _backColor4.value = color;
    }
  }

  void changeBackDarkColor(Color color, int position) {
    if (position == 1) {
      _backDarkColor1.value = color;
    } else if (position == 2) {
      _backDarkColor2.value = color;
    } else if (position == 3) {
      _backDarkColor3.value = color;
    } else if (position == 4) {
      _backDarkColor4.value = color;
    }
  }

  Future mobileVerification(
    String mobile,
    String countryCode,
    String otpCode,
  ) async {
    _showSpinner.value = true;
    bool status = false;
    var token = await FirebaseMessaging.instance.getToken();
    String? deviceName = SharedPreference().getDeviceName();
    String? deviceType = SharedPreference().getDeviceType();
    String? deviceVersion = SharedPreference().getDeviceVersion();
    String? appVersion = SharedPreference().getAppVersion();

    Map data = {
      "device_token": token,
      "device_type": deviceType ?? "",
      "device_name": deviceName ?? "",
      "device_version": deviceVersion ?? "",
      "app_version": appVersion ?? "",
      "mobile_number": mobile,
      "country_code": countryCode,
      "otp_code": otpCode
    };

    var response =
        await networkRequest.postRequest(mobileVerificationCode, data);
    _showSpinner.value = false;
    if (response != null) {
      commonModel = CommonModel.fromJson(response);
      status = commonModel?.status ?? false;
      refreshToken = commonModel?.refreshToken ?? "";
      accessToken = commonModel?.accessToken ?? "";
      userId = commonModel?.userId ?? "";
      isFirstTimeLogIn = commonModel?.isFirstTimeLogin ?? true;
      if (accessToken != "") {
        storeDataInSharedPref(accessToken, refreshToken, userId);
      }
    }

    if (status) {
      var getNotificationPermissionStatus =
          await checkNotificationPermissions();
      var getLocationPermissionStatus = await checkLocationPermissions();

      if (isFirstTimeLogIn ||
          getNotificationPermissionStatus.isDenied ||
          getNotificationPermissionStatus.isPermanentlyDenied) {
        Get.offAll(
          () =>
              PermissionNotificationsScreen(isFirstTimeLogin: isFirstTimeLogIn),
        );
      } else if (getLocationPermissionStatus == LocationPermission.denied ||
          getLocationPermissionStatus == LocationPermission.deniedForever) {
        Get.offAll(
          () => PerLocationScreen(isFirstTimeLogin: isFirstTimeLogIn),
        );
      } else {
        Get.offAll(() => MainScreen());
      }
    } else {
      Fluttertoast.showToast(
        msg: commonModel?.responseMessage ?? somethingWentWrong,
      );
    }
  }
}
