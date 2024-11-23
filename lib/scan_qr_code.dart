import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:scanner_and_generator_qr_code/controller/controller_scan_qr.dart';

class ScanQRCode extends StatelessWidget {
  final ScanQRCodeController qrController = Get.put(ScanQRCodeController());

  ScanQRCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code Scanner'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            // Title
            const Text(
              'Result:',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            // Reactive display of QR code result
            Obx(() => Text(
                  qrController.qrResult.value, // Reactive binding to the result
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                )),
            const SizedBox(height: 30),
            // Button to scan QR code
            ElevatedButton(
              onPressed: () async {
                await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AiBarcodeScanner(
                      onDispose: () {
                        debugPrint("Scanner disposed");
                      },
                      hideGalleryButton: false,
                      controller: MobileScannerController(
                        detectionSpeed: DetectionSpeed.noDuplicates,
                      ),
                      onDetect: (BarcodeCapture capture) {
                        final String? scannedValue =
                            capture.barcodes.first.rawValue;
                        if (scannedValue != null && scannedValue.isNotEmpty) {
                          qrController.updateQRResult(scannedValue);
                        } else {
                          qrController.handleError();
                        }
                      },
                      validator: (value) {
                        // Optional: Validate the scanned value
                        if (value.barcodes.isEmpty) return false;
                        return true;
                      },
                    ),
                  ),
                );
              },
              child: const Text('Scan Code'),
            ),
          ],
        ),
      ),
    );
  }
}
