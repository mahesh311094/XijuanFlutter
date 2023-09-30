import 'package:get/get.dart';

import '../../utils/strings.dart';
import 'account_setup_controller.dart';

class GenderController extends GetxController {
  final AccountSetupController accountSetupController = Get.find();

  final RxString _selectedGender = female.obs;
  final RxInt _selectedGenderId = 2.obs;

  RxString get selectedGender => _selectedGender;

  RxInt get selectedGenderId => _selectedGenderId;

  @override
  void onInit() {
    _selectedGenderId.value =
        accountSetupController.userProfileResModel.value.gender?.id ?? 2;
    _selectedGender.value =
        accountSetupController.userProfileResModel.value.gender?.gender ??
            female;

    super.onInit();
  }

  void onRadioValueChange(String selectedGender, int selectedGenderId) {
    _selectedGender.value = selectedGender;
    _selectedGenderId.value = selectedGenderId;
  }
}
