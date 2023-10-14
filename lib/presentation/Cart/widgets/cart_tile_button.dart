import 'package:flutter/material.dart';
import 'package:scancart/core/colors/colors.dart';

class CartButton extends StatelessWidget {
  final Function() onTap;
  final Color color;
  final IconData icon;
  const CartButton({required this.color, required this.onTap, required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(right: 5),
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        color: color
      ),
      child: Icon(icon,color: mainLogoColor,),
    );
  }
}