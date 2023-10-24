// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:scancart/core/constant.dart';
import 'package:scancart/core/fonts/fonts.dart';
import 'package:scancart/domain/models/ProductModel.dart';
import 'package:scancart/presentation/Product/product_screen.dart';
import 'package:scancart/presentation/widgets/Product/product_card.dart';

class ProductRow extends StatelessWidget {
  final String title;
  final List<ProductModel> products;
  const ProductRow({required this.products, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
    width: MediaQuery.of(context).size.width,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(basePadding),
          child: Text(title,style: headingStyle),
        ),
        Padding(
          padding:const EdgeInsets.only(bottom: basePadding),
          child: SizedBox(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context,i) {
                return InkWell(
                  onTap: () => Navigator.pushNamed(context, ProductScreen.routeName,arguments: products[i]),
                  child: ProductCard(productCover: products[i].coverImage,productName: products[i].name,));}),
          ),
        )
      ],
    ),
  );
  }
}