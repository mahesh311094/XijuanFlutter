import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';

class ChangePasswordController extends GetxController {
  final Rx<Color> _backColor1 = greyScale50Color.obs;
  final Rx<Color> _backColor2 = greyScale50Color.obs;
  final Rx<Color> _backColor3 = greyScale50Color.obs;

  final Rx<Color> _backDarkColor1 = dark2Color.obs;
  final Rx<Color> _backDarkColor2 = dark2Color.obs;
  final Rx<Color> _backDarkColor3 = dark2Color.obs;

  final Rx<Color> _iconColor1 = greyScale500Color.obs;
  final Rx<Color> _iconColor2 = greyScale500Color.obs;
  final Rx<Color> _iconColor3 = greyScale500Color.obs;

  final RxBool _isObscure1 = true.obs;
  final RxBool _isObscure2 = true.obs;
  final RxBool _isObscure3 = true.obs;

  Rx<Color> get backColor1 => _backColor1;

  Rx<Color> get backDarkColor1 => _backDarkColor1;

  Rx<Color> get iconColor1 => _iconColor1;

  RxBool get isObscure1 => _isObscure1;

  Rx<Color> get backColor2 => _backColor2;

  Rx<Color> get backDarkColor2 => _backDarkColor2;

  Rx<Color> get iconColor2 => _iconColor2;

  RxBool get isObscure2 => _isObscure2;

  Rx<Color> get backColor3 => _backColor3;

  Rx<Color> get backDarkColor3 => _backDarkColor3;

  Rx<Color> get iconColor3 => _iconColor3;

  RxBool get isObscure3 => _isObscure3;

  void changeBackColor(Color color, int position) {
    if (position == 1) {
      _backColor1.value = color;
    } else if (position == 2) {
      _backColor2.value = color;
    } else if (position == 3) {
      _backColor3.value = color;
    }
  }

  void changeBackDarkColor(Color color, int position) {
    if (position == 1) {
      _backDarkColor1.value = color;
    } else if (position == 2) {
      _backDarkColor2.value = color;
    } else if (position == 3) {
      _backDarkColor3.value = color;
    }
  }

  void changeIconColor(Color color, int position) {
    if (position == 1) {
      _iconColor1.value = color;
    } else if (position == 2) {
      _iconColor2.value = color;
    } else if (position == 3) {
      _iconColor3.value = color;
    }
  }

  void onChangeVisibility(bool value, int position) {
    if (position == 1) {
      _isObscure1.value = !value;
    } else if (position == 2) {
      _isObscure2.value = !value;
    } else if (position == 3) {
      _isObscure3.value = !value;
    }
  }
}
