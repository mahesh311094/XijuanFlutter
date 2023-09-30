import 'package:get/get.dart';

class NotificationsController extends GetxController {
  final RxBool _isShowMsg = true.obs;
  final RxBool _isNewMsg = true.obs;
  final RxBool _isNewMatch = true.obs;
  final RxBool _isYouGotLikes = true.obs;
  final RxBool _isSubscription = true.obs;
  final RxBool _isNewUpdates = true.obs;

  RxBool get isShowMsg => _isShowMsg;
  RxBool get isNewMsg => _isNewMsg;
  RxBool get isNewMatch => _isNewMatch;
  RxBool get isYouGotLikes => _isYouGotLikes;
  RxBool get isSubscription => _isSubscription;
  RxBool get isNewUpdates => _isNewUpdates;

  void onShowMsgValueChange(bool value) {
    _isShowMsg.value = value;
  }

  void onNewMsgValueChange(bool value) {
    _isNewMsg.value = value;
  }

  void onNewMatchValueChange(bool value) {
    _isNewMatch.value = value;
  }

  void onYouGotLikesValueChange(bool value) {
    _isYouGotLikes.value = value;
  }

  void onSubscriptionValueChange(bool value) {
    _isSubscription.value = value;
  }

  void onNewUpdatesValueChange(bool value) {
    _isNewUpdates.value = value;
  }
}
