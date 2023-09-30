import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../utils/utils.dart';
import '../../views/account_setup/per_location_screen.dart';
import '../../views/dashboard/main_screen.dart';

class PerNotificationController extends GetxController {
  Future checkNotificationPermissions() async {
    PermissionStatus status = await Permission.notification.status;
    if (status.isDenied || status.isPermanentlyDenied) {
      openAppSettings();
    }
  }

  void openNextScreen(bool isFirstTimeLogin) async {
    var getLocationPermissionStatus = await checkLocationPermissions();
    if (isFirstTimeLogin ||
        getLocationPermissionStatus == LocationPermission.denied ||
        getLocationPermissionStatus == LocationPermission.deniedForever) {
      Get.to(
        () => PerLocationScreen(isFirstTimeLogin: isFirstTimeLogin),
      );
    } else {
      Get.to(() => MainScreen());
    }
  }
}
