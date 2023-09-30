import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../controller/on_boarding/sign_up_as_controller.dart';
import '../../controller/theme_controller.dart';
import '../../model/on_boarding/common_model.dart';
import '../../network/api_services.dart';
import '../../utils/colors.dart';
import '../../utils/shared_preference.dart';
import '../../utils/strings.dart';
import '../../utils/urls.dart';
import '../../utils/utils.dart';
import '../account_setup/per_location_screen.dart';
import '../account_setup/per_notification_screen.dart';
import '../dashboard/main_screen.dart';

// This widget for Social Button
class SocialButton extends StatelessWidget {
  SocialButton({Key? key}) : super(key: key);

  final ThemeController themeController = Get.find();
  final SignUpAsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        socialButton(
          'assets/icons/facebook.svg',
          () {
            facebookLogin();
          },
        ),
        socialButton(
          'assets/icons/google.svg',
          () {
            googleLogin();
          },
        ),
        socialButton(
          'assets/icons/apple.svg',
          () {
            appleLogin();
          },
        ),
      ],
    );
  }

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
      // Successfully logged in
    } catch (e) {
      // An error occurred during the login process
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

  Widget socialButton(String image, VoidCallback? onPress) {
    return Obx(
      () => MaterialButton(
        onPressed: onPress,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
          side: BorderSide(
            color: themeController.isDarkMode.value
                ? dark3Color
                : greyScale200Color,
            width: 1.0,
          ),
        ),
        color: themeController.isDarkMode.value ? dark2Color : whiteColor,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 14),
          child: SvgPicture.asset(
            image,
            colorFilter: image == 'assets/icons/apple.svg'
                ? ColorFilter.mode(
                    themeController.isDarkMode.value ? whiteColor : blackColor,
                    BlendMode.srcIn)
                : null,
          ),
        ),
      ),
    );
  }

  Future addUser(
      String socialAccountName, String email, String profilePic) async {
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
