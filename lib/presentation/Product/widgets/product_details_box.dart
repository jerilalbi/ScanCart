import 'package:flutter/material.dart';
import 'package:scancart/core/colors/colors.dart';
import 'package:scancart/core/constant.dart';
import 'package:scancart/domain/models/ProductModel.dart';
import 'package:scancart/infrastructure/services/ProductServices.dart';
import 'package:scancart/presentation/widgets/Product/Product_row.dart';
import 'package:scancart/presentation/Product/widgets/product_details_sec.dart';
import 'package:scancart/presentation/widgets/Shimmer/Product_row_shimmer.dart';

class ProductDescription extends StatelessWidget {
  final String productName;
  final String productBrand;
  final String productCategory;
  final int productPrice;

  const ProductDescription({
    required this.productName,
    required this.productBrand,
    required this.productCategory,
    required this.productPrice,
    super.key});

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
           ProductDetailsSec(productName: productName,productBrand: productBrand,productCategory: productCategory,productPrice: productPrice,),
           FutureBuilder(
          future: getCategoryProduct(productCategory),
           builder: (context,AsyncSnapshot<List<ProductModel>> snapshot) {
            if(snapshot.hasData){
              return ProductRow(title: "Recommended",products: snapshot.data!,);
            }else{
              return const ProductRowShimmer();
            }
           }
         ),
            SizedBox(
              height: 60,
            )
          ],
        ),
      ),
    );
  }
}