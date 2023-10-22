import 'package:flutter/material.dart';
import 'package:scancart/core/colors/colors.dart';
import 'package:scancart/core/constant.dart';
import 'package:scancart/presentation/Cart/widgets/cart_bottom_btn.dart';
import 'package:scancart/presentation/Cart/widgets/cart_tile.dart';
import 'package:scancart/presentation/widgets/Appbar/app_bar.dart';

class CartPage extends StatelessWidget {
  static String routeName = "cart_page";
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppHeader(isHomePage: false)),
      body: Padding(
        padding: const EdgeInsets.all(basePadding),
        child: Stack(
          children: [
            ListView.builder(
              itemCount: 6,
              itemBuilder: (context,index)=> CartTile()),
              Positioned(
                bottom: 5,
                child: CartBottomButton())
          ],
        ),
      ),
    );
  }
}