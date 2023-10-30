// ignore_for_file: file_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

CartModel productModelFromJson(String str) => CartModel.fromJson(json.decode(str));

class CartModel {
    int id;
    String name;
    int price;
    int purchased;
    int quantity = 1;
    int totalPrice = 0;
    String coverImage;

    CartModel({
        required this.id,
        required this.name,
        required this.price,
        required this.purchased,
        required this.coverImage,
    });

    factory CartModel.fromJson(DocumentSnapshot<Map<String, dynamic>> json) => CartModel(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        purchased: json["purchased"],
        coverImage: json["cover_image"],
    );
}
