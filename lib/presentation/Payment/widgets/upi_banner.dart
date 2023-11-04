import 'package:flutter/material.dart';
import 'package:scancart/core/colors/colors.dart';
import 'package:scancart/core/constant.dart';

class UpiBanner extends StatelessWidget {
  const UpiBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*.9,
      height: 70,
      margin: const EdgeInsets.only(top: basePadding),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(smallBorderRadius)),
        border: Border.all(color: primaryColor)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.network("https://www.nicepng.com/png/detail/360-3606562_bhim-logo-bhim-upi.png",fit: BoxFit.contain,width: 100,),
          Image.network("https://assets.stickpng.com/images/60e7f964711cf700048b6a6a.png",fit: BoxFit.contain,width: 100,height: 50,),
          Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/2/24/Paytm_Logo_%28standalone%29.svg/2560px-Paytm_Logo_%28standalone%29.svg.png",fit: BoxFit.contain,width: 100,),
        ],
      ),
    );
  }
}