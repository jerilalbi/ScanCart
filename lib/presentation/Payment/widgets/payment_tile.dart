import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scancart/core/constant.dart';
import 'package:scancart/core/fonts/fonts.dart';

class PaymentTile extends StatelessWidget {
  final String image;
  final String title;
  final Function() onTap;
  const PaymentTile({required this.image,required this.title,required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: veryBigPadding),
        margin: const EdgeInsets.only(bottom: bigPadding),
        height: 70,
        child: Row(
          children: [
            Image.network(image,height: 70,width: 70,),
            const SizedBox(width: 25,),
            Text(title,style: GoogleFonts.getFont(baseFont,fontSize: mediumFontSize,fontWeight: mediumFontWeight),)
          ],
        ),
      ),
    );
  }
}