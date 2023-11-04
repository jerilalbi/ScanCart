import 'package:flutter/material.dart';
import 'package:scancart/core/colors/colors.dart';
import 'package:scancart/presentation/Payment/widgets/Payment_sec.dart';
import 'package:scancart/presentation/Payment/widgets/upi_banner.dart';
import 'package:scancart/presentation/widgets/Appbar/app_bar.dart';

class PaymentPage extends StatelessWidget {
  static String routeName = "payment";
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: primaryColor,
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: ScreenAppBar(title: 'Payment',isCenter: false,)),
      body: Stack(
        children: [
          const PaymentSection(),
          Positioned(
            top: MediaQuery.of(context).size.height * .15,
            left: MediaQuery.of(context).size.width * .25,
            child: const UpiBanner(),
          )
        ],
      ),
    );
  }
}
