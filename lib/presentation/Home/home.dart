import 'package:flutter/material.dart';
import 'package:scancart/core/colors/colors.dart';
import 'package:scancart/presentation/Home/widgets/Ad_slider.dart';
import 'package:scancart/presentation/Home/widgets/Product_row.dart';
import 'package:scancart/presentation/widgets/Appbar/app_bar.dart';

class HomePage extends StatelessWidget {
  static String routeName = "home";
   HomePage({super.key});

 final List ads = [
  "https://images-eu.ssl-images-amazon.com/images/G/31/img23/Fashion/GW/July/AUSmall/AF-Unrec-3000._CB600722535_.jpg",
  "https://images-eu.ssl-images-amazon.com/images/G/31/img23/Beauty/GW/ATF/Skincare-PCzzz._CB597786106_.jpg",
  "https://images-eu.ssl-images-amazon.com/images/G/31/Biss_2023/BISS_GW/GWNEW/Rec_pc_herofader3_3000-1200._CB598032350_.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppHeader(context),
      body: ListView(
        children: [
          AdSlider(ads: ads),
         const ProductRow(title: "Newly Added"),
         const ProductRow(title: "Popular"),
         const ProductRow(title: "Top Rated"),
        ],
      ),
    );
  }
}