import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scancart/application/bloc/Cart/cart_bloc.dart';
import 'package:scancart/domain/models/CartModel.dart';
import 'package:scancart/infrastructure/firebase/firebase.dart';
import 'package:scancart/infrastructure/services/CommonServies.dart';

Future<CartModel> scanProduct(int id) async {
  try {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await firebase.collection("products").where("id", isEqualTo: id).get();
    return snapshot.docs.map((json) => CartModel.fromJson(json)).first;
  } catch (e) {
    print(e);
  }
  showToast("No Product Found");
  throw Exception();
}

CartModel? cartModel;

void scanAndAdd(BarcodeCapture onDetect, BuildContext context) async {
  final List<Barcode> barcodes = onDetect.barcodes;
  for (final barcode in barcodes) {
    if (isNumeric(barcode.rawValue.toString())) {
      print('Barcode found! ${barcode.displayValue}');

      List<CartModel> cartItems = context.read<CartBloc>().state.cartItems;
      if (cartItems.isNotEmpty) {
        for (CartModel value in cartItems) {
          if (value.id.toString() == barcode.displayValue) {
            context
                .read<CartBloc>()
                .add(AddQuantity(index: cartItems.indexOf(value)));
            showToast("Product Added");
          } else {
            CartModel cartItem =
            await scanProduct(int.parse(barcode.displayValue!));
        if (cartItem.name.isNotEmpty) {
          context.read<CartBloc>().add(AddToCart(cartModel: cartItem));
          showToast("Product Added");
        }
          }
        }
      } else {
        CartModel cartItem =
            await scanProduct(int.parse(barcode.displayValue!));
        if (cartItem.name.isNotEmpty) {
          context.read<CartBloc>().add(AddToCart(cartModel: cartItem));
          showToast("Product Added");
        }
      }
    }
  }
}
