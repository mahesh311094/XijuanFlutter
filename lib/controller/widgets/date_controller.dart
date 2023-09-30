import 'package:get/get.dart';

import '../../model/interested_gender_model.dart';
import '../account_setup/account_setup_controller.dart';

class DateController extends GetxController {
  InterestedGenderModel interestedGenderModel = InterestedGenderModel();
  final AccountSetupController accountSetupController = Get.find();

  @override
  void onInit() {
    super.onInit();
    for (var item1
        in accountSetupController.userProfileResModel.value.interestedGender!) {
      for (var item2 in accountSetupController.appInitialModel.value.gender!) {
        if (item1.id == item2.id) {
          item2.isSelected.value = true;
          onSelectionChange(item2.id, item2.gender);
          break;
        }
      }
    }
  }

  void onSelectionChange(int? id, String? gender) {
    bool isAdded = false;
    interestedGenderModel = InterestedGenderModel(id: id, gender: gender);

    for (InterestedGenderModel interestedGenderModel in interestedGenderList) {
      if (interestedGenderModel.gender == gender &&
          interestedGenderModel.id == id) {
        isAdded = true;
        break;
      }
    }

    if (isAdded) {
      interestedGenderList
          .removeWhere((value) => value.id == id && value.gender == gender);
    } else {
      interestedGenderList.add(interestedGenderModel);
    }
  }
}
