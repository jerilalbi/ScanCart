import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scancart/core/colors/colors.dart';
import 'package:scancart/core/fonts/fonts.dart';

class ProductDetailsSec extends StatelessWidget {
  const ProductDetailsSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width*.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Liverpool Home Jersey 23/24",style: GoogleFonts.getFont(baseFont,textStyle: const TextStyle(fontSize: veryBigFontSize,fontWeight: mediumFontWeight)),),
                    Text("Nike",style: GoogleFonts.getFont(baseFont,textStyle: TextStyle(fontSize: bigFontSize,fontWeight: mediumFontWeight,color: mainTextColor.withOpacity(.6))),),
                    Container(
                      height: 40,
                      width: 130,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        color: secondaryColor,
                      ),
                      child: Text("SPORTS",style: GoogleFonts.getFont(baseFont,color: mainLogoColor,fontSize: smallFontSize,fontWeight: FontWeight.bold),),
                    )
                  ],
                ),
              ),
              const Spacer(),
              Text("₹ 7480",style: GoogleFonts.getFont(baseFont,color: mainTextColor,fontSize: bigFontSize,fontWeight: mediumFontWeight),),
            ],
          );
  }
}