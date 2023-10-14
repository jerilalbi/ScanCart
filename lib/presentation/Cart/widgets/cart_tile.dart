import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scancart/core/colors/colors.dart';
import 'package:scancart/core/constant.dart';
import 'package:scancart/core/fonts/fonts.dart';
import 'package:scancart/presentation/Cart/widgets/cart_tile_button.dart';

class CartTile extends StatelessWidget {
  const CartTile({super.key});

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
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(smallBorderRadius),bottomLeft: Radius.circular(smallBorderRadius)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFa7HJu-yZe8RCOI2QLkZATOqgGIiWO6V2vjr_XP5wqo-v_7ogEplhKmn0Fy3b90gkNA4&usqp=CAU"))
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: basePadding,left: basePadding),
            child: SizedBox(
              width: MediaQuery.of(context).size.width*.48,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(child: Text("Liverpool Home Kit 23/24",style: GoogleFonts.getFont(baseFont,fontSize: bigFontSize,fontWeight: mediumFontWeight,color: mainLogoColor),)),
                  const SizedBox(height: 5,),
                  Row(
                    children: [
                      CartButton(color: tertiaryColor, onTap: (){}, icon: Icons.remove),
                      Container(
                        height: 30,
                        constraints: const BoxConstraints(
                          minWidth: 30
                        ),
                        margin: const EdgeInsets.only(right: 5),
                        alignment: Alignment.center,
                        child: Text("1",style: GoogleFonts.getFont(baseFont,fontSize: bigFontSize,fontWeight: mediumFontWeight,color: mainLogoColor),),
                      ),
                      CartButton(color: primaryColor, onTap: (){}, icon: Icons.add)
                    ],
                  )
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: (){}, icon: const Icon(Icons.delete_outlined,color: dangerColor,size: largeFontSize,)),
              const SizedBox(height: 15,),
              Text("₹ 7480",style: GoogleFonts.getFont(baseFont,fontSize: mediumFontSize,color: mainLogoColor,fontWeight: mediumFontWeight),)
            ],
          )
        ]),
    );
  }
}