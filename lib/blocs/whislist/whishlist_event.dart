part of 'whishlist_bloc.dart';

abstract class WhishlistEvent extends Equatable {
  const WhishlistEvent();

  @override
  List<Object> get props => [];
}

class StartWishlist extends WhishlistEvent {}

class AddWishlist extends WhishlistEvent {
  final Product product;

  const AddWishlist(this.product);

  @override
  List<Object> get props => [product];
}

class RemoveWishlist extends WhishlistEvent {
  final Product product;

 const  RemoveWishlist(this.product);

  @override
  List<Object> get props => [product];
}



