import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scancart/application/bloc/Cart/cart_bloc.dart';
import 'package:scancart/core/colors/colors.dart';
import 'package:scancart/core/constant.dart';
import 'package:scancart/core/fonts/fonts.dart';
import 'package:scancart/presentation/Cart/cart_page.dart';

class CartOverlay extends StatelessWidget {
  const CartOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, CartPage.routeName),
      child: Container(
        width: MediaQuery.of(context).size.width * .95,
        margin: const EdgeInsets.only(bottom: basePadding),
        padding: const EdgeInsets.symmetric(horizontal: basePadding),
        height: 60,
        decoration: const BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(smallBorderRadius))),
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            return Row(
              children: [
                Text(
                  "Total: ₹ ${state.totalPrice}",
                  style: GoogleFonts.getFont(baseFont,
                      color: mainLogoColor,
                      fontWeight: mediumFontWeight,
                      fontSize: mediumFontSize),
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: bigFontSize,
                  color: mainLogoColor,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
