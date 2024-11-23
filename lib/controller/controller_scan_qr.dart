import 'package:get/get.dart';

class ScanQRCodeController extends GetxController {
  RxString qrResult = 'Scanned Data will appear here'.obs; // Observable string

  void updateQRResult(String scannedValue) {
    qrResult.value = scannedValue;
    Get.back();
  }

  void handleError() {
    qrResult.value = 'Failed to read QR code';
  }
}
