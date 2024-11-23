import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:scanner_and_generator_qr_code/generate_qr_code/controller/controller_generate_qr_code.dart';

class GenerateQRCode extends StatelessWidget {
  GenerateQRCode({super.key});
  // Initialize the controller
  final GenerateQRController controller = Get.put(GenerateQRController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Generate QR Code')),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Use Obx() to observe changes in the qrData observable
              Obx(() {
                return controller.qrData.isNotEmpty
                    ? QrImageView(
                        data: controller.qrData
                            .value, // Now it will show the value from qrData
                        size: 200,
                      )
                    : const SizedBox.shrink();
              }),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextField(
                  // Bind the controller's TextEditingController to the TextField
                  controller: controller.urlController,
                  decoration: InputDecoration(
                    hintText: 'Enter your data',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    labelText: 'Enter your data',
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // On button press, set the QR data in the controller
                  if (kDebugMode) {
                    print("Generate QR Code");
                  }
                  controller.generateQRCode();
                },
                child: const Text('Generate QR Code'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
