// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scancart/core/colors/colors.dart';
import 'package:scancart/core/fonts/fonts.dart';

PreferredSizeWidget AppHeader(){
  return AppBar(
    title: Text("ScanCart",style: GoogleFonts.getFont(titleFontFamily,textStyle: const TextStyle(color: mainTextColor,fontSize: titleFontSize))),
    backgroundColor: themeColor,
    actions: const [
      SizedBox(
        width: 120,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.search,size: 30,color: mainTextColor,),
            Icon(Icons.qr_code_scanner,size: 30,color: mainTextColor,)
          ],
        ),
      )
      
    ],
  );
}