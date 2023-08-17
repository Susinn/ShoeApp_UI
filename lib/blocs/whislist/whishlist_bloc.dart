import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';


import '../../model/product.dart';
import '../../model/wishlistmodel.dart';

part 'whishlist_event.dart';
part 'whishlist_state.dart';

class WhishlistBloc extends Bloc<WhishlistEvent, WhishlistState> {
  WhishlistBloc() : super(WhishlistLoading()) {
    on<StartWishlist>(_onstartwishlist);
    on<AddWishlist>(_onaddwishlist);
    on<RemoveWishlist>(_onremovewishlist);
  }
  void _onstartwishlist(
      StartWishlist event, Emitter<WhishlistState> emit) async {
    emit(WhishlistLoading());
    await Future.delayed(const Duration(seconds: 2));
    try {
      emit(const WhishlistLoaded());
    } catch (e) {
      print(e);
    }
  }

  void _onaddwishlist(AddWishlist event, Emitter<WhishlistState> emit) async {
    final state = this.state;
    if (state is WhishlistLoaded) {
      try {
        emit(WhishlistLoaded(
            whishlistt: Wishlist(
                products: List.from(state.whishlistt.products)
                  ..add(event.product))));
      } catch (e) {
        print(e);
      }
    }
  }

  void _onremovewishlist(
      RemoveWishlist event, Emitter<WhishlistState> emit) async {
    final state = this.state;
    if (state is WhishlistLoaded) {
      try {
        emit(WhishlistLoaded(
            whishlistt: Wishlist(
                products: List.from(state.whishlistt.products)
                  ..remove(event.product))));
      } catch (e) {
        print(e);
      }
    }
  }
}
