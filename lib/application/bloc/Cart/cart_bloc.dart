import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:scancart/domain/models/CartModel.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<AddToCart>((event, emit) {
      state.cartItems!.add(event.cartModel);
      state.cartItems!.map((e) {
        state.totalPrice += e.price;
        print("price = ${state.totalPrice}");
      });
      emit(CartState(cartItems: state.cartItems,totalPrice: state.totalPrice));
    });

    on<RemoveFromCart>((event, emit) {
      state.cartItems!.removeAt(event.index);
      state.totalPrice -= state.cartItems![event.index].price;
      emit(CartState(cartItems: state.cartItems,totalPrice: state.totalPrice));
    });

    on<AddQuantity>((event,emit){
      state.cartItems![event.index].quantity++;
      state.cartItems![event.index].totalPrice = state.cartItems![event.index].price * state.cartItems![event.index].quantity;
      state.totalPrice += state.cartItems![event.index].totalPrice;
      emit(CartState(cartItems: state.cartItems,totalPrice: state.totalPrice));
    });

    on<RemoveQuantity>((event, emit) {
      state.cartItems![event.index].quantity--;      
      state.cartItems![event.index].totalPrice = state.cartItems![event.index].price * state.cartItems![event.index].quantity;
      state.totalPrice -= state.cartItems![event.index].totalPrice;
      if(state.cartItems![event.index].quantity < 1){
        RemoveFromCart(index: event.index);
      }
      emit(CartState(cartItems: state.cartItems,totalPrice: state.totalPrice));
    });
  }
}
