
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scancart/core/colors/colors.dart';

const String titleFont = "Geo";
const String baseFont = "Poppins";

const double smallFontSize = 15;
const double mediumFontSize = 18;
const double bigFontSize = 20;
const double veryBigFontSize = 25;
const double largeFontSize = 30;

const FontWeight smallFontWeight = FontWeight.w500;
const FontWeight mediumFontWeight = FontWeight.w600;

TextStyle titleStyle = GoogleFonts.getFont(titleFont,textStyle: const TextStyle(color: mainLogoColor,fontSize: largeFontSize));
TextStyle headingStyle = GoogleFonts.getFont(baseFont,textStyle: const TextStyle(fontSize: bigFontSize,fontWeight: FontWeight.w600));
TextStyle baseTextStyle = GoogleFonts.getFont(baseFont,textStyle: const TextStyle(fontSize: bigFontSize));
TextStyle searchTextStyle = GoogleFonts.getFont(baseFont,textStyle: const TextStyle(fontSize: mediumFontSize,color: mainLogoColor,fontWeight: mediumFontWeight));