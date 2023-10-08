// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:scancart/core/colors/colors.dart';
import 'package:scancart/core/constant.dart';
import 'package:scancart/core/fonts/fonts.dart';
import 'package:scancart/presentation/Scan/ScanPage.dart';

PreferredSizeWidget AppHeader(BuildContext context){
  return AppBar(
    title: Text(appName,style: titleStyle ),
    backgroundColor: primaryColor,
    actions:  [
      SizedBox(
        width: 120,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
           const Icon(Icons.search,size: 30,color: mainLogoColor,),
            InkWell(
              onTap: () => Navigator.pushNamed(context, ScanPage.routeName),
              child: const Icon(Icons.qr_code_scanner,size: 30,color: mainLogoColor,))
          ],
        ),
      )
      
    ],
  );
}