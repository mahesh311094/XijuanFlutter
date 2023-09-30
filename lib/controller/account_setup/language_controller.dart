import 'package:get/get.dart';

class LanguageController extends GetxController {
  final RxInt _selectedRadioButton = 0.obs;

  RxInt get selectedRadioButton => _selectedRadioButton;

  void onRadioValueChange(int? value) {
    if (value != null) {
      _selectedRadioButton.value = value;
    }
  }
}
