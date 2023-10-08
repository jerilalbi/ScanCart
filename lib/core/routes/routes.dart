import 'package:flutter/material.dart';
import 'package:scancart/presentation/Home/home.dart';
import 'package:scancart/presentation/Product/product_screen.dart';
import 'package:scancart/presentation/Scan/ScanPage.dart';

Map<String, Widget Function(BuildContext)> routes = {
  HomePage.routeName: (context) => HomePage(),
  ScanPage.routeName : (context) => ScanPage(),
  ProductScreen.routeName : (context) => ProductScreen(),
};