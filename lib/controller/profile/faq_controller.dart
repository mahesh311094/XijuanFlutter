import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';

class FaqController extends GetxController {
  final RxBool _isExpanded = false.obs;

  RxBool get isExpanded => _isExpanded;

  void onExpansionValueChange(bool expanded) {
    _isExpanded.value = expanded;
  }

  final Rx<Color> _backColor = greyScale50Color.obs;
  final Rx<Color> _backDarkColor = dark2Color.obs;
  final Rx<Color> _iconColor = greyScale500Color.obs;

  Rx<Color> get backColor => _backColor;

  Rx<Color> get backDarkColor => _backDarkColor;

  Rx<Color> get iconColor => _iconColor;

  void changeBackColor(Color color) {
    _backColor.value = color;
  }

  void changeBackDarkColor(Color color) {
    _backDarkColor.value = color;
  }

  void changeIconColor(Color color) {
    _iconColor.value = color;
  }
}
