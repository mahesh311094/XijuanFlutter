import 'package:get/get.dart';

import '../../model/fluent_languages_model.dart';
import 'account_setup_controller.dart';

class FluentController extends GetxController {
  FluentLanguageModel fluentLanguageModel = FluentLanguageModel();
  final AccountSetupController accountSetupController = Get.find();

  @override
  void onInit() {
    super.onInit();
    for (var item1 in accountSetupController
        .userProfileResModel.value.fluentLanguageType!) {
      for (var item2
          in accountSetupController.appInitialModel.value.fluentLanguageType!) {
        if (item1.id == item2.id) {
          item2.isSelected.value = true;
          onFluentLangSelectionChange(item2.id, item2.fluentLanguageType);
          break;
        }
      }
    }
  }

  void onFluentLangSelectionChange(int? id, String? fluentLanguage) {
    bool isAdded = false;
    fluentLanguageModel =
        FluentLanguageModel(id: id, fluentLanguageType: fluentLanguage);

    for (FluentLanguageModel fluentLanguageModel in fluentLanguageList) {
      if (fluentLanguageModel.fluentLanguageType == fluentLanguage &&
          fluentLanguageModel.id == id) {
        isAdded = true;
        break;
      }
    }

    if (isAdded) {
      fluentLanguageList.removeWhere((value) =>
          value.id == id && value.fluentLanguageType == fluentLanguage);
    } else {
      fluentLanguageList.add(fluentLanguageModel);
    }
  }
}
