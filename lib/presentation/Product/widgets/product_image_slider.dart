import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:scancart/core/colors/colors.dart';

class ProductImageSlider extends StatelessWidget {
  final List images;
  const ProductImageSlider({required this.images, super.key});

  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    return Container(
      height: MediaQuery.of(context).size.height*.5,
      color: secondaryColor,
      child: Stack(
        children: [
          CarouselSlider(
          options: CarouselOptions(
          height: MediaQuery.of(context).size.height*.5,
          viewportFraction: 1,
          enableInfiniteScroll: false
          ),
          items: images.map((img) => SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Image.network(img,fit: BoxFit.cover,),
          )).toList(),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for(int i = 0; i < images.length; i++)
              Container(
                width: 10,
                height: 10,
                margin: EdgeInsets.only(right: 4,bottom: MediaQuery.of(context).size.height*.03),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: i == currentIndex ? primaryColor : Colors.grey,
                ),
              )
            ],
          ),
        )
        ],
      ),
    );
  }
}