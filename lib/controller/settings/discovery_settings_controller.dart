import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class DiscoverySettingsController extends GetxController {
  final RxString _currentLocation = "".obs;
  final RxBool _showSpinner = false.obs;

  RxBool get showSpinner => _showSpinner;

  RxString get currentLocation => _currentLocation;
  RangeValues selectedAge = const RangeValues(18, 30);
  RangeValues selectedLocation = const RangeValues(4, 80);

  @override
  void onInit() {
    getCurrentLocation();
    super.onInit();
  }

  Future getCurrentLocation() async {
    _showSpinner.value = true;
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (serviceEnabled) {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      } else if (permission == LocationPermission.deniedForever) {
        _showSpinner.value = false;
        return null;
      }
      return await getLocation();
    }
    return null;
  }

  Future getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      double latitude = position.latitude;
      double longitude = position.longitude;

      List<Placemark> placeMarks =
          await placemarkFromCoordinates(latitude, longitude);

      _currentLocation.value =
          "${placeMarks.first.locality}, ${placeMarks.first.administrativeArea}, ${placeMarks.first.isoCountryCode}";

      _showSpinner.value = false;
      return position;
    } catch (e) {
      debugPrint("$e");
      return null;
    }
  }
}
