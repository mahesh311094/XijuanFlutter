import 'package:get/get.dart';

import '../../model/ideal_match_model.dart';
import 'account_setup_controller.dart';

class IdealMatchController extends GetxController {
  IdealMatchModel idealMatchModel = IdealMatchModel();
  final AccountSetupController accountSetupController = Get.find();

  @override
  void onInit() {
    for (var item1
        in accountSetupController.userProfileResModel.value.idealMatch!) {
      for (var item2
          in accountSetupController.appInitialModel.value.idealMatch!) {
        if (item1.id == item2.id) {
          item2.isSelected.value = true;
          onIdealMatchSelectionChange(item2.id, item2.idealMatchName);
          break;
        }
      }
    }
    super.onInit();
  }

  void onIdealMatchSelectionChange(int? id, String? idealMatchName) {
    bool isAdded = false;
    idealMatchModel = IdealMatchModel(id: id, idealMatchName: idealMatchName);

    for (IdealMatchModel idealMatchModel in idealMatchList) {
      if (idealMatchModel.idealMatchName == idealMatchName &&
          idealMatchModel.id == id) {
        isAdded = true;
        break;
      }
    }

    if (isAdded) {
      idealMatchList.removeWhere(
          (value) => value.id == id && value.idealMatchName == idealMatchName);
    } else {
      idealMatchList.add(idealMatchModel);
    }
  }
}
