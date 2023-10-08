import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scancart/core/colors/colors.dart';
import 'package:scancart/core/constant.dart';
import 'package:scancart/core/fonts/fonts.dart';

class ScanButton extends StatelessWidget {
  final Function() onTap;
  const ScanButton({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 220,
        height: 55,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(smallBorderRadius)),
          color: primaryColor
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("SCAN",style: GoogleFonts.getFont(baseFont,color: mainLogoColor,fontSize: bigFontSize,fontWeight: mediumFontWeight),),
            const SizedBox(width: 10,),
            Icon(Icons.qr_code_scanner,color: mainLogoColor,size: largeFontSize,)
          ],
        ),
      ),
    );
  }
}