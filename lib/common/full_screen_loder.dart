import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:la_logistics/common/loder.dart';

class KFullScreenLoder {
  static void openLodingDialog(String taxt, String animation) {
  // static void openLodingDialog(String taxt, String animation ,BuildContext context) {
    showDialog(
      context: Get.context!,
      // context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                width: double.infinity,
                height: double.maxFinite,
                child:Column(
                  children: [
                    const SizedBox(
                      height: 250,
                    ),
                    KAnimationLoader(animation: animation, text: taxt,)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
