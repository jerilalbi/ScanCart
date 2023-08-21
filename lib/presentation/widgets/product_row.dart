// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scancart/core/fonts/fonts.dart';
import 'package:scancart/presentation/widgets/product_card.dart';

Widget ProductRow(BuildContext context,String title){
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title,style: GoogleFonts.getFont(remainFontFamily,textStyle: const TextStyle(fontSize: headingFontSize,fontWeight: FontWeight.bold)),),
        ),
        Padding(
          padding:const EdgeInsets.only(bottom: 8),
          child: SizedBox(
            height: 160,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              shrinkWrap: false,
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context,i) { return ProductCard();}),
          ),
        )
      ],
    ),
  );
}