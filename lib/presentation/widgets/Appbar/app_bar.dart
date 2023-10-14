// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:scancart/core/colors/colors.dart';
import 'package:scancart/core/fonts/fonts.dart';
import 'package:scancart/presentation/Scan/ScanPage.dart';
import 'package:scancart/presentation/widgets/Appbar/slide_animation.dart';

PreferredSizeWidget AppHeader({BuildContext? context,bool? isHomePage}){
  return AppBar(
    // title: Text(appName,style: titleStyle ),
    title: SlideAnimation(
      child: TextFormField(
        cursorColor: mainLogoColor,
        style: searchTextStyle,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintStyle: searchTextStyle,
          suffixIcon: const Icon(Icons.search,color: mainLogoColor,size: 25,),
          hintText: "Search Here"
          ),
          ),
    ),
    backgroundColor: primaryColor,
    automaticallyImplyLeading: false,
    actions:  [
      Visibility(
        visible: false,
        child: SizedBox(
          width: 120,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
             isHomePage! ? 
             InkWell(
              onTap: (){},
              child: const Icon(Icons.search,size: 30,color: mainLogoColor,)) 
             : const SizedBox(width: 0,),
              InkWell(
                onTap: () => Navigator.pushNamed(context!, ScanPage.routeName),
                child: const Icon(Icons.qr_code_scanner,size: 30,color: mainLogoColor,))
            ],
          ),
        ),
      )
      
    ],
  );
}