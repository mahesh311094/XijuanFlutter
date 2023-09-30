import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';

class ChatTextFormFieldController extends GetxController {
  final Rx<Color> _backColor = greyScale50Color.obs;
  final Rx<Color> _backDarkColor = dark2Color.obs;
  final Rx<Color> _iconColor = greyScale500Color.obs;

  Rx<Color> get backColor => _backColor;

  Rx<Color> get backDarkColor => _backDarkColor;

  Rx<Color> get iconColor => _iconColor;
}
