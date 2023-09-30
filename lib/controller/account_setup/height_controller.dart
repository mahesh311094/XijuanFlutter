import 'package:get/get.dart';

import 'account_setup_controller.dart';

class HeightController extends GetxController {
  final AccountSetupController accountSetupController = Get.find();

  final RxInt _selectedHeightIndex = 2.obs;
  final RxString _selectedHeight = "5'2".obs;
  final List<String> _heightItems = [
    "5'0",
    "5'1",
    "5'2",
    "5'3",
    "5'4",
    "5'5",
    "5'6",
    "5'7",
    "5'8",
    "5'9",
    "5'10",
    "5'11",
    "6'0",
    "6'1",
    "6'2",
    "6'3",
    "6'4",
    "6'5",
    "6'6",
    "6'7",
    "6'8",
    "6'9",
    "6'10",
    "6'11",
    "7'0",
  ];

  RxInt get selectedHeightIndex => _selectedHeightIndex;

  RxString get selectedHeight => _selectedHeight;

  List<String> get heightItems => _heightItems;

  @override
  void onInit() {
    _selectedHeight.value =
        accountSetupController.userProfileResModel.value.userProfile?.height ??
            "5'2";

    _selectedHeightIndex.value = heightItems.indexOf(_selectedHeight.value);
    super.onInit();
  }

  void onHeightSelectionChange(int index, String selectedHeight) {
    _selectedHeightIndex.value = index;
    _selectedHeight.value = selectedHeight;
  }
}
