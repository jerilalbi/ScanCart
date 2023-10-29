import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scancart/domain/models/ProductModel.dart';
import 'package:scancart/infrastructure/firebase/firebase.dart';

Future<List<ProductModel>> getNewlyAddedProduct() async{
  try{
    QuerySnapshot<Map<String,dynamic>> snapshot = await firebase.collection("products").get();
    return snapshot.docs.map((json) => ProductModel.fromJson(json)).toList();
  }catch (e){
    print(e);
  }
  throw Exception();
}

Future<List<ProductModel>> getPopularProduct() async{
  try{
    QuerySnapshot<Map<String,dynamic>> snapshot = await firebase.collection("products").orderBy("purchased",descending: true).get();
    return snapshot.docs.map((json) => ProductModel.fromJson(json)).toList();
  }catch (e){
    print(e);
  }
  throw Exception();
}

Future<List<ProductModel>> getCategoryProduct(String category) async{
  try{
    QuerySnapshot<Map<String,dynamic>> snapshot = await firebase.collection("products").where("category",isEqualTo: category).orderBy("purchased").get();
    return snapshot.docs.map((json) => ProductModel.fromJson(json)).toList();
  }catch (e){
    print(e);
  }
  throw Exception();
}