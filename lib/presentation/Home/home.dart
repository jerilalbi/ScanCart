import 'package:flutter/material.dart';
import 'package:scancart/presentation/widgets/ad_slider.dart';
import 'package:scancart/presentation/widgets/app_bar.dart';
import 'package:scancart/presentation/widgets/product_row.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});

 final List ads = [
  "https://images-eu.ssl-images-amazon.com/images/G/31/img23/Fashion/GW/July/AUSmall/AF-Unrec-3000._CB600722535_.jpg",
  "https://images-eu.ssl-images-amazon.com/images/G/31/img23/Beauty/GW/ATF/Skincare-PCzzz._CB597786106_.jpg",
  "https://images-eu.ssl-images-amazon.com/images/G/31/Biss_2023/BISS_GW/GWNEW/Rec_pc_herofader3_3000-1200._CB598032350_.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(),
      body: ListView(
        children: [
          AdSlider(context,ads),
          ProductRow(context,"Newly Added"),
          ProductRow(context,"Popular"),
          ProductRow(context,"Top Rated"),
        ],
      ),
    );
  }
}