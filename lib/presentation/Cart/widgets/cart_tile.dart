import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scancart/application/bloc/Cart/cart_bloc.dart';
import 'package:scancart/core/colors/colors.dart';
import 'package:scancart/core/constant.dart';
import 'package:scancart/core/fonts/fonts.dart';
import 'package:scancart/domain/models/CartModel.dart';
import 'package:scancart/presentation/Cart/widgets/cart_tile_button.dart';

class CartTile extends StatelessWidget {
  final CartModel? cartItem;
  final int index;
  const CartTile({required this.cartItem, required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .9,
      height: 120,
      margin: const EdgeInsets.only(top: bigPadding),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(smallBorderRadius)),
        color: secondaryColor
      ),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 120,
            decoration:  BoxDecoration(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(smallBorderRadius),bottomLeft: Radius.circular(smallBorderRadius)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(cartItem!.coverImage))
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: basePadding,left: basePadding),
            child: SizedBox(
              width: MediaQuery.of(context).size.width*.48,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(child: Text(cartItem!.name,style: GoogleFonts.getFont(baseFont,fontSize: bigFontSize,fontWeight: mediumFontWeight,color: mainLogoColor),)),
                  const SizedBox(height: 5,),
                  Row(
                    children: [
                      CartButton(
                        color: tertiaryColor,
                        onTap: (){
                          context.read<CartBloc>().add(RemoveQuantity(index: index));
                        },
                        icon: Icons.remove),
                      Container(
                        height: 30,
                        constraints: const BoxConstraints(
                          minWidth: 30
                        ),
                        margin: const EdgeInsets.only(right: 5),
                        alignment: Alignment.center,
                        child: Text("${cartItem!.quantity}",style: GoogleFonts.getFont(baseFont,fontSize: bigFontSize,fontWeight: mediumFontWeight,color: mainLogoColor),),
                      ),
                      CartButton(
                        color: primaryColor,
                        onTap: (){
                          context.read<CartBloc>().add(AddQuantity(index: index));
                        },
                        icon: Icons.add)
                    ],
                  )
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: (){
                context.read<CartBloc>().add(RemoveFromCart(index: index));
              }, icon: const Icon(Icons.delete_outlined,color: dangerColor,size: largeFontSize,)),
              const SizedBox(height: 15,),
              Text("₹ ${cartItem!.totalPrice}",style: GoogleFonts.getFont(baseFont,fontSize: mediumFontSize,color: mainLogoColor,fontWeight: mediumFontWeight),)
            ],
          )
        ]),
    );
  }
}