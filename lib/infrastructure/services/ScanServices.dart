import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scancart/domain/models/CartModel.dart';
import 'package:scancart/infrastructure/firebase/firebase.dart';

Future<CartModel> scanProduct(int id) async{
  try{
    QuerySnapshot<Map<String,dynamic>> snapshot = await firebase.collection("products").where("id",isEqualTo: id).get();
    return snapshot.docs.map((json) => CartModel.fromJson(json)).first;
  }catch (e){
    print(e);
  }
  throw Exception();
}