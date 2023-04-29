import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:practical_test/constants/app_strings.dart';
import 'package:practical_test/utils/utils.dart';

abstract class ApiService {
  static String BASE_URL = "https://randomuser.me/api/";
  static const SUCCESS = 200;
  static const UNAUTHORISED = 403;
  static const getUser = "?results=100";

  static Future<Map<String, dynamic>?> callGetApi(
      String endPoint, BuildContext context, Function? onError) async {

    var response =
    await Dio().get(BASE_URL + endPoint);

    if (kDebugMode) {
      print("ApiService GET Response Code : ${response.statusCode}");
    }
    if (kDebugMode) {
      print("ApiService GET Response : ${response.data.toString()}");
    }
    if (response.statusCode == SUCCESS) {
      return response.data;
    } else if (response.statusCode == UNAUTHORISED) {

      if (onError != null) {
        onError();
      }
      if (kDebugMode) {
        print("ApiService Post Response Code : ${response.statusCode}");
      }
      openAndCloseLoadingDialog(false);
      return null;
    } else {
      if (onError != null) {
        onError();
      }
      openAndCloseLoadingDialog(false);
      showSnackBar(context, somethingWentWrong);
      return null;
    }
  }
}