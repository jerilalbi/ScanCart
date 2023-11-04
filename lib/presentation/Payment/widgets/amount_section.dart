import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scancart/application/bloc/Cart/cart_bloc.dart';
import 'package:scancart/core/fonts/fonts.dart';

class AmountSec extends StatelessWidget {
  const AmountSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Amount",
          style: GoogleFonts.getFont(baseFont,
              fontSize: mediumFontSize, fontWeight: smallFontWeight),
        ),
        BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            return Text(
              "₹ ${state.totalPrice}",
              style: GoogleFonts.getFont(baseFont,
                  fontSize: bigFontSize, fontWeight: mediumFontWeight),
            );
          },
        )
      ],
    );
  }
}
