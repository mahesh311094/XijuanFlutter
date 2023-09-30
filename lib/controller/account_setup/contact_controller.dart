import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';
import '../../utils/constants.dart';
import 'account_setup_controller.dart';

class ContactController extends GetxController {
  final AccountSetupController accountSetupController = Get.find();
  final contactKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();

  final RxString _selectedCountryCode = defaultCountryCode.obs;
  final Rx<Color> _backColor = greyScale50Color.obs;
  final Rx<Color> _backDarkColor = dark2Color.obs;
  final Rx<Color> _emailBackColor = greyScale50Color.obs;
  final Rx<Color> _emailBackDarkColor = dark2Color.obs;
  final Rx<Color> _emailIconColor = greyScale500Color.obs;

  RxString get selectedCountryCode => _selectedCountryCode;

  Rx<Color> get backColor => _backColor;

  Rx<Color> get backDarkColor => _backDarkColor;

  Rx<Color> get emailBackColor => _emailBackColor;

  Rx<Color> get emailBackDarkColor => _emailBackDarkColor;

  Rx<Color> get emailIconColor => _emailIconColor;

  @override
  void onInit() {
    emailController.text =
        accountSetupController.userProfileResModel.value.userProfile?.email ??
            "";
    mobileController.text =
        accountSetupController.userProfileResModel.value.userProfile?.mobile ??
            "";
    _selectedCountryCode.value = accountSetupController
            .userProfileResModel.value.userProfile?.countryCellCode ??
        "";
    super.onInit();
  }

  void onCountryCodeValueChange(String? value) {
    if (value != null) {
      _selectedCountryCode.value = value;
    }
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
}
