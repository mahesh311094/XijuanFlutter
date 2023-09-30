import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/strings.dart';

class IntroSliderController extends GetxController {
  final List<String> textList = [slide1Text, slide2Text, slide3Text];

  final List<AssetImage> imageList = const [
    AssetImage('assets/images/slide_1.png'),
    AssetImage('assets/images/slide_2.png'),
    AssetImage('assets/images/slide_3.png'),
  ];

  final RxInt _currentImageIndex = 0.obs;

  RxInt get currentImageIndex => _currentImageIndex;

  void onImageIndexChange(int index) {
    _currentImageIndex.value = index;
  }
}
