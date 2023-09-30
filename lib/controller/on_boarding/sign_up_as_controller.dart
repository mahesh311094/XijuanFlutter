import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../model/on_boarding/common_model.dart';
import '../../network/api_services.dart';
import '../../utils/shared_preference.dart';
import '../../utils/strings.dart';
import '../../utils/urls.dart';
import '../../utils/utils.dart';
import '../../views/account_setup/per_location_screen.dart';
import '../../views/account_setup/per_notification_screen.dart';
import '../../views/dashboard/main_screen.dart';

class SignUpAsController extends GetxController {
  final RxBool _showSpinner = false.obs;

  RxBool get showSpinner => _showSpinner;

  Future<void> googleLogin() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final FirebaseAuth auth = FirebaseAuth.instance;
    String? email = "";
    String? profilePic = "";

    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential userCredential =
          await auth.signInWithCredential(credential);
      final User? user = userCredential.user;
      email = user?.email;
      profilePic = user?.photoURL;
    } catch (e) {
      debugPrint('Error: $e');
    }
    addUser("Google", email ?? "", profilePic ?? "");
  }

  Future<void> appleLogin() async {
    addUser("Apple", "", "");
  }

  Future<void> facebookLogin() async {
    addUser("Facebook", "", "");
  }

  Future addUser(
      String socialAccountName, String email, String profilePic) async {
    _showSpinner.value = true;

    final NetworkRequest networkRequest = NetworkRequest();
    CommonModel? commonModel;

    bool status = false;
    bool isFirstTimeLogIn = true;
    String refreshToken = "";
    String accessToken = "";
    String userId = "";

    var token = await FirebaseMessaging.instance.getToken();
    String? deviceName = SharedPreference().getDeviceName();
    String? deviceType = SharedPreference().getDeviceType();
    String? deviceVersion = SharedPreference().getDeviceVersion();
    String? appVersion = SharedPreference().getAppVersion();

    Map data = {
      "device_token": token,
      "device_type": deviceType ?? "",
      "device_name": deviceName ?? "",
      "device_version": deviceVersion ?? "",
      "app_version": appVersion ?? "",
      "email": email,
      "first_name": "",
      "last_name": "",
      "profile_pic": "",
      "social_account_name": socialAccountName,
      "password": ""
    };

    var response = await networkRequest.postRequest(socialLogin, data);
    _showSpinner.value = false;

    if (response != null) {
      commonModel = CommonModel.fromJson(response);
      status = commonModel.status ?? false;
      refreshToken = commonModel.refreshToken ?? "";
      accessToken = commonModel.accessToken ?? "";
      userId = commonModel.userId ?? "";
      isFirstTimeLogIn = commonModel.isFirstTimeLogin ?? true;
      if (accessToken != "") {
        storeDataInSharedPref(accessToken, refreshToken, userId);
      }
    }

    if (status) {
      var getNotificationPermissionStatus =
      await checkNotificationPermissions();
      var getLocationPermissionStatus = await checkLocationPermissions();

      if (isFirstTimeLogIn ||
          getNotificationPermissionStatus.isDenied ||
          getNotificationPermissionStatus.isPermanentlyDenied) {
        Get.offAll(
              () =>
              PermissionNotificationsScreen(isFirstTimeLogin: isFirstTimeLogIn),
        );
      } else if (getLocationPermissionStatus == LocationPermission.denied ||
          getLocationPermissionStatus == LocationPermission.deniedForever) {
        Get.offAll(
              () => PerLocationScreen(isFirstTimeLogin: isFirstTimeLogIn),
        );
      } else {
        Get.offAll(() => MainScreen());
      }
    } else {
      Fluttertoast.showToast(
        msg: commonModel?.responseMessage ?? somethingWentWrong,
      );
    }
  }
}
