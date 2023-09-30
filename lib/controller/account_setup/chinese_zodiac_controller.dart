import 'package:get/get.dart';
import '../../utils/strings.dart';
import 'account_setup_controller.dart';

class ChineseZodiacController extends GetxController {
  final AccountSetupController accountSetupController = Get.find();

  final RxString _selectedChineseZodiac = ox.obs;
  final RxInt _selectedChineseZodiacId = 2.obs;

  RxString get selectedChineseZodiac => _selectedChineseZodiac;

  RxInt get selectedChineseZodiacId => _selectedChineseZodiacId;

  @override
  void onInit() {
    selectedChineseZodiacId.value =
        accountSetupController.userProfileResModel.value.chineseZodiac?.id ?? 2;
    selectedChineseZodiac.value = accountSetupController
            .userProfileResModel.value.chineseZodiac?.chineseZodiacName ??
        ox;
    super.onInit();
  }

  void onRadioValueChange(
      String selectedChineseZodiac, int selectedChineseZodiacId) {
    _selectedChineseZodiac.value = selectedChineseZodiac;
    _selectedChineseZodiacId.value = selectedChineseZodiacId;
  }
}
