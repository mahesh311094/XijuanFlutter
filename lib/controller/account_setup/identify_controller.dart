import 'package:get/get.dart';

import '../../utils/strings.dart';
import 'account_setup_controller.dart';

class IdentifyController extends GetxController {
  final AccountSetupController accountSetupController = Get.find();

  final RxString _selectedIdentify = chineseFromMainlandChina.obs;
  final RxInt _selectedIdentifyId = 2.obs;

  RxString get selectedIdentify => _selectedIdentify;

  RxInt get selectedIdentifyId => _selectedIdentifyId;

  @override
  void onInit() {
    _selectedIdentifyId.value =
        accountSetupController.userProfileResModel.value.identifyWith?.id ?? 2;
    _selectedIdentify.value = accountSetupController
            .userProfileResModel.value.identifyWith?.identifyWithName ??
        sometimes;
    super.onInit();
  }

  void onRadioValueChange(String selectedIdentify, int selectedIdentifyId) {
    _selectedIdentify.value = selectedIdentify;
    _selectedIdentifyId.value = selectedIdentifyId;
  }
}
