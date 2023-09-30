import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../model/on_boarding/common_model.dart';
import '../../network/api_services.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/shared_preference.dart';
import '../../utils/strings.dart';
import '../../utils/urls.dart';
import '../../utils/utils.dart';
import '../../views/on_boarding/otp_screen.dart';

class SignInMobileController extends GetxController {
  final NetworkRequest networkRequest = NetworkRequest();
  final TextEditingController mobileController = TextEditingController();
  final signInMobileKey = GlobalKey<FormState>();

  final RxString _selectedCountryCode = defaultCountryCode.obs;
  final Rx<Color> _backColor = greyScale50Color.obs;
  final Rx<Color> _backDarkColor = dark2Color.obs;
  final RxBool _showSpinner = false.obs;

  CommonModel? commonModel;
  bool status = false;
  String refreshToken = "";
  String accessToken = "";
  String userId = "";

  RxBool get showSpinner => _showSpinner;

  RxString get selectedCountryCode => _selectedCountryCode;

  Rx<Color> get backColor => _backColor;

  Rx<Color> get backDarkColor => _backDarkColor;

  void onCountryCodeValueChange(String? value) {
    if (value != null) {
      _selectedCountryCode.value = value;
    }
  }

  Future logInUserWithMobile(String mobile, String countryCode) async {
    _showSpinner.value = true;
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
      "mobile": mobile,
      "country-code": countryCode
    };

    var response = await networkRequest.postRequest(loginWithMobile, data);
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
        OtpScreen(
          countryCode: countryCode,
          mobileNo: mobile,
        ),
      );
    } else {
      Fluttertoast.showToast(
        msg: commonModel?.responseMessage ?? somethingWentWrong,
      );
    }
  }
}
