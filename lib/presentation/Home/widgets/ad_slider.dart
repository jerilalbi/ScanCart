// ignore_for_file: non_constant_identifier_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

Widget AdSlider(BuildContext context,List ads){
  return CarouselSlider(
    options: CarouselOptions(height: 200,viewportFraction: 1,autoPlay: true),
    items: ads.map((img) => SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Image.network(img,fit: BoxFit.cover,),
      )).toList(),
  );
}