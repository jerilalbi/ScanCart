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
    // List testImages = ["https://static.independent.co.uk/2023/05/05/12/Liverpool.jpg?width=1200","https://pbs.twimg.com/media/F4jpcr6WQAAgYbJ.jpg:large","https://assets.goal.com/v3/assets/bltcc7a7ffd2fbf71f5/blt277a88a365a7f07e/6454b1e4d191df5677113c23/GOAL_-_Multiple_Images_-_3_Stacked_-_Facebook_(89).png?auto=webp&format=pjpg&width=3840&quality=60"];
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