import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';

class EditProfileController extends GetxController {
  final Rx<Color> _fNameBackColor = greyScale50Color.obs;
  final Rx<Color> _lNameBackColor = greyScale50Color.obs;
  final Rx<Color> _occupationBackColor = greyScale50Color.obs;
  final Rx<Color> _aboutMeBackColor = greyScale50Color.obs;
  final Rx<Color> _fNameBackDarkColor = dark2Color.obs;
  final Rx<Color> _lNameBackDarkColor = dark2Color.obs;
  final Rx<Color> _occupationBackDarkColor = dark2Color.obs;
  final Rx<Color> _aboutMeBackDarkColor = dark2Color.obs;

  Rx<Color> get fNameBackColor => _fNameBackColor;

  Rx<Color> get lNameBackColor => _lNameBackColor;

  Rx<Color> get occupationBackColor => _occupationBackColor;

  Rx<Color> get aboutMeBackColor => _aboutMeBackColor;

  Rx<Color> get fNameBackDarkColor => _fNameBackDarkColor;

  Rx<Color> get lNameBackDarkColor => _lNameBackDarkColor;

  Rx<Color> get occupationBackDarkColor => _occupationBackDarkColor;

  Rx<Color> get aboutMeBackDarkColor => _aboutMeBackDarkColor;

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

  void changeOccupationBackColor(Color color) {
    _occupationBackColor.value = color;
  }

  void changeOccupationBackDarkColor(Color color) {
    _occupationBackDarkColor.value = color;
  }

  void changeAboutMeBackColor(Color color) {
    _aboutMeBackColor.value = color;
  }

  void changeAboutMeBackDarkColor(Color color) {
    _aboutMeBackDarkColor.value = color;
  }
}
