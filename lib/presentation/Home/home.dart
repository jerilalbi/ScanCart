import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scancart/application/bloc/Cart/cart_bloc.dart';
import 'package:scancart/core/colors/colors.dart';
import 'package:scancart/domain/models/AdsModel.dart';
import 'package:scancart/domain/models/ProductModel.dart';
import 'package:scancart/infrastructure/services/AdsServices.dart';
import 'package:scancart/infrastructure/services/CommonServies.dart';
import 'package:scancart/infrastructure/services/ProductServices.dart';
import 'package:scancart/presentation/Home/widgets/Ad_slider.dart';
import 'package:scancart/presentation/widgets/Cart/CartOverlay.dart';
import 'package:scancart/presentation/widgets/Product/Product_row.dart';
import 'package:scancart/presentation/widgets/Appbar/app_bar.dart';

class HomePage extends StatefulWidget {
  static String routeName = "home";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppHeader(isHomePage: true)),
      body: Stack(
        children: [
          ListView(
            children: [
              FutureBuilder(
                  future: getAdImages(),
                  builder: (context, AsyncSnapshot<List<AdsModel>> snapshot) {
                    if (snapshot.hasData) {
                      return AdSlider(ads: snapshot.data![0].ads);
                    } else if (snapshot.connectionState ==
                            ConnectionState.done &&
                        snapshot.data!.isEmpty) {
                      return const SizedBox(
                        height: 0,
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  }),
              FutureBuilder(
                  future: getNewlyAddedProduct(),
                  builder:
                      (context, AsyncSnapshot<List<ProductModel>> snapshot) {
                    if (snapshot.hasData) {
                      return ProductRow(
                        title: "Newly Added",
                        products: snapshot.data!,
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  }),
              FutureBuilder(
                  future: getPopularProduct(),
                  builder:
                      (context, AsyncSnapshot<List<ProductModel>> snapshot) {
                    if (snapshot.hasData) {
                      return ProductRow(
                        title: "Popular",
                        products: snapshot.data!,
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  }),
              FutureBuilder(
                  future: getPromotingCategory(),
                  builder: (context, AsyncSnapshot<String> promotingCategory) {
                    if (promotingCategory.hasData) {
                      return FutureBuilder(
                          future: getCategoryProduct(promotingCategory.data!),
                          builder: (context,
                              AsyncSnapshot<List<ProductModel>> snapshot) {
                            if (snapshot.hasData) {
                              return ProductRow(
                                title: promotingCategory.data!.capitalize(),
                                products: snapshot.data!,
                              );
                            } else {
                              return const CircularProgressIndicator();
                            }
                          });
                    } else {
                      return const SizedBox(
                        height: 0,
                      );
                    }
                  }),
              BlocBuilder<CartBloc,CartState>(
                builder: (context,state){
                  return state.cartItems!.isNotEmpty 
                  ? const SizedBox(height: 70,)
                  : const SizedBox(height: 0,);
                })
            ],
          ),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return state.cartItems!.isNotEmpty ? const Align(
                  alignment: Alignment.bottomCenter,
                  child: CartOverlay()
                ) : const SizedBox(height: 0,);
            },
          )
        ],
      ),
    );
  }
}
