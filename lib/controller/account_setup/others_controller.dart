import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';
import '../../utils/strings.dart';
import 'account_setup_controller.dart';

class OthersController extends GetxController {
  final AccountSetupController accountSetupController = Get.find();

  final otherKey = GlobalKey<FormState>();

  final TextEditingController occupationController = TextEditingController();

  int selectedEducationId = 0;

  final RxString _selectedEducationValue = educationalAttainment.obs;
  final RxString _selectedYearValue = year.obs;

  final List<String> _educationItems = [
    educationalAttainment,
  ];
  final List<String> _yearItems = [
    year,
    "2000",
    "2001",
    "2002",
    "2003",
    "2004",
    "2005",
    "2006",
    "2007",
    "2008",
    "2009",
    "2010",
    "2011",
    "2012",
    "2013",
    "2014",
    "2015",
    "2016",
    "2017",
    "2018",
    "2019",
    "2020",
    "2021",
    "2022",
    "2023",
    "2024",
    "2025",
  ];

  final Rx<Color> _backColor = greyScale50Color.obs;
  final Rx<Color> _backDarkColor = dark2Color.obs;

  RxString get selectedEducationValue => _selectedEducationValue;

  RxString get selectedYearValue => _selectedYearValue;

  List<String> get educationItems => _educationItems;

  List<String> get yearItems => _yearItems;

  Rx<Color> get backColor => _backColor;

  Rx<Color> get backDarkColor => _backDarkColor;

  @override
  void onInit() {
    occupationController.text = accountSetupController
            .userProfileResModel.value.userProfile?.occupation ??
        "";

    for (var item
        in accountSetupController.appInitialModel.value.educationalDegree!) {
      _educationItems.contains(item.educationalDegree)
          ? null
          : _educationItems.add(item.educationalDegree ?? '');
    }

    _selectedEducationValue.value = accountSetupController
            .userProfileResModel.value.educationalDegree?.educationalDegree ??
        educationalAttainment;
    _selectedYearValue.value =
        (accountSetupController.userProfileResModel.value.userProfile?.year == 0
            ? year
            : accountSetupController.userProfileResModel.value.userProfile?.year
                .toString())!;
    selectedEducationId = accountSetupController
            .userProfileResModel.value.educationalDegree?.id ??
        0;

    super.onInit();
  }

  void onEducationSelectedChange(String value) {
    _selectedEducationValue.value = value;
    for (var item
        in accountSetupController.appInitialModel.value.educationalDegree!) {
      if (value == item.educationalDegree) {
        selectedEducationId = item.id ?? 0;
      }
    }
  }

  void onYearSelectedChange(String? value) {
    if (value != null) {
      _selectedYearValue.value = value;
    }
  }

  void changeBackColor(Color color) {
    _backColor.value = color;
  }

  void changeBackDarkColor(Color color) {
    _backDarkColor.value = color;
  }
}
