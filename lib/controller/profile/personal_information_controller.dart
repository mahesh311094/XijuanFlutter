import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/strings.dart';

class PersonalInformationController extends GetxController {
  final RxString _selectedCountryCode = defaultCountryCode.obs;
  final RxString _selectedValue = male.obs;
  final RxList<String> _dropdownItems = [male, female, all].obs;
  final Rx<Color> _backColor = greyScale50Color.obs;
  final Rx<Color> _backDarkColor = dark2Color.obs;

  RxString get selectedCountryCode => _selectedCountryCode;

  RxString get selectedValue => _selectedValue;

  RxList<String> get dropdownItems => _dropdownItems;

  Rx<Color> get backColor => _backColor;

  Rx<Color> get backDarkColor => _backDarkColor;

  final Rx<Color> _fNameBackColor = greyScale50Color.obs;
  final Rx<Color> _lNameBackColor = greyScale50Color.obs;
  final Rx<Color> _emailBackColor = greyScale50Color.obs;
  final Rx<Color> _fNameBackDarkColor = dark2Color.obs;
  final Rx<Color> _lNameBackDarkColor = dark2Color.obs;
  final Rx<Color> _emailBackDarkColor = dark2Color.obs;
  final Rx<Color> _emailIconColor = greyScale500Color.obs;

  Rx<Color> get fNameBackColor => _fNameBackColor;

  Rx<Color> get lNameBackColor => _lNameBackColor;

  Rx<Color> get emailBackColor => _emailBackColor;

  Rx<Color> get fNameBackDarkColor => _fNameBackDarkColor;

  Rx<Color> get lNameBackDarkColor => _lNameBackDarkColor;

  Rx<Color> get emailBackDarkColor => _emailBackDarkColor;

  Rx<Color> get emailIconColor => _emailIconColor;

  void changeFNameBackColor(Color color) {
    _fNameBackColor.value = color;
  }

  void changeFNameBackDarkColor(Color color) {
    _fNameBackDarkColor.value = color;
  }

  void changeLNameBackColor(Color color) {
    _lNameBackColor.value = color;
  }

  void changeLNameBackDarkColor(Color color) {
    _lNameBackDarkColor.value = color;
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

  void onSelectedCountryChange(String? value) {
    if (value != null) {
      _selectedCountryCode.value = value;
    }
  }

  void onSelectedValueChange(String? value) {
    if (value != null) {
      _selectedValue.value = value;
    }
  }
}
