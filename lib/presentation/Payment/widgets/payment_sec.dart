import 'package:flutter/material.dart';
import 'package:scancart/core/colors/colors.dart';
import 'package:scancart/core/constant.dart';
import 'package:scancart/presentation/Payment/widgets/payment_bottom_btn.dart';
import 'package:scancart/presentation/Payment/widgets/payment_tile.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * .2),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(veryBigBorderRadius),topRight: Radius.circular(veryBigBorderRadius)),
        color: scaffoldColor
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: veryBigPadding),
            child: ListView(
              children: [
                const SizedBox(height: 70,),
                PaymentTile(
                  image: "https://w7.pngwing.com/pngs/667/120/png-transparent-google-pay-2020-hd-logo.png",
                  title: "Google Pay",
                  onTap: (){},
                ),
                PaymentTile(
                  image: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/24/Paytm_Logo_%28standalone%29.svg/2560px-Paytm_Logo_%28standalone%29.svg.png",
                  title: "PayTm",
                  onTap: (){},
                ),
                PaymentTile(
                  image: "https://uxwing.com/wp-content/themes/uxwing/download/brands-and-social-media/phonepe-icon.png",
                  title: "PhonePe",
                  onTap: (){},
                ),
              ],
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: PaymentBottomBtn(),
          )
        ],
      ),
    );
  }
}