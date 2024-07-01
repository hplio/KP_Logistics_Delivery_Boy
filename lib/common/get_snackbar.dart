import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackBar {
  static normalSnackBar(String title, String message, bool isBottom) {
    return Get.snackbar(
      snackPosition: isBottom ? SnackPosition.BOTTOM : SnackPosition.TOP,
      margin: EdgeInsets.all(20),
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      backgroundGradient: LinearGradient(
        colors: [
          Color(0xFF4e54c8),
          Color(0xFF8f94fb),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    );
  }

  static errorSnackBar(String title, String message, bool isBottom) {
    return Get.snackbar(
      snackPosition: isBottom ? SnackPosition.BOTTOM : SnackPosition.TOP,
      margin: EdgeInsets.all(20),
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      backgroundGradient: LinearGradient(
        colors: [
          Color(0xFFFF0000),
          Color.fromARGB(255, 251, 41, 41),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    );
  }
}
// Color(0xFFad5389)