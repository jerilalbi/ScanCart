part of 'cart_bloc.dart';

class CartState {
  final List? cartItems;
  CartState({this.cartItems});
}

final class CartInitial extends CartState {
  CartInitial(): super(cartItems: []);
}
