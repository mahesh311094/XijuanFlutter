import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/account_setup/app_initial_model.dart';
import '../../utils/colors.dart';
import 'account_setup_controller.dart';

class SelectCountryController extends GetxController {
  final AccountSetupController controller = Get.find();
  List<Country> countries = [];
  List<Country> _filteredCountries = <Country>[].obs;
  final RxInt _filteredCountriesLength = 0.obs;

  final TextEditingController searchController = TextEditingController();

  final Rx<Color> _backColor = greyScale50Color.obs;
  final Rx<Color> _backDarkColor = dark2Color.obs;
  final Rx<Color> _iconColor = greyScale500Color.obs;

  Rx<Color> get backColor => _backColor;

  Rx<Color> get backDarkColor => _backDarkColor;

  RxInt get filteredCountriesLength => _filteredCountriesLength;

  Rx<Color> get iconColor => _iconColor;

  List<Country> get filteredCountries => _filteredCountries;

  @override
  void onInit() {
    super.onInit();
    countries = controller.appInitialModel.value.country!;
    _filteredCountries = countries;
    _filteredCountriesLength.value = _filteredCountries.length;
  }

  void changeBackColor(Color color) {
    _backColor.value = color;
  }

  void changeBackDarkColor(Color color) {
    _backDarkColor.value = color;
  }

  void changeIconColor(Color color) {
    _iconColor.value = color;
  }

  void onSearch(String value) {
    _filteredCountries = countries
        .where((country) =>
            country.countryName!.toLowerCase().contains(value.toLowerCase()))
        .toList();

    _filteredCountriesLength.value = _filteredCountries.length;
  }
}
