import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../utils/strings.dart';
import 'account_setup_controller.dart';

class FillProfileSec2Controller extends GetxController {
  final AccountSetupController accountSetupController = Get.find();

  final Rx<DateTime?> _selectedDate = Rxn<DateTime?>();

  Rx<DateTime?> get selectedDate => _selectedDate;

  @override
  void onInit() {
    var dob = accountSetupController
        .userProfileResModel.value.userProfile?.dateOfBirth;
    if (dob != null && dob != "0001-01-01T00:00:00") {
      _selectedDate.value = DateTime.parse(dob);
    }
    super.onInit();
  }

  void selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      initialDate: DateTime.now(),
      firstDate: DateTime(1960),
      lastDate: DateTime.now(),
      context: Get.context!,
    );
    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;
    }
  }

  String getFormattedDate(DateTime dateTime) {
    return DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(dateTime);
  }

  String getDisplayDate(DateTime dateTime) {
    var date = DateFormat("dd-MM-yyyy").format(dateTime);
    return "$dateOfBirth: $date";
  }
}
