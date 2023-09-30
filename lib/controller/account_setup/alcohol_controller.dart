import 'package:get/get.dart';

import '../../utils/strings.dart';
import 'account_setup_controller.dart';

class AlcoholController extends GetxController {
  final AccountSetupController accountSetupController = Get.find();

  final RxString _selectedAlcohol = sometimes.obs;
  final RxInt _selectedAlcoholId = 2.obs;

  RxString get selectedAlcohol => _selectedAlcohol;

  RxInt get selectedAlcoholId => _selectedAlcoholId;

  @override
  void onInit() {
    selectedAlcoholId.value = accountSetupController
            .userProfileResModel.value.alcoholDrinkDurationType?.id ??
        2;
    selectedAlcohol.value = accountSetupController.userProfileResModel.value
            .alcoholDrinkDurationType?.alcoholDrinkDurationType ??
        sometimes;
    super.onInit();
  }

  void onRadioValueChange(String selectedAlcohol, int selectedAlcoholId) {
    _selectedAlcohol.value = selectedAlcohol;
    _selectedAlcoholId.value = selectedAlcoholId;
  }
}
