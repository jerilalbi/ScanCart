import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scancart/application/bloc/Cart/cart_bloc.dart';
import 'package:scancart/core/colors/colors.dart';
import 'package:scancart/core/constant.dart';
import 'package:scancart/core/fonts/fonts.dart';
import 'package:scancart/presentation/Cart/cart_page.dart';

class PaymentBottomBtn extends StatelessWidget {
  const PaymentBottomBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(veryBigPadding),
      height: 80,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(bigBorderRadius),
              topRight: Radius.circular(bigBorderRadius)),
          color: primaryColor),
      child: Row(
        children: [
          InkWell(
            onTap: () => Navigator.pushReplacementNamed(context, CartPage.routeName),
            child: Container(
              width: 150,
              height: 50,
              decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.all(Radius.circular(bigBorderRadius)),
                  color: mainLogoColor),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "View Cart",
                      style: GoogleFonts.getFont(baseFont,
                          fontSize: smallFontSize,
                          fontWeight: mediumFontWeight),
                    ),
                    const Icon(Icons.shopping_cart)
                  ]),
            ),
          ),
          const Spacer(),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return Text(
                "₹ ${state.totalPrice}",
                style: GoogleFonts.getFont(baseFont,
                    fontSize: veryBigFontSize,
                    color: mainLogoColor,
                    fontWeight: mediumFontWeight),
              );
            },
          )
        ],
      ),
    );
  }
}
