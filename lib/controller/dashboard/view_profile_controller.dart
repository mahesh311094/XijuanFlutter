import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewProfileController extends GetxController {
  PageController? pageController;

  final RxInt _currentImageIndex = 0.obs;

  RxInt get currentImageIndex => _currentImageIndex;

  final List<String> imageList = [
    'assets/images/girl_1.png',
    'assets/images/girl_1.png',
    'assets/images/girl_1.png',
    'assets/images/girl_1.png',
    'assets/images/girl_1.png',
  ];

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    pageController?.dispose();
  }

  void onImageIndexChange(int? index) {
    _currentImageIndex.value = index ?? 0;
  }
}
