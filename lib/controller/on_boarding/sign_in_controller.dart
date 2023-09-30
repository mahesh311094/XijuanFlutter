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

class SignInController extends GetxController {
  final NetworkRequest networkRequest = NetworkRequest();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final signInKey = GlobalKey<FormState>();

  final Rx<Color> _backColor = greyScale50Color.obs;
  final Rx<Color> _backDarkColor = dark2Color.obs;
  final Rx<Color> _iconColor = greyScale500Color.obs;
  final Rx<Color> _backColor2 = greyScale50Color.obs;
  final Rx<Color> _backDarkColor2 = dark2Color.obs;
  final Rx<Color> _iconColor2 = greyScale500Color.obs;
  final RxBool _showSpinner = false.obs;
  final RxBool _isObscure = true.obs;
  final RxBool _selectedCheckbox = false.obs;

  CommonModel? commonModel;
  bool status = false;
  bool isFirstTimeLogIn = true;
  String accessToken = "";
  String refreshToken = "";
  String userId = "";

  RxBool get isObscure => _isObscure;

  RxBool get showSpinner => _showSpinner;

  Rx<Color> get backColor => _backColor;

  Rx<Color> get backDarkColor => _backDarkColor;

  Rx<Color> get iconColor => _iconColor;

  Rx<Color> get backColor2 => _backColor2;

  Rx<Color> get backDarkColor2 => _backDarkColor2;

  Rx<Color> get iconColor2 => _iconColor2;

  RxBool get selectedCheckbox => _selectedCheckbox;

  @override
  void onInit() {
    String? userEmail = SharedPreference().getUserEmail();
    String? userPassword = SharedPreference().getUserPassword();

    emailController.text = userEmail ?? "";
    passwordController.text = userPassword ?? "";

    if (userEmail != null) {
      _selectedCheckbox.value = true;
    }
    super.onInit();
  }

  void onCheckboxValueChange(bool isSelected, String email, String password) {
    _selectedCheckbox.value = isSelected;
    if (isSelected) {
      rememberMeInSharedPref(email, password);
    } else {
      removeRememberMeSharedPref();
    }
  }

  void changeBackColor(Color color, int position) {
    if (position == 1) {
      _backColor.value = color;
    } else if (position == 2) {
      _backColor2.value = color;
    }
  }

  void changeBackDarkColor(Color color, int position) {
    if (position == 1) {
      _backDarkColor.value = color;
    } else if (position == 2) {
      _backDarkColor2.value = color;
    }
  }

  void changeIconColor(Color color, int position) {
    if (position == 1) {
      _iconColor.value = color;
    } else if (position == 2) {
      _iconColor2.value = color;
    }
  }

  void onChangeVisibility(bool value) {
    _isObscure.value = !value;
  }

  Future logInUserWithEmail(String email, String password) async {
    _showSpinner.value = true;
    String? token = await FirebaseMessaging.instance.getToken();
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
      "email": email,
      "password": password
    };

    var response = await networkRequest.postRequest(loginWithEmail, data);
    _showSpinner.value = false;
    if (response != null) {
      commonModel = CommonModel.fromJson(response);
      status = commonModel?.status ?? false;
      refreshToken = commonModel?.refreshToken ?? "";
      accessToken = commonModel?.accessToken ?? "";
      userId = commonModel?.userId ?? "";
      isFirstTimeLogIn = commonModel?.isFirstTimeLogin ?? false;
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
