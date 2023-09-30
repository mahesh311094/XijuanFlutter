import 'package:get/get.dart';

import '../../utils/strings.dart';
import 'account_setup_controller.dart';

class ZodiacController extends GetxController {
  final AccountSetupController accountSetupController = Get.find();

  final RxString _selectedZodiac = taurus.obs;
  final RxInt _selectedZodiacId = 2.obs;

  RxString get selectedZodiac => _selectedZodiac;

  RxInt get selectedZodiacId => _selectedZodiacId;

  @override
  void onInit() {
    _selectedZodiacId.value =
        accountSetupController.userProfileResModel.value.zodiac?.id ?? 2;
    _selectedZodiac.value =
        accountSetupController.userProfileResModel.value.zodiac?.zodiacName ??
            taurus;
    super.onInit();
  }

  void onRadioValueChange(String selectedZodiac, int selectedZodiacId) {
    _selectedZodiac.value = selectedZodiac;
    _selectedZodiacId.value = selectedZodiacId;
  }
}
