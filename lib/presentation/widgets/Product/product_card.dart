// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scancart/core/colors/colors.dart';
import 'package:scancart/core/constant.dart';
import 'package:scancart/core/fonts/fonts.dart';
import 'package:scancart/infrastructure/services/CommonServies.dart';

class ProductCard extends StatelessWidget {
  final String productCover;
  final String productName;
  const ProductCard({required this.productCover, required this.productName, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 170,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(verySmallBorderRadius)),
        color: scaffoldColor,
        boxShadow: [
          BoxShadow(color: primaryColor,spreadRadius: 1,blurRadius: 3),
        ]
      ),
      padding: const EdgeInsets.all(verySmallPadding),
      margin: const EdgeInsets.symmetric(horizontal: basePadding,vertical: 2),
      child: Column(
        children: [
          Container(
            height: 150,
            width: 140,
            decoration:  BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        productCover)),
                color: secondaryColor,
              ),
            margin: const EdgeInsets.only(bottom: verySmallPadding),
          ),
          Flexible(child: Text(productName.capitalizeFirst(),style: GoogleFonts.getFont(baseFont,fontSize: smallFontSize),overflow: TextOverflow.ellipsis,))
        ],
      ),
    );
  }
}
