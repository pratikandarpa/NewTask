import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practical_test/constants/app_size.dart';
import 'package:practical_test/constants/app_strings.dart';

Future<bool> checkConnectivity() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.none) {
    // showSnackBar(Get.context!, checkInternet);
    return false;
  } else {
    return true;
  }
}

Future<void> openAndCloseLoadingDialog(bool isShowHide) async {
  if (Get.overlayContext != null) {
    if (isShowHide) {
      showDialog(
        context: Get.overlayContext!,
        barrierDismissible: false,
        builder: (_) =>
            WillPopScope(
              onWillPop: () async => false,
              child: const Center(
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
      );
    } else {
      Navigator.pop(Get.overlayContext!);
    }
  }
}

void showSnackBar(BuildContext context, String message) {
  Get.snackbar(
    '',
    '',
    snackPosition: SnackPosition.BOTTOM,
    snackStyle: SnackStyle.FLOATING,
    messageText: Text(
      message,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.w400,
      ),
    ),
    titleText: Container(),
    borderRadius: size_4,
    backgroundColor: Colors.black,
    colorText: Theme.of(context).colorScheme.surface,
    isDismissible: false,
    animationDuration: const Duration(milliseconds: 500),
    duration: const Duration(seconds: 2),
    margin: const EdgeInsets.all(size_10),
  );
}