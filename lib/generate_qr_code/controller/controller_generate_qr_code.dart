import 'package:get/get.dart';
import 'package:flutter/material.dart';

class GenerateQRController extends GetxController {
  // TextEditingController for managing the text input
  final TextEditingController urlController = TextEditingController();

  // Observable String to store the QR data (the content for the QR code)
  RxString qrData = ''.obs;

  // Method to update the QR data when the button is pressed
  void generateQRCode() {
    if (urlController.text.isNotEmpty) {
      qrData.value = urlController.text; // Set the QR data
    }
  }

  @override
  void onClose() {
    // Dispose the controller to release resources
    urlController.dispose();
    super.onClose();
  }
}
