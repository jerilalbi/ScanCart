// ignore_for_file: file_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

class ProductModel {
    int id;
    String name;
    int price;
    int purchased;
    String category;
    String coverImage;
    String brandName;
    List<String> images;

    ProductModel({
        required this.id,
        required this.name,
        required this.price,
        required this.purchased,
        required this.category,
        required this.coverImage,
        required this.brandName,
        required this.images,
    });

    factory ProductModel.fromJson(DocumentSnapshot<Map<String, dynamic>> json) => ProductModel(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        purchased: json["purchased"],
        category: json["category"],
        coverImage: json["cover_image"],
        brandName: json["brand_name"],
        images: List<String>.from(json["images"].map((x) => x)),
    );
}
