import 'package:get/get.dart';

import '../../utils/strings.dart';

class HomeController extends GetxController {
  final RxString _greetingMessage = ''.obs;

  RxString get greetingMessage => _greetingMessage;

  @override
  void onInit() {
    super.onInit();
    setGreetingMessage();
  }

  void setGreetingMessage() {
    DateTime now = DateTime.now();
    int hour = now.hour;

    if (hour >= 5 && hour < 12) {
      _greetingMessage.value = '$goodMorning \u{1F44B}';
    } else if (hour >= 12 && hour < 17) {
      _greetingMessage.value = '$goodAfternoon \u{1F44B}';
    } else {
      _greetingMessage.value = '$goodEvening \u{1F44B}';
    }
  }
}
