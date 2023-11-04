import 'package:flutter/material.dart';
import 'package:scancart/core/colors/colors.dart';
import 'package:scancart/core/constant.dart';
import 'package:scancart/presentation/Payment/widgets/amount_section.dart';
import 'package:scancart/presentation/Payment/widgets/upi_app_box.dart';
import 'package:scancart/presentation/Payment/widgets/upi_banner.dart';

class PaymentPage extends StatelessWidget {
  static String routeName = "payment";
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: scaffoldColor,
      body: Padding(
        padding:  EdgeInsets.all(basePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AmountSec(),
            const Align(
              alignment: Alignment.center,
              child: UpiBanner()),
            const SizedBox(height: 10,),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 400,
              child: GridView.count(
                crossAxisCount: 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  UpiAppBox(imageUrl: "https://assets.stickpng.com/images/60e7f964711cf700048b6a6a.png"),
                  UpiAppBox(imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/24/Paytm_Logo_%28standalone%29.svg/2560px-Paytm_Logo_%28standalone%29.svg.png"),
                  UpiAppBox(imageUrl: "https://w7.pngwing.com/pngs/345/591/png-transparent-phonepe-hd-logo.png"),
                  UpiAppBox(imageUrl: "https://www.nicepng.com/png/detail/360-3606562_bhim-logo-bhim-upi.png"),                ]
                ),
            )
          ],
        ),
      ),
    );
  }
}
