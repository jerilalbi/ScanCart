part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class AddToCart extends CartEvent{
  final CartModel cartModel;
  AddToCart({required this.cartModel});
}

class RemoveFromCart extends CartEvent{
  final int index;
  RemoveFromCart({required this.index});
}

class AddQuantity extends CartEvent {
  final int index;
  AddQuantity({required this.index});
}

class RemoveQuantity extends CartEvent {
  final int index;
  RemoveQuantity({required this.index});
}
