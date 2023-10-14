import 'package:flutter/material.dart';
import 'package:scancart/core/colors/colors.dart';
import 'package:scancart/core/constant.dart';
import 'package:scancart/presentation/widgets/Product/Product_row.dart';
import 'package:scancart/presentation/Product/widgets/product_details_sec.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(veryBigPadding),
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*.48),
      decoration:const BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(bigBorderRadius),topRight: Radius.circular(bigBorderRadius)),
        color: scaffoldColor
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
           ProductDetailsSec(),
           ProductRow(title: "Recommended"),
            SizedBox(
              height: 60,
            )
          ],
        ),
      ),
    );
  }
}