import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../network/api_services.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/strings.dart';
import '../../utils/urls.dart';
import '../../views/forgot_password/forgot_password_screen2.dart';

class ForgotPassword1Controller extends GetxController {
  final NetworkRequest networkRequest = NetworkRequest();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final forgotPasswordKey = GlobalKey<FormState>();

  var selectedValue = "";
  final RxBool _smsSelected = false.obs;
  final RxBool _emailSelected = false.obs;
  final RxString _selectedCountryCode = defaultCountryCode.obs;
  final Rx<Color> _emailBackColor = greyScale50Color.obs;
  final Rx<Color> _emailBackDarkColor = dark2Color.obs;
  final Rx<Color> _emailIconColor = greyScale500Color.obs;
  final Rx<Color> _iconColor = greyScale500Color.obs;
  final Rx<Color> _backColor = greyScale50Color.obs;
  final Rx<Color> _backDarkColor = dark2Color.obs;
  final RxBool _showSpinner = false.obs;

  RxBool get smsSelected => _smsSelected;

  Rx<Color> get emailBackColor => _emailBackColor;

  Rx<Color> get emailBackDarkColor => _emailBackDarkColor;

  Rx<Color> get emailIconColor => _emailIconColor;

  Rx<Color> get iconColor => _iconColor;

  Rx<Color> get backColor => _backColor;

  Rx<Color> get backDarkColor => _backDarkColor;

  RxBool get emailSelected => _emailSelected;

  RxString get selectedCountryCode => _selectedCountryCode;

  RxBool get showSpinner => _showSpinner;

  void onSMSValueChange() {
    _smsSelected.value = true;
    _emailSelected.value = false;
  }

  void onEmailValueChange() {
    _emailSelected.value = true;
    _smsSelected.value = false;
    _selectedCountryCode.value = defaultCountryCode;
  }

  void onCountryCodeValueChange(String? value) {
    if (value != null) {
      _selectedCountryCode.value = value;
    }
  }

  void changeBackColor(Color color) {
    _backColor.value = color;
  }

  void changeBackDarkColor(Color color) {
    _backDarkColor.value = color;
  }

  void changeIconColor(Color color) {
    _iconColor.value = color;
  }

  void changeEmailBackColor(Color color) {
    _emailBackColor.value = color;
  }

  void changeEmailBackDarkColor(Color color) {
    _emailBackDarkColor.value = color;
  }

  void changeEmailIconColor(Color color) {
    _emailIconColor.value = color;
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

    if (response != null) {
      if (smsSelected.value) {
        selectedValue = "Mobile";
      } else {
        selectedValue = "Email";
      }

      Get.to(
        ForgotPasswordScreen2(
          mobileNo: mobile,
          countryCode: countryCode,
          email: email,
          selectedValue: selectedValue,
        ),
      );
    } else {
      Fluttertoast.showToast(msg: somethingWentWrong);
    }
  }
}
