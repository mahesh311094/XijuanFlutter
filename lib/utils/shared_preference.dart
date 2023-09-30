import 'package:get_storage/get_storage.dart';

import 'constants.dart';

// This class for get shared preference value
class SharedPreference {
  final box = GetStorage();

  // Method to get a Device Name value from shared preference
  dynamic getDeviceName() {
    return box.read(sharedPrefDeviceName);
  }

  // Method to get a Device Type value from shared preference
  dynamic getDeviceType() {
    return box.read(sharedPrefDeviceType);
  }

  // Method to get a Device Version value from shared preference
  dynamic getDeviceVersion() {
    return box.read(sharedPrefDeviceVersion);
  }

  // Method to get a App Version value from shared preference
  dynamic getAppVersion() {
    return box.read(sharedPrefAppVersion);
  }

  // Method to get a Access Token value from shared preference
  dynamic getAccessToken() {
    return box.read(sharedPrefAccessToken);
  }

  // Method to get a UserId value from shared preference
  dynamic getUserId() {
    return box.read(sharedPrefUserId);
  }

  // Method to get a Email value from shared preference
  dynamic getUserEmail() {
    return box.read(sharedPrefEmailId);
  }

  // Method to get a Password value from shared preference
  dynamic getUserPassword() {
    return box.read(sharedPrefPassword);
  }
}
