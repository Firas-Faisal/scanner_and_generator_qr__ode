import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:scanner_and_generator_qr_code/generate_qr_code/generate_qr_code.dart';
import 'package:scanner_and_generator_qr_code/scan_qr_code.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'QR Code Generator and Scanner',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const MyHomePage()),
        GetPage(name: '/scan', page: () => ScanQRCode()),
        GetPage(name: '/generate', page: () => GenerateQRCode()),
      ],
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code Generator and Scanner'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Get.toNamed('/scan'),
              child: const Text('Scan QR Code'),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => Get.toNamed('/generate'),
              child: const Text('Generate QR Code'),
            ),
          ],
        ),
      ),
    );
  }
}
