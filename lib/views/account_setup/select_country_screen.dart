import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../controller/account_setup/select_country_controller.dart';
import '../../controller/theme_controller.dart';
import '../../model/account_setup/app_initial_model.dart';
import '../../utils/colors.dart';
import '../../utils/strings.dart';
import '../widgets/image_load.dart';
import 'fill_profile_sec1_screen.dart';
import '../widgets/common_app_bar.dart';
import '../widgets/custom_button.dart';
import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;
import '../widgets/custom_text_form_field.dart';

// SelectCountryScreen
class SelectCountryScreen extends StatelessWidget {
  final String? page;

  SelectCountryScreen({super.key, this.page});

  final SelectCountryController selectCountryController =
      Get.put(SelectCountryController());
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ModalProgressHUD(
        inAsyncCall: selectCountryController.controller.showSpinner.value,
        child: Scaffold(
          appBar: CommonAppBar(title: selectYourCountry),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                CustomTextFormField(
                  textEditingController:
                      selectCountryController.searchController,
                  prefixIconPath: 'assets/icons/search.svg',
                  hintText: search,
                  iconColor: selectCountryController.iconColor.value,
                  backGroundColor: themeController.isDarkMode.value
                      ? selectCountryController.backDarkColor.value
                      : selectCountryController.backColor.value,
                  onTap: () {
                    if (themeController.isDarkMode.value) {
                      selectCountryController
                          .changeBackDarkColor(primary4Color);
                    } else {
                      selectCountryController.changeBackColor(primary4Color);
                    }
                    selectCountryController.changeIconColor(primaryColor);
                  },
                  onChanged: (value) {
                    selectCountryController.onSearch(value);
                  },
                ),
                const SizedBox(height: 10.0),
                Expanded(
                  child: ListView.builder(
                    itemCount:
                        selectCountryController.filteredCountriesLength.value,
                    itemBuilder: (BuildContext context, int index) {
                      return Obx(() {
                        Country country =
                            selectCountryController.filteredCountries[index];
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          decoration: selectCountryController
                                      .controller.selectedCountryId.value ==
                                  country.id
                              ? BoxDecoration(
                                  border: Border.all(
                                    color: primaryColor,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(24.0),
                                )
                              : BoxDecoration(
                                  border: Border.all(
                                    color: greyScale200Color,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                          child: RadioListTile(
                            title: Row(
                              children: [
                                ImageLoad(imagePath: "${country.countryImage}"),
                                const SizedBox(width: 24.0),
                                Text(
                                  country.countryCode ?? "",
                                  style: themeController.isDarkMode.value
                                      ? dark.bodySmallRegular
                                      : light.bodySmallRegular,
                                ),
                                const SizedBox(width: 24.0),
                                Text(
                                  country.countryName ?? "",
                                  style: themeController.isDarkMode.value
                                      ? dark.bodyLargeSemiBold900
                                      : light.bodyLargeSemiBold900,
                                ),
                              ],
                            ),
                            value: country.id,
                            groupValue: selectCountryController
                                .controller.selectedCountryId.value,
                            onChanged: (value) {
                              selectCountryController.controller
                                  .onRadioSelectionValueChange(
                                      country.countryName!,
                                      country.countryCode!,
                                      country.countryImage!,
                                      country.id!,
                                      value!);
                            },
                            controlAffinity: ListTileControlAffinity.trailing,
                            activeColor: primaryColor,
                          ),
                        );
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: Get.width,
                  child: CustomButton(
                    buttonText: continueText,
                    cornerRadius: 100.0,
                    textColor: whiteColor,
                    bgColor: disabledButtonColor,
                    onPress: () {
                      if (selectCountryController
                              .controller.selectedCountryId.value !=
                          0) {
                        selectCountryController.controller.countryMap['id'] =
                            selectCountryController
                                .controller.selectedCountryId.value;
                        selectCountryController
                                .controller.countryMap['country_name'] =
                            selectCountryController
                                .controller.selectedCountryName.value;
                        selectCountryController
                                .controller.countryMap['country_code'] =
                            selectCountryController
                                .controller.selectedCountryCode.value;
                        selectCountryController
                                .controller.countryMap['country_image'] =
                            selectCountryController
                                .controller.selectedCountryImage.value;

                        debugPrint(
                            "=======countryMap==${selectCountryController.controller.countryMap}");
                        if (page == "Contact") {
                          Get.back();
                        } else {
                          Get.to(FillProfileSec1Screen());
                        }
                      } else {
                        Fluttertoast.showToast(msg: pleaseSelectAnyCountry);
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
