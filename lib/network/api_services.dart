import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/urls.dart';

class NetworkRequest extends GetConnect {
  Future postRequest(String endpoint, body, {String? header}) async {
    debugPrint("=========URL===$baseUrl$endpoint");
    debugPrint("=========Request===$body");
    final response = await post(
      '$baseUrl$endpoint',
      headers: {"Authorization": header ?? ""},
      body,
    );

    log("=========Response===${response.body}");
    debugPrint("=========Response Code===${response.statusCode}");

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }

  Future getRequest(String endpoint, {String? header}) async {
    debugPrint("=========URL===$baseUrl$endpoint");
    final response = await get(
      '$baseUrl$endpoint',
      headers: {"Authorization": header ?? ""},
    );

    log("=========Response===${response.body}");
    debugPrint("=========Response Code===${response.statusCode}");

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }

  Future putRequest(String endpoint, Map body, {String? header}) async {
    debugPrint("=========URL===$baseUrl$endpoint");
    log("=========Request===${jsonEncode(body)}===");
    final response = await put(
      '$baseUrl$endpoint',
      body,
      headers: {"Authorization": header ?? ""},
    );

    debugPrint("=========Response===${response.body}");
    debugPrint("=========Response Code===${response.statusCode}");

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }
}
