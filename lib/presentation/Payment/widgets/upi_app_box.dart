import 'package:flutter/material.dart';
import 'package:scancart/core/colors/colors.dart';
import 'package:scancart/core/constant.dart';

class UpiAppBox extends StatelessWidget {
  final String imageUrl;
  const UpiAppBox({required this.imageUrl,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(smallBorderRadius)),
        border: Border.all(color: primaryColor),
      ),
      child: Image.network(imageUrl,fit: BoxFit.contain),
    );
  }
}