// ignore_for_file: file_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

AdsModel adsModelFromJson(String str) => AdsModel.fromJson(json.decode(str));

class AdsModel {
    List<String> ads;

    AdsModel({
        required this.ads,
    });

    factory AdsModel.fromJson(DocumentSnapshot<Map<String, dynamic>> json) => AdsModel(
        ads: List<String>.from(json["ads"].map((x) => x)),
    );
}
