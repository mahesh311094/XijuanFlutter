import 'package:get/get.dart';

import '../../utils/strings.dart';
import 'account_setup_controller.dart';

class ReligionIdentifyController extends GetxController {
  final AccountSetupController accountSetupController = Get.find();

  final RxString _selectedReligion = atheist.obs;
  final RxInt _selectedReligionId = 2.obs;

  RxString get selectedReligion => _selectedReligion;

  RxInt get selectedReligionId => _selectedReligionId;

  @override
  void onInit() {
    _selectedReligionId.value =
        accountSetupController.userProfileResModel.value.religion?.id ?? 2;
    _selectedReligion.value = accountSetupController
            .userProfileResModel.value.religion?.religionName ??
        atheist;
    super.onInit();
  }

  void onRadioValueChange(String selectedReligion, int selectedReligionId) {
    _selectedReligion.value = selectedReligion;
    _selectedReligionId.value = selectedReligionId;
  }
}
