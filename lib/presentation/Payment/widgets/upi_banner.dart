import 'package:flutter/material.dart';
import 'package:scancart/core/colors/colors.dart';
import 'package:scancart/core/constant.dart';

class UpiBanner extends StatelessWidget {
  const UpiBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*.5,
      height: 100,
      padding: const EdgeInsets.all(basePadding),
      decoration: const BoxDecoration(
        borderRadius:  BorderRadius.all(Radius.circular(mediumBorderRadius)),
        color: mainLogoColor,
      ),
      child: Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/e/e1/UPI-Logo-vector.svg/1280px-UPI-Logo-vector.svg.png"),
    );
  }
}