part of 'cart_bloc.dart';

class CartState {
  List<CartModel> cartItems = [];
  int totalPrice = 0;
  CartState({required this.cartItems,required this.totalPrice});
}

final class CartInitial extends CartState {
  CartInitial(): super(cartItems: [],totalPrice: 0);
}
