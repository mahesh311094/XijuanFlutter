import 'package:get/get.dart';

import '../../utils/strings.dart';
import 'account_setup_controller.dart';

class ProfileChildrenController extends GetxController {
  final AccountSetupController accountSetupController = Get.find();

  final RxString _selectedChildren = doNotWant.obs;
  final RxInt _selectedChildrenId = 2.obs;

  RxString get selectedChildren => _selectedChildren;

  RxInt get selectedChildrenId => _selectedChildrenId;

  @override
  void onInit() {
    selectedChildrenId.value =
        accountSetupController.userProfileResModel.value.toHaveChildren?.id ??
            2;
    selectedChildren.value = accountSetupController
            .userProfileResModel.value.toHaveChildren?.childrenQueryType ??
        doNotWant;
    super.onInit();
  }

  void onRadioValueChange(String selectedChildren, int selectedChildrenId) {
    _selectedChildren.value = selectedChildren;
    _selectedChildrenId.value = selectedChildrenId;
  }
}
