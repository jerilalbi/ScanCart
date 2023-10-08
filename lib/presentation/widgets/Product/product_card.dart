// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:scancart/core/colors/colors.dart';

Widget ProductCard(){
 return Container(
  height: 150,
  width: 100,
  margin: const EdgeInsets.symmetric(horizontal: 8),
  decoration: const BoxDecoration(
    image: DecorationImage(
      fit: BoxFit.cover,
      image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFa7HJu-yZe8RCOI2QLkZATOqgGIiWO6V2vjr_XP5wqo-v_7ogEplhKmn0Fy3b90gkNA4&usqp=CAU")),
    borderRadius: BorderRadius.all(Radius.circular(10)),
    color: secondaryColor
  ),
 );
}