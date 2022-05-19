import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UiResponses {
  showSucessMessage(message) {
    Get.rawSnackbar(message: message, backgroundColor: Colors.green);
  }

  showFailedMessage(message) {
    Get.rawSnackbar(message: message, backgroundColor: Colors.red);
  }
}
