import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';

class FillProfileSec1Controller extends GetxController {
  final fillProfileSec1Key = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController aboutMeController = TextEditingController();

  final Rx<Color> _fNameBackColor = greyScale50Color.obs;
  final Rx<Color> _aboutMeBackColor = greyScale50Color.obs;
  final Rx<Color> _fNameBackDarkColor = dark2Color.obs;
  final Rx<Color> _aboutMeBackDarkColor = dark2Color.obs;

  Rx<Color> get fNameBackColor => _fNameBackColor;

  Rx<Color> get aboutMeBackColor => _aboutMeBackColor;

  Rx<Color> get fNameBackDarkColor => _fNameBackDarkColor;

  Rx<Color> get aboutMeBackDarkColor => _aboutMeBackDarkColor;

  void changeFNameBackColor(Color color) {
    _fNameBackColor.value = color;
  }

  void changeFNameBackDarkColor(Color color) {
    _fNameBackDarkColor.value = color;
  }

  void changeAboutMeBackColor(Color color) {
    _aboutMeBackColor.value = color;
  }

  void changeAboutMeBackDarkColor(Color color) {
    _aboutMeBackDarkColor.value = color;
  }
}
