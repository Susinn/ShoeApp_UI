import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/cartmodel.dart';
import '../../model/product.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
    on<CartStarted>(_mapCartStarted);
     on<CartProductAdded>(_mapCartProductAdded);
          on<CartProductRemoved>(_mapCartProductRemoved);
  }
  void _mapCartStarted(CartStarted event, Emitter<CartState> emit) async {
     emit(CartLoading());
    await Future.delayed(const Duration(seconds: 1));
    emit(const CartLoaded());
  }
  void _mapCartProductAdded(CartProductAdded event, Emitter<CartState> emit) async {
    final state =this.state;
   if (state is CartLoaded) {
      try {
        emit(CartLoaded(
            cartModel: CartModel(
                products: List.from(state.cartModel.products)
                  ..add(event.product))));
      } catch (e) {
        print(e);
      }
    }
  }
  void _mapCartProductRemoved(CartProductRemoved event, Emitter<CartState> emit) async {
    final state =this.state;
   if (state is CartLoaded) {
      try {
        emit(CartLoaded(
            cartModel: CartModel(
                products: List.from(state.cartModel.products)
                  ..remove(event.product))));
      } catch (e) {
        print(e);
      }
    }
  }
}
