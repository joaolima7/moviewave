import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Alerts {
  static showGetSnackbar({
    required String title,
    required String message,
    bool error = false,
  }) =>
      Get.snackbar(
        title,
        message,
        colorText: Colors.white,
        backgroundColor: error ? Colors.redAccent : Colors.greenAccent,
        icon: Icon(error ? Icons.error : Icons.check_circle_rounded),
        backgroundGradient: LinearGradient(
            colors: [Colors.red, Colors.redAccent.withOpacity(0.5)]),
      );
}
