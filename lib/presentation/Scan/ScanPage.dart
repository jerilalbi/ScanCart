// ignore_for_file: file_names

import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scancart/application/bloc/Cart/cart_bloc.dart';
import 'package:scancart/core/colors/colors.dart';
import 'package:scancart/infrastructure/services/ScanServices.dart';
import 'package:scancart/presentation/widgets/Cart/CartOverlay.dart';

class ScanPage extends StatelessWidget {
  static String routeName = "scan";
  const ScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tertiaryColor,
      body: Stack(
        children: [
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * .4,
              width: MediaQuery.of(context).size.width * .8,
              color: primaryColor,
              child: MobileScanner(
                  controller: MobileScannerController(
                      torchEnabled: false,
                      facing: CameraFacing.back,
                      detectionTimeoutMs: 2500,
                      detectionSpeed: DetectionSpeed.normal),
                  onDetect: (onDetect) async{
                    scanAndAdd(onDetect, context);
                  }),
            ),
          ),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return state.cartItems.isNotEmpty
                  ? const Align(
                      alignment: Alignment.bottomCenter, child: CartOverlay())
                  : const SizedBox(
                      height: 0,
                    );
            },
          )
        ],
      ),
    );
  }
}
