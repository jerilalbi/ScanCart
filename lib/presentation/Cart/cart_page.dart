import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scancart/application/bloc/Cart/cart_bloc.dart';
import 'package:scancart/core/colors/colors.dart';
import 'package:scancart/core/constant.dart';
import 'package:scancart/core/fonts/fonts.dart';
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
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
           return state.cartItems.isNotEmpty ?
              Stack(
              children: [
                ListView.builder(
                    itemCount: state.cartItems.length,
                    itemBuilder: (context, index) => CartTile(
                          cartItem: state.cartItems[index],
                          index: index,
                        )),
                const Positioned(bottom: 5, child: CartBottomButton())
              ],
            ) :
            Center(
              child: Text("No items found",style: GoogleFonts.getFont(baseFont,fontSize: mediumFontSize,fontWeight: mediumFontWeight),),
            );
          },
        ),
      ),
    );
  }
}
