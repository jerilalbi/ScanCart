import 'package:flutter/material.dart';
import 'package:scancart/core/colors/colors.dart';
import 'package:shimmer/shimmer.dart';

class ProductRowShimmer extends StatelessWidget {
  const ProductRowShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 200,
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: ((context, index) => 
        Shimmer.fromColors(
          baseColor: Colors.black12, 
          highlightColor: scaffoldColor,
          child: const SizedBox(
            height: 150,
            width: 140,
          ))
        ),
      )
    );
  }
}