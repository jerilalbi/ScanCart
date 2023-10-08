import 'package:flutter/material.dart';
import 'package:scancart/core/colors/colors.dart';
import 'package:scancart/core/fonts/fonts.dart';

class CircleCartButton extends StatelessWidget {
  final Function() onTap;
  const CircleCartButton({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: const CircleAvatar(
        radius: 30,
        backgroundColor: primaryColor,
        child: Icon(Icons.shopping_cart,color: mainLogoColor,size: largeFontSize,),
      ),
    );
  }
}