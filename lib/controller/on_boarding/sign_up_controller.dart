import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../model/on_boarding/common_model.dart';
import '../../network/api_services.dart';
import '../../utils/colors.dart';
import '../../utils/shared_preference.dart';
import '../../utils/strings.dart';
import '../../utils/urls.dart';
import '../../utils/utils.dart';
import '../../views/account_setup/per_notification_screen.dart';

class SignUpController extends GetxController {
  final NetworkRequest networkRequest = NetworkRequest();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final signUpKey = GlobalKey<FormState>();

  final Rx<Color> _backColor = greyScale50Color.obs;
  final Rx<Color> _backDarkColor = dark2Color.obs;
  final Rx<Color> _iconColor = greyScale500Color.obs;
  final Rx<Color> _backColor2 = greyScale50Color.obs;
  final Rx<Color> _backDarkColor2 = dark2Color.obs;
  final Rx<Color> _iconColor2 = greyScale500Color.obs;
  final RxBool _selectedCheckbox = false.obs;
  final RxBool _showSpinner = false.obs;
  final RxBool _isObscure = true.obs;

  CommonModel? commonModel;
  bool status = false;
  String refreshToken = "";
  String accessToken = "";
  String userId = "";
  String? deviceName, deviceType, deviceVersion, appVersion;

  RxBool get isObscure => _isObscure;

  Rx<Color> get backColor => _backColor;

  Rx<Color> get backDarkColor => _backDarkColor;

  Rx<Color> get iconColor => _iconColor;

  Rx<Color> get backColor2 => _backColor2;

  Rx<Color> get backDarkColor2 => _backDarkColor2;

  Rx<Color> get iconColor2 => _iconColor2;

  RxBool get showSpinner => _showSpinner;

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

  Future addUser(String email, String password) async {
    _showSpinner.value = true;
    var token = await FirebaseMessaging.instance.getToken();
    deviceName = SharedPreference().getDeviceName();
    deviceType = SharedPreference().getDeviceType();
    deviceVersion = SharedPreference().getDeviceVersion();
    appVersion = SharedPreference().getAppVersion();

    Map data = {
      "device_token": token,
      "device_type": deviceType ?? "",
      "device_name": deviceName ?? "",
      "device_version": deviceVersion ?? "",
      "app_version": appVersion ?? "",
      "email": email,
      "first_name": "",
      "last_name": "",
      "profile_pic": "",
      "social_account_name": "",
      "password": password
    };

    var response =
        await networkRequest.postRequest(registerUserAccountWithEmail, data);
    _showSpinner.value = false;
    if (response != null) {
      commonModel = CommonModel.fromJson(response);
      status = commonModel?.status ?? false;
      refreshToken = commonModel?.refreshToken ?? "";
      accessToken = commonModel?.accessToken ?? "";
      userId = commonModel?.userId ?? "";
      if (accessToken != "") {
        storeDataInSharedPref(accessToken, refreshToken, userId);
      }
    }

    if (status) {
      Get.to(
        PermissionNotificationsScreen(isFirstTimeLogin: true),
      );
    } else {
      Fluttertoast.showToast(
        msg: commonModel?.responseMessage ?? somethingWentWrong,
      );
    }
  }
}
