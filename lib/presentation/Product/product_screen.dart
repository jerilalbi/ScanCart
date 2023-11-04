import 'package:flutter/material.dart';
import 'package:scancart/core/colors/colors.dart';
import 'package:scancart/domain/models/ProductModel.dart';
import 'package:scancart/presentation/Cart/cart_page.dart';
import 'package:scancart/presentation/Product/widgets/circle_cart_button.dart';
import 'package:scancart/presentation/Product/widgets/product_details_box.dart';
import 'package:scancart/presentation/Product/widgets/product_image_slider.dart';
import 'package:scancart/presentation/Product/widgets/scan_button.dart';
import 'package:scancart/presentation/Scan/ScanPage.dart';

class ProductScreen extends StatelessWidget {
  static String routeName = "product";
  final ProductModel product;
  const ProductScreen({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: scaffoldColor,
      body: Stack(
        children: [
          ProductImageSlider(images: product.images),
          ProductDescription(
            productName: product.name,
            productBrand: product.brandName,
            productCategory: product.category,
            productPrice: product.price,
            ),
          Positioned(
            bottom: 15,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleCartButton(onTap: ()=> Navigator.pushNamed(context, CartPage.routeName)),
                  ScanButton(onTap: ()=> Navigator.pushNamed(context, ScanPage.routeName))
                ],
              ),
            ),
          )
        ], 
      ),
    );
  }
}