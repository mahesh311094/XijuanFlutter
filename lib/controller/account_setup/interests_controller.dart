import 'package:get/get.dart';

import '../../model/interests_model.dart';
import 'account_setup_controller.dart';

class InterestController extends GetxController {
  InterestModel interestModel = InterestModel();
  final AccountSetupController accountSetupController = Get.find();

  @override
  void onInit() {
    super.onInit();
    for (var item1
        in accountSetupController.userProfileResModel.value.interestType!) {
      for (var item2
          in accountSetupController.appInitialModel.value.interestType!) {
        if (item1.id == item2.id) {
          item2.isSelected.value = true;
          onInterestValuesChange(item2.id, item2.interestName, item2.icon);
          break;
        }
      }
    }
  }

  void onInterestValuesChange(int? id, String? label, String? icon) {
    bool isAdded = false;
    interestModel = InterestModel(id: id, interestName: label, iconPath: icon);

    for (InterestModel interestModel in myInterestList) {
      if (interestModel.interestName == label &&
          interestModel.iconPath == icon &&
          interestModel.id == id) {
        isAdded = true;
        break;
      }
    }

    if (isAdded) {
      myInterestList.removeWhere((chip) =>
          chip.id == id && chip.interestName == label && chip.iconPath == icon);
    } else {
      myInterestList.add(interestModel);
    }
  }
}
