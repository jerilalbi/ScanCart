import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scancart/domain/models/AdsModel.dart';
import 'package:scancart/infrastructure/firebase/firebase.dart';

Future<List<AdsModel>> getAdImages() async {
  try{
    QuerySnapshot<Map<String,dynamic>> snapshot = await firebase.collection("banner_ads").get();
    return snapshot.docs.map((json) => AdsModel.fromJson(json)).toList();
  }catch (e){
    print(e);
  }
  throw Exception();
}

Future<String> getPromotingCategory() async {
  try{
    QuerySnapshot<Map<String,dynamic>> snapshot = await firebase.collection("categories").get();
      String data = snapshot.docs[0]["promoting_category"];
      return data;
  }catch (e){
    print(e);
  }
  throw Exception();
}