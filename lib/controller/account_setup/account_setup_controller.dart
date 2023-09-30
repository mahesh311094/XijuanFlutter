import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../model/account_setup/app_initial_model.dart';
import '../../model/account_setup/user_profile_res_model.dart';
import '../../model/fluent_languages_model.dart';
import '../../model/ideal_match_model.dart';
import '../../model/interested_gender_model.dart';
import '../../model/interests_model.dart';
import '../../network/api_services.dart';
import '../../utils/shared_preference.dart';
import '../../utils/strings.dart';
import '../../utils/urls.dart';
import '../../views/account_setup/guidelines_screen.dart';

class AccountSetupController extends GetxController {
  final NetworkRequest networkRequest = NetworkRequest();
  var appInitialModel = AppInitialModel().obs;
  var userProfileResModel = UserProfileResModel().obs;

  final RxBool _showSpinner = false.obs;
  final RxString _selectedCountryName = "".obs;
  final RxString _selectedCountryCode = "".obs;
  final RxString _selectedCountryImage = "".obs;
  final RxInt _selectedCountryId = 0.obs;
  final RxInt _selectedCountryIndex = 0.obs;

  RxBool get showSpinner => _showSpinner;

  RxString get selectedCountryName => _selectedCountryName;

  RxString get selectedCountryCode => _selectedCountryCode;

  RxString get selectedCountryImage => _selectedCountryImage;

  RxInt get selectedCountryId => _selectedCountryId;

  RxInt? get selectedCountryIndex => _selectedCountryIndex;

  @override
  void onInit() async {
    _showSpinner.value = true;
    await getAppInitialData();
    await getUserProfileData();
    _showSpinner.value = false;

    _selectedCountryId.value = userProfileResModel.value.country?.id ?? 0;
    _selectedCountryName.value =
        userProfileResModel.value.country?.countryName ?? "";
    _selectedCountryCode.value =
        userProfileResModel.value.country?.countryCode ?? "";
    _selectedCountryImage.value =
        userProfileResModel.value.country?.countryImage ?? "";

    super.onInit();
  }

  void onRadioSelectionValueChange(
    String selectedCountryName,
    String selectedCountryCode,
    String selectedCountryImage,
    int selectedCountryId,
    int selectedCountryIndex,
  ) {
    _selectedCountryName.value = selectedCountryName;
    _selectedCountryCode.value = selectedCountryCode;
    _selectedCountryImage.value = selectedCountryImage;
    _selectedCountryId.value = selectedCountryId;
    _selectedCountryIndex.value = selectedCountryIndex;
  }

  final Map userProfileMap = {};
  final Map countryMap = {};
  final Map genderMap = {};
  final Map zodiacMap = {};
  final Map chineseZodiacMap = {};
  final Map smokeDurationTypeMap = {};
  final Map workoutDurationTypeMap = {};
  final Map alcoholDrinkDurationTypeMap = {};
  final Map identifyWithMap = {};
  final Map religionMap = {};
  final Map toHaveChildrenMap = {};
  final Map educationalDegreeMap = {};

  Future updateUserProfileData() async {
    _showSpinner.value = true;
    String? accessToken = SharedPreference().getAccessToken();
    Map accountSetupReqMap = {
      "user_profile": userProfileMap,
      "country": countryMap,
      "interest_type": encodedInterestList,
      "ideal_match": encodedIdealMatchList,
      "gender": genderMap,
      "interested_gender": encodedInterestedGenderList,
      "fluent_language_type": encodedFluentLanguageList,
      "zodiac": zodiacMap,
      "chinese_zodiac": chineseZodiacMap,
      "smoke_duration_type": smokeDurationTypeMap,
      "workout_duration_type": workoutDurationTypeMap,
      "alcohol_drink_duration_type": alcoholDrinkDurationTypeMap,
      "identify_with": identifyWithMap,
      "religion": religionMap,
      "to_have_children": toHaveChildrenMap,
      "educational_degree": educationalDegreeMap,
    };

    var response = await networkRequest
        .putRequest(updateUserProfile, accountSetupReqMap, header: accessToken);
    _showSpinner.value = false;
    if (response != null) {
      Get.to(GuidelinesScreen());
    } else {
      Fluttertoast.showToast(
        msg: somethingWentWrong,
      );
    }
  }

  getAppInitialData() async {
    String? accessToken = SharedPreference().getAccessToken();
    var response =
        await networkRequest.getRequest(appInitialQueries, header: accessToken);
    if (response != null) {
      appInitialModel.value = AppInitialModel.fromJson(response);
    }
  }

  getUserProfileData() async {
    String? accessToken = SharedPreference().getAccessToken();
    String? userId = SharedPreference().getUserId();
    String endPointUrl = "$getUserProfile?UserId=$userId";
    var response =
        await networkRequest.getRequest(endPointUrl, header: accessToken);
    if (response != null) {
      userProfileResModel.value = UserProfileResModel.fromJson(response);
    }
  }
}
