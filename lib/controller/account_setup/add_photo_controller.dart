import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../network/api_services.dart';
import '../../utils/shared_preference.dart';
import '../../utils/strings.dart';
import '../../utils/urls.dart';
import '../../views/account_setup/interests_screen.dart';
import 'account_setup_controller.dart';

class AddPhotoController extends GetxController {
  final AccountSetupController accountSetupController = Get.find();

  final RxList<File?> _imageFiles = <File?>[null, null, null, null].obs;
  final RxList<String> _images = <String>["", "", "", ""].obs;
  final RxBool _showSpinner = false.obs;

  RxBool get showSpinner => _showSpinner;

  RxList<File?> get imageFiles => _imageFiles;

  RxList<String> get images => _images;

  @override
  void onInit() {
    int length =
        accountSetupController.userProfileResModel.value.userPhotos?.length ??
            0;

    if (length > 4) {
      length = 4;
    }

    if (length > 0) {
      for (var i = 0; i < length; i++) {
        _images[i] = accountSetupController
            .userProfileResModel.value.userPhotos![i].photoName!;
      }
    }

    super.onInit();
  }

  final NetworkRequest networkRequest = NetworkRequest();

  Future<void> getImage(ImageSource source, int index) async {
    final pickedFile = await ImagePicker().pickImage(
      source: source,
      maxWidth: 800,
      maxHeight: 800,
    );
    if (pickedFile != null) {
      _imageFiles[index] = File(pickedFile.path);
    }
  }

  Future addBestPhotos() async {
    _showSpinner.value = true;
    int index = 1;
    String? userId = SharedPreference().getUserId();

    final formData = FormData({});
    for (var file in imageFiles) {
      if (file != null) {
        formData.files.add(
          MapEntry(
            "UserPhoto",
            MultipartFile(file,
                filename: 'profile_pic$index.png', contentType: "image/*"),
          ),
        );
      }
      index++;
    }

    formData.fields.add(
      MapEntry(
        "UserId",
        userId!,
      ),
    );

    String? accessToken = SharedPreference().getAccessToken();

    var response = await networkRequest.postRequest(updateUserPhotos, formData,
        header: accessToken);

    _showSpinner.value = false;
    if (response != null) {
      Get.to(InterestsScreen());
    } else {
      Fluttertoast.showToast(msg: photoRequired);
    }
  }
}
