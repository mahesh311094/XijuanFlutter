import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../controller/account_setup/add_photo_controller.dart';
import '../../controller/theme_controller.dart';
import '../../utils/colors.dart';
import '../../utils/strings.dart';

import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;
import '../widgets/common_app_bar.dart';
import '../widgets/custom_button.dart';

// AddPhotoScreen
class AddPhotoScreen extends StatelessWidget {
  AddPhotoScreen({super.key});

  final AddPhotoController controller = Get.put(AddPhotoController());
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ModalProgressHUD(
        inAsyncCall: controller.showSpinner.value,
        child: Scaffold(
          appBar: CommonAppBar(title: addYourBestPhotos),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Obx(
                    () => Text(
                      addYourBestPhotosMessage,
                      style: themeController.isDarkMode.value
                          ? dark.bodyXLargeMedium900
                          : light.bodyXLargeMedium900,
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                    children: List.generate(4, (index) {
                      return GestureDetector(
                        onTap: () => _showImageSourceDialog(index),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Obx(
                            () => Card(
                              color: primary4Color,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.0),
                              ),
                              child: controller.imageFiles[index] == null
                                  ? controller.images[index] != ""
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(32.0),
                                          child: Image.network(
                                            controller.images[index],
                                            fit: BoxFit.cover,
                                            errorBuilder: (
                                              BuildContext context,
                                              Object exception,
                                              StackTrace? stackTrace,
                                            ) {
                                              return Container();
                                            },
                                          ),
                                        )
                                      : DottedBorder(
                                          color: primaryColor,
                                          borderType: BorderType.RRect,
                                          radius: const Radius.circular(32.0),
                                          strokeWidth: 3.0,
                                          dashPattern: const [16, 16],
                                          child: Center(
                                            child: SvgPicture.asset(
                                              "assets/icons/add.svg",
                                            ),
                                          ),
                                        )
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(32.0),
                                      child: Image.file(
                                        controller.imageFiles[index]!,
                                        fit: BoxFit.cover,
                                        errorBuilder: (
                                          BuildContext context,
                                          Object exception,
                                          StackTrace? stackTrace,
                                        ) {
                                          return Container();
                                        },
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SizedBox(
                    width: Get.width,
                    child: CustomButton(
                      bgColor: primaryColor,
                      buttonText: continueText,
                      textColor: whiteColor,
                      cornerRadius: 100.0,
                      onPress: () {
                        controller.addBestPhotos();
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 28),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _showImageSourceDialog(int index) {
    Get.dialog(
      AlertDialog(
        title: const Text(chooseImageSource),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              GestureDetector(
                child: const Text(camera),
                onTap: () {
                  controller.getImage(ImageSource.camera, index);
                  Get.back();
                },
              ),
              const SizedBox(height: 16),
              GestureDetector(
                child: const Text(gallery),
                onTap: () {
                  controller.getImage(ImageSource.gallery, index);
                  Get.back();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
