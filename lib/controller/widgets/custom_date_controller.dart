import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDateController extends GetxController {
  late final Rx<DateTime> _selectedDate = DateTime.now().obs;

  Rx<DateTime> get selectedDate => _selectedDate;

  void selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      initialDate: selectedDate.value,
      firstDate: DateTime(2018),
      lastDate: DateTime(2025),
      context: Get.context!,
    );
    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;
    }
  }
}
