import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scancart/application/bloc/Cart/cart_bloc.dart';
import 'package:scancart/core/colors/colors.dart';
import 'package:scancart/core/constant.dart';
import 'package:scancart/core/fonts/fonts.dart';
import 'package:scancart/presentation/Payment/PaymentPage.dart';

class CartBottomButton extends StatelessWidget {
  const CartBottomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .95,
      height: 60,
      padding: const EdgeInsets.all(basePadding),
      decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(color: scaffoldColor, spreadRadius: 3, blurRadius: 3)
          ],
          color: primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(smallBorderRadius))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return Text(
                "Total: ₹ ${state.totalPrice}",
                style: GoogleFonts.getFont(baseFont,
                    color: mainLogoColor,
                    fontSize: bigFontSize,
                    fontWeight: mediumFontWeight),
              );
            },
          ),
          const Spacer(),
          InkWell(
            onTap: () => Navigator.pushNamed(context, PaymentPage.routeName),
            child: Container(
              width: 150,
              height: 50,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: secondaryColor,
                borderRadius:
                    BorderRadius.all(Radius.circular(smallBorderRadius)),
                boxShadow: [
                  BoxShadow(color: scaffoldColor, spreadRadius: 1, blurRadius: 3)
                ],
              ),
              child: Text(
                "PROCEED",
                style: GoogleFonts.getFont(baseFont,
                    color: mainLogoColor,
                    fontSize: bigFontSize,
                    fontWeight: mediumFontWeight),
              ),
            ),
          )
        ],
      ),
    );
  }
}
