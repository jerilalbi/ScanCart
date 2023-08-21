// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

Widget ProductCard(){
 return Container(
  height: 150,
  width: 100,
  margin: const EdgeInsets.symmetric(horizontal: 8),
  decoration: const BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    color: Colors.blue
  ),
 );
}