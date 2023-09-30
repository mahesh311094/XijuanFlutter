import 'package:get/get.dart';

import '../../utils/strings.dart';
import 'account_setup_controller.dart';

class SmokeController extends GetxController {
  final AccountSetupController accountSetupController = Get.find();

  final RxString _selectedSmokeType = never.obs;
  final RxInt _selectedSmokeTypeId = 1.obs;

  RxString get selectedSmokeType => _selectedSmokeType;

  RxInt get selectedSmokeTypeId => _selectedSmokeTypeId;

  @override
  void onInit() {
    _selectedSmokeTypeId.value = accountSetupController
            .userProfileResModel.value.smokeDurationType?.id ??
        1;
    _selectedSmokeType.value = accountSetupController
            .userProfileResModel.value.smokeDurationType?.smokeDurationType ??
        never;
    super.onInit();
  }

  void onRadioValueChange(String selectedSmoke, int selectedSmokeId) {
    _selectedSmokeType.value = selectedSmoke;
    _selectedSmokeTypeId.value = selectedSmokeId;
  }
}
