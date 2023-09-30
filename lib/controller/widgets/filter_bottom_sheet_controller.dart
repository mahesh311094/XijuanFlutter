import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyChip {
  final String label;

  const MyChip({required this.label});
}

class FilterBottomSheetController extends GetxController {
  final Rx<RangeValues> _selectedAge = const RangeValues(18, 30).obs;
  final Rx<RangeValues> _selectedLocation = const RangeValues(18, 30).obs;
  final RxSet<MyChip> _selectedGender = <MyChip>{}.obs;

  Rx<RangeValues> get selectedAge => _selectedAge;

  Rx<RangeValues> get selectedLocation => _selectedLocation;

  RxSet<MyChip> get selectedGender => _selectedGender;

  void onGenderValueChange(MyChip? value) {
    if (value != null) {
      if (selectedGender.contains(value)) {
        selectedGender.remove(value);
      } else {
        selectedGender.add(value);
      }
    }
  }
}
