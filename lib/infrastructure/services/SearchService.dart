import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scancart/domain/models/ProductModel.dart';
import 'package:scancart/infrastructure/firebase/firebase.dart';

Future<List<ProductModel>> searchProduct(String product) async{
  try{
    QuerySnapshot<Map<String,dynamic>> snapshot = await firebase.collection("products").orderBy("name").startAt([product.toLowerCase()]).endAt(["${product.toLowerCase()}\uf8ff"]).get();
    return snapshot.docs.map((json) => ProductModel.fromJson(json)).toList();
  }catch(e){
    print(e);
  }
  throw Exception();
}