import 'package:get/get.dart';

import '../../utils/strings.dart';
import 'account_setup_controller.dart';

class WorkoutController extends GetxController {
  final AccountSetupController accountSetupController = Get.find();

  final RxString _selectedWorkOut = sometimes.obs;
  final RxInt _selectedWorkOutId = 1.obs;

  RxString get selectedWorkOut => _selectedWorkOut;

  RxInt get selectedWorkOutId => _selectedWorkOutId;

  @override
  void onInit() {
    _selectedWorkOutId.value = accountSetupController
            .userProfileResModel.value.workoutDurationType?.id ??
        1;
    _selectedWorkOut.value = accountSetupController.userProfileResModel.value
            .workoutDurationType?.workoutDurationType ??
        sometimes;
    super.onInit();
  }

  void onRadioValueChange(String selectedWorkOut, int selectedWorkOutId) {
    _selectedWorkOut.value = selectedWorkOut;
    _selectedWorkOutId.value = selectedWorkOutId;
  }
}
