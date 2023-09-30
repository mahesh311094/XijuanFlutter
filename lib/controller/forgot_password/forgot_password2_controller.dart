import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../network/api_services.dart';
import '../../utils/colors.dart';
import '../../utils/strings.dart';
import '../../utils/urls.dart';

class ForgotPassword2Controller extends GetxController {
  final forgotOtpFormKey = GlobalKey<FormState>();

  final NetworkRequest networkRequest = NetworkRequest();

  final TextEditingController otpCode1Controller = TextEditingController();
  final TextEditingController otpCode2Controller = TextEditingController();
  final TextEditingController otpCode3Controller = TextEditingController();
  final TextEditingController otpCode4Controller = TextEditingController();

  final RxBool _showSpinner = false.obs;

  final Rx<Color> _backColor1 = greyScale50Color.obs;
  final Rx<Color> _backColor2 = greyScale50Color.obs;
  final Rx<Color> _backColor3 = greyScale50Color.obs;
  final Rx<Color> _backColor4 = greyScale50Color.obs;
  final Rx<Color> _backDarkColor1 = dark2Color.obs;
  final Rx<Color> _backDarkColor2 = dark2Color.obs;
  final Rx<Color> _backDarkColor3 = dark2Color.obs;
  final Rx<Color> _backDarkColor4 = dark2Color.obs;

  RxBool isTimerRunning = false.obs;
  String code = "";
  RxInt seconds = 60.obs;
  Timer? timer;

  Rx<Color> get backColor1 => _backColor1;

  Rx<Color> get backDarkColor1 => _backDarkColor1;

  Rx<Color> get backColor2 => _backColor2;

  Rx<Color> get backDarkColor2 => _backDarkColor2;

  Rx<Color> get backColor3 => _backColor3;

  Rx<Color> get backDarkColor3 => _backDarkColor3;

  Rx<Color> get backColor4 => _backColor4;

  Rx<Color> get backDarkColor4 => _backDarkColor4;

  RxBool get showSpinner => _showSpinner;

  @override
  void onInit() {
    startTimer();
    super.onInit();
  }

  void startTimer() {
    isTimerRunning.value = true;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds.value > 0) {
        seconds.value--;
      } else {
        stopTimer();
      }
    });
  }

  void stopTimer() {
    timer?.cancel();
    seconds.value = 60;
    isTimerRunning.value = false;
  }

  @override
  void onClose() {
    stopTimer();
    super.onClose();
  }

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

  forgetPassword({String? mobile, String? countryCode, String? email}) async {
    _showSpinner.value = true;

    Map data = {
      "mobile": mobile ?? "",
      "country_cell_code": countryCode ?? "",
      "email": email ?? "",
    };

    var response = await networkRequest.postRequest(getForgetPassword, data);

    _showSpinner.value = false;

    if (response == null) {
      Fluttertoast.showToast(msg: somethingWentWrong);
    }
  }
}
