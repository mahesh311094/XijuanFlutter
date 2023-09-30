import 'package:get/get.dart';

class SubscriptionController extends GetxController {
  final RxBool _firstPlanSelected = true.obs;
  final RxBool _secondPlanSelected = true.obs;

  RxBool get firstPlanSelected => _firstPlanSelected;

  RxBool get secondPlanSelected => _secondPlanSelected;
}
