// ignore_for_file: file_names

import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:flutter/material.dart';
import 'package:scancart/core/colors/colors.dart';

class ScanPage extends StatelessWidget {
  static String routeName = "scan";
  const ScanPage({super.key});

  bool isNumeric(String str) {
    RegExp _numeric = RegExp(r'^-?[0-9]+$');
    return _numeric.hasMatch(str);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: tertiaryColor,
          body: Center(
            child: Container(
              height: MediaQuery.of(context).size.height * .4,
              width: MediaQuery.of(context).size.width * .8,
              color: primaryColor,
              child: MobileScanner(
                  controller: MobileScannerController(
                      torchEnabled: false,
                      facing: CameraFacing.back,
                      detectionSpeed: DetectionSpeed.normal),
                  onDetect: (onDetect) {
                    final List<Barcode> barcodes = onDetect.barcodes;
                    for (final barcode in barcodes) {
                      if(isNumeric(barcode.rawValue.toString())){
                        print('Barcode found! ${barcode.displayValue}');
                      }
                    }
                  }),
            ),
          ),
        );
  }
}
